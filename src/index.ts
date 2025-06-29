import { Container, loadBalance, getContainer } from "@cloudflare/containers";
import { Hono } from "hono";

export class MyContainer extends Container {
  // 容器监听的端口（默认：8080）
  defaultPort = 8080;
  // 容器因不活动而休眠的时间（默认：30s）
  sleepAfter = "2m";
  // 传递给容器的环境变量
  envVars = {
    MESSAGE: "我是通过容器类传入的!",
  };

  // 可选的生命周期钩子
  override onStart() {
    console.log("容器成功启动");
  }

  override onStop() {
    console.log("容器成功关闭");
  }

  override onError(error: unknown) {
    console.log("容器错误:", error);
  }
}

/**
 * 程序入口
 *  创建Hono应用程序，并为Cloudflare Workers使用适当的类型
  */
const app = new Hono<{
  Bindings: { MY_CONTAINER: DurableObjectNamespace<MyContainer> };
}>();

// 带有可用端点的主路由
app.get("/", (c) => {
  return c.text(
    "可用 endpoints:\n" +
      "GET /container/<ID> - 为每个ID启动一个容器，并设置2m超时\n" +
      "GET /lb - 跨多个容器的负载平衡请求\n" +
      "GET /error - 启动一个出错的容器（演示错误处理）\n" +
      "GET /singleton - 获取单个特定容器实例",
  );
});

// 使用容器ID将请求路由到特定容器
app.get("/container/:id", async (c) => {
  const id = c.req.param("id");
  const containerId = c.env.MY_CONTAINER.idFromName(`/container/${id}`);
  const container = c.env.MY_CONTAINER.get(containerId);
  return await container.fetch(c.req.raw);
});

// 演示错误处理——该路由在容器中强制panic
app.get("/error", async (c) => {
  const container = getContainer(c.env.MY_CONTAINER, "error-test");
  return await container.fetch(c.req.raw);
});

// 跨多个容器的负载平衡请求
app.get("/lb", async (c) => {
  const container = await loadBalance(c.env.MY_CONTAINER, 3);
  return await container.fetch(c.req.raw);
});

// 获取单个容器实例（单例模式）
app.get("/singleton", async (c) => {
  const container = getContainer(c.env.MY_CONTAINER);
  return await container.fetch(c.req.raw);
});

export default app;
