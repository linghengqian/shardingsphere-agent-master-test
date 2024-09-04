# shardingsphere-agent-master-test

- For https://github.com/apache/shardingsphere/issues/32793 .

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.
- The Jaeger UI is at `http://localhost:16686/`, and the ingestion backend that accepts data over the OpenTelemetry
  protocol over GRPC is at `http://localhost:4317`.

```shell
sdk install java 22.0.2-graalce

git clone git@github.com:apache/shardingsphere.git
cd ./shardingsphere/
git reset --hard 1a41252ff91ce497c4b117dff87defc5abda5e28
sdk use java 22.0.2-graalce
./mvnw clean install -Prelease -T1C -DskipTests -Djacoco.skip=true -Dcheckstyle.skip=true -Drat.skip=true -Dmaven.javadoc.skip=true
cd ../

git clone git@github.com:linghengqian/shardingsphere-agent-master-test.git
cd ./shardingsphere-agent-master-test/

docker run --rm -d \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -p 16686:16686 \
  -p 4317:4317 \
  -p 4318:4318 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.60.0

./mvnw clean spring-boot:run \
  -Dspring-boot.run.agents="./apache-shardingsphere-5.5.1-SNAPSHOT-shardingsphere-agent-bin/agent/shardingsphere-agent-5.5.1-SNAPSHOT.jar"
```

- The error log is as follows.

```shell
[INFO] --- spring-boot:3.3.3:run (default-cli) @ shardingsphere-agent-master-test ---
[INFO] Attaching agents: [/home/linghengqian/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test/apache-shardingsphere-5.5.1-SNAPSHOT-shardingsphere-agent-bin/agent/shardingsphere-agent-5.5.1-SNAPSHOT.jar]
9月 04, 2024 5:46:33 下午 org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
信息: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.1-SNAPSHOT.jar
9月 04, 2024 5:46:33 下午 org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
信息: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.1-SNAPSHOT.jar
9月 04, 2024 5:46:33 下午 org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
信息: Loaded jar: shardingsphere-agent-plugin-core-5.5.1-SNAPSHOT.jar
9月 04, 2024 5:46:33 下午 org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
信息: Loaded jar: shardingsphere-agent-metrics-core-5.5.1-SNAPSHOT.jar
9月 04, 2024 5:46:33 下午 org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
信息: Loaded jar: shardingsphere-agent-logging-file-5.5.1-SNAPSHOT.jar

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/

 :: Spring Boot ::                (v3.3.3)

2024-09-04T17:46:34.208+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Starting ShardingsphereAgentMasterTestApplication using Java 22.0.2 with PID 45222 (/home/linghengqian/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test/target/classes started by linghengqian in /home/linghengqian/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test)
2024-09-04T17:46:34.211+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : No active profile set, falling back to 1 default profile: "default"
2024-09-04T17:46:35.064+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
2024-09-04T17:46:35.073+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2024-09-04T17:46:35.074+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.28]
2024-09-04T17:46:35.119+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2024-09-04T17:46:35.120+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 773 ms
2024-09-04T17:46:35.524+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
2024-09-04T17:46:35.565+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
2024-09-04T17:46:35.574+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Started ShardingsphereAgentMasterTestApplication in 1.641 seconds (process running for 2.282)
2024-09-04T17:46:35.643+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
2024-09-04T17:46:35.820+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
2024-09-04T17:46:35.943+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:config user=SA
2024-09-04T17:46:35.944+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
2024-09-04T17:46:35.970+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Starting...
2024-09-04T17:46:35.975+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-3 - Added connection conn1: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
2024-09-04T17:46:35.975+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Start completed.
2024-09-04T17:46:36.589+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.PoolBase          : HikariPool-1 - Driver does not support get/set network timeout for connections. (getNetworkTimeout)
2024-09-04T17:46:36.590+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@6ca9ec77
2024-09-04T17:46:36.593+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
2024-09-04T17:46:36.613+08:00  INFO 45222 --- [shardingsphere-agent-master-test] [           main] .a.s.a.c.p.PluginLifecycleServiceManager : Start plugin: OpenTelemetry
2024-09-04T17:46:36.946+08:00 ERROR 45222 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the pre-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.context.ImplicitContextKeyed.storeInContext(org.apache.shardingsphere.shade.io.opentelemetry.context.Context)" because "value" is null.
2024-09-04T17:46:37.336+08:00 ERROR 45222 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the post-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.api.trace.Span.setStatus(org.apache.shardingsphere.shade.io.opentelemetry.api.trace.StatusCode)" because "span" is null.
```
