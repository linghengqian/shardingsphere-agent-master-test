# shardingsphere-agent-master-test

- For https://github.com/apache/shardingsphere/issues/32793 .

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.
- The Jaeger UI is at `http://localhost:16686/`, and the ingestion backend that accepts data over the OpenTelemetry
  protocol over GRPC is at `http://localhost:4317`.

```shell
sdk install java 22.0.2-graalce

git clone git@github.com:apache/shardingsphere.git
cd ./shardingsphere/
git reset --hard aa99ff660c6ad27cd9e7ae4f4ab9d7472ec47bef
sdk use java 22.0.2-graalce
./mvnw clean install -Prelease -T1C -DskipTests -Djacoco.skip=true -Dcheckstyle.skip=true -Drat.skip=true -Dmaven.javadoc.skip=true
cd ../

docker network create lingh-test
docker run --rm -d \
  --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -p 16686:16686 \
  -p 4317:4317 \
  -p 4318:4318 \
  -p 9411:9411 \
  --network lingh-test \
  jaegertracing/all-in-one:1.60.0

git clone git@github.com:linghengqian/shardingsphere-agent-master-test.git
cd ./shardingsphere-agent-master-test/
./mvnw clean package -DskipTests && docker build -t linghengqian/shardingsphere-agent-master-test:latest .
docker run -p 8080:8080 --network lingh-test linghengqian/shardingsphere-agent-master-test:latest
```

- The error log is as follows.

```shell
Sep 21, 2024 2:48:53 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.1-SNAPSHOT.jar
Sep 21, 2024 2:48:53 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.1-SNAPSHOT.jar
Sep 21, 2024 2:48:53 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.1-SNAPSHOT.jar
Sep 21, 2024 2:48:53 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.1-SNAPSHOT.jar
Sep 21, 2024 2:48:53 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.1-SNAPSHOT.jar

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/

 :: Spring Boot ::                (v3.3.3)

2024-09-21T02:48:54.579Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Starting ShardingsphereAgentMasterTestApplication v0.0.1-SNAPSHOT using Java 22.0.2 with PID 1 (/app.jar started by root in /)
2024-09-21T02:48:54.595Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : No active profile set, falling back to 1 default profile: "default"
2024-09-21T02:48:55.954Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
2024-09-21T02:48:55.968Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2024-09-21T02:48:55.968Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.28]
2024-09-21T02:48:55.998Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2024-09-21T02:48:56.000Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1147 ms
2024-09-21T02:48:56.723Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
2024-09-21T02:48:56.803Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
2024-09-21T02:48:56.818Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Started ShardingsphereAgentMasterTestApplication in 2.684 seconds (process running for 3.623)
2024-09-21T02:48:56.907Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
2024-09-21T02:48:57.219Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
2024-09-21T02:48:57.365Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:config user=SA
2024-09-21T02:48:57.367Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
2024-09-21T02:48:57.416Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Starting...
2024-09-21T02:48:57.422Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-3 - Added connection conn1: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
2024-09-21T02:48:57.423Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Start completed.
2024-09-21T02:48:58.551Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.PoolBase          : HikariPool-1 - Driver does not support get/set network timeout for connections. (getNetworkTimeout)
2024-09-21T02:48:58.553Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@5e528476
2024-09-21T02:48:58.556Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
2024-09-21T02:48:58.580Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] .a.s.a.c.p.PluginLifecycleServiceManager : Start plugin: OpenTelemetry
2024-09-21T02:48:58.999Z ERROR 1 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the pre-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.context.ImplicitContextKeyed.storeInContext(org.apache.shardingsphere.shade.io.opentelemetry.context.Context)" because "value" is null.
2024-09-21T02:48:59.572Z ERROR 1 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the post-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.api.trace.Span.setStatus(org.apache.shardingsphere.shade.io.opentelemetry.api.trace.StatusCode)" because "span" is null.
2024-09-21T02:50:03.992Z  WARN 1 --- [shardingsphere-agent-master-test] [alhost:4317/...] o.a.s.s.i.o.e.i.grpc.GrpcExporter        : Failed to export metrics. Server responded with gRPC status code 2. Error message: Failed to connect to localhost/[0:0:0:0:0:0:0:1]:4317
```
