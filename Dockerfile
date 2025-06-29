# 构建阶段：使用 Maven + JDK 21 编译 native 可执行文件
FROM maven:3.9.10-eclipse-temurin-21-alpine AS build

# 安装必要依赖（如 native-image 需要的依赖）
RUN apk add --no-cache bash coreutils gcc musl-dev zlib-dev curl

# 设置工作目录
WORKDIR /code

# 复制整个 quarkus 项目目录（在上层目录中）
COPY code-with-quarkus /code

# 构建 native 可执行文件（GraalVM 构建托管在容器里）
RUN ./mvn package -Dnative -Dquarkus.native.container-build=true

# 运行阶段：使用 distroless 镜像运行编译好的 native 可执行文件
FROM gcr.io/distroless/base-debian12

# 将原生二进制从构建阶段复制过来（路径根据 Quarkus 项目 artifactId 定）
COPY --from=build /code/target/code-with-quarkus-*-runner /app/code-with-quarkus

# 使用 8080 端口
EXPOSE 8080

# 设置执行权限并运行
ENTRYPOINT ["/app/code-with-quarkus"]