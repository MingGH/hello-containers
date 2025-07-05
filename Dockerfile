FROM scratch
COPY code-with-quarkus-1.0.0-SNAPSHOT-runner /code-with-quarkus-1.0.0-SNAPSHOT-runner

EXPOSE 8080

# Run
CMD ["/code-with-quarkus-1.0.0-SNAPSHOT-runner"]