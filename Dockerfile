FROM ghcr.io/apache/shardingsphere-agent:aa99ff660c6ad27cd9e7ae4f4ab9d7472ec47bef
COPY ./target/*.jar /app.jar
COPY ./custom-agent.yaml /usr/agent/conf/agent.yaml
ENTRYPOINT ["java","-javaagent:/usr/agent/shardingsphere-agent-5.5.1-SNAPSHOT.jar","-jar","/app.jar"]
