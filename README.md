# Containers Starter

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/cloudflare/templates/tree/main/containers-template)

![Containers Template Preview](https://imagedelivery.net/_yJ02hpOMj_EnGvsU2aygw/5aba1fb7-b937-46fd-fa67-138221082200/public)

<!-- dash-content-start -->

This is a [Container](https://developers.cloudflare.com/containers/) starter template.

它演示了基本的容器配置、单个容器的启动和路由、多个容器的负载平衡、在容器状态变化时运行基本钩子。

<!-- dash-content-end -->

在此版本库之外，您可以使用 [C3](https://developers.cloudflare.com/pages/get-started/c3/)（"create-cloudflare "CLI）使用此模板启动一个新项目：

```bash
npm create cloudflare@latest -- --template=cloudflare/templates/containers-template
```

## Getting Started

First, run:

```bash
npm install
# or
yarn install
# or
pnpm install
# or
bun install
```

然后运行开发服务器（使用您选择的包管理器）：

```bash
npm run dev
```

Open [http://localhost:8787](http://localhost:8787) with your browser to see the result.

您可以通过修改 `src/index.ts` 开始编辑 Worker，也可以通过编辑 `container_src` 开始编辑 Container。
内容开始编辑容器。

## Deploying To Production

| Command          | Action                                |
| :--------------- | :------------------------------------ |
| `npm run deploy` | Deploy your application to Cloudflare |

## Learn More

To learn more about Containers, take a look at the following resources:

- [Container Documentation](https://developers.cloudflare.com/containers/) - learn about Containers
- [Container Class](https://github.com/cloudflare/containers) - learn about the Container helper class

Your feedback and contributions are welcome!
