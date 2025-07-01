# 运行阶段：使用 distroless 镜像运行编译好的 native 可执行文件
FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY code-with-quarkus-1.0.0-SNAPSHOT-runner.jar /app/code-with-quarkus-1.0.0-SNAPSHOT-runner.jar

# 使用 8080 端口
EXPOSE 8080

# 设置执行权限并运行
ENTRYPOINT ["java", "-jar", "/app/code-with-quarkus-1.0.0-SNAPSHOT-runner.jar"]
