# 使用稳定的 Debian 作为基础镜像
FROM debian:bullseye

# 设置工作目录（可选但推荐）
WORKDIR /app

# 拷贝可执行文件到镜像中
COPY code-with-quarkus-1.0.0-SNAPSHOT-runner .

# 授权运行（如果不是静态编译或者缺权限）
RUN chmod +x code-with-quarkus-1.0.0-SNAPSHOT-runner

# EXPOSE 是声明用途，不一定开放，需要 -p 映射端口
EXPOSE 8080

# 启动你的应用
ENTRYPOINT ["./code-with-quarkus-1.0.0-SNAPSHOT-runner"]