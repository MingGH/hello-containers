# 运行阶段：使用 distroless 镜像运行编译好的 native 可执行文件
FROM gcr.io/distroless/base-debian12

WORKDIR /app

COPY code-with-quarkus/application /app

# 使用 8080 端口
EXPOSE 8080

# 设置执行权限并运行
ENTRYPOINT ["/app/application"]