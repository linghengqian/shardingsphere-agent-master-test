# shardingsphere-agent-master-test

- For https://github.com/apache/shardingsphere/issues/32793 .

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.

```shell
sdk install java 22.0.2-graalce
sdk use java 22.0.2-graalce

git clone git@github.com:apache/shardingsphere.git
cd ./shardingsphere/
git reset --hard cf7ecadf37fc258e45a2a6b8873dfcef04ebb09f
./mvnw clean install -Prelease -T1C -DskipTests -Djacoco.skip=true -Dcheckstyle.skip=true -Drat.skip=true -Dmaven.javadoc.skip=true
./mvnw -am -pl distribution/agent -Prelease,docker -T1C -DskipTests clean package
cd ../

docker network create lingh-test
docker run --rm -d \
  --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  --network lingh-test \
  jaegertracing/all-in-one:1.62.0

git clone git@github.com:linghengqian/shardingsphere-agent-master-test.git
cd ./shardingsphere-agent-master-test/
./mvnw clean package -DskipTests && docker build -t linghengqian/shardingsphere-agent-master-test:latest .
docker run --network lingh-test linghengqian/shardingsphere-agent-master-test:latest
```

- The error log is as follows.

```shell
Oct 23, 2024 7:48:34 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.2-SNAPSHOT.jar
Oct 23, 2024 7:48:34 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.2-SNAPSHOT.jar
Oct 23, 2024 7:48:34 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.2-SNAPSHOT.jar
Oct 23, 2024 7:48:34 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.2-SNAPSHOT.jar
Oct 23, 2024 7:48:34 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.2-SNAPSHOT.jar

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/

 :: Spring Boot ::                (v3.3.3)

2024-10-23T07:48:36.455Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Starting ShardingsphereAgentMasterTestApplication v0.0.1-SNAPSHOT using Java 23 with PID 1 (/app.jar started by root in /)
2024-10-23T07:48:36.459Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : No active profile set, falling back to 1 default profile: "default"
2024-10-23T07:48:38.241Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
2024-10-23T07:48:38.264Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2024-10-23T07:48:38.265Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.28]
2024-10-23T07:48:38.316Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2024-10-23T07:48:38.317Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1484 ms
2024-10-23T07:48:39.375Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
2024-10-23T07:48:39.479Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
2024-10-23T07:48:39.501Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Started ShardingsphereAgentMasterTestApplication in 3.596 seconds (process running for 5.058)
2024-10-23T07:48:39.628Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
2024-10-23T07:48:40.057Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
2024-10-23T07:48:40.392Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:config user=SA
2024-10-23T07:48:40.395Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
2024-10-23T07:48:40.481Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Starting...
2024-10-23T07:48:40.491Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-3 - Added connection conn1: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
2024-10-23T07:48:40.492Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Start completed.
2024-10-23T07:48:41.977Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@28be7db5
2024-10-23T07:48:41.981Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
2024-10-23T07:48:42.016Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] .a.s.a.c.p.PluginLifecycleServiceManager : Start plugin: OpenTelemetry
2024-10-23T07:48:42.716Z ERROR 1 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the pre-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.context.ImplicitContextKeyed.storeInContext(org.apache.shardingsphere.shade.io.opentelemetry.context.Context)" because "value" is null.
2024-10-23T07:48:43.516Z ERROR 1 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the post-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.api.trace.Span.setStatus(org.apache.shardingsphere.shade.io.opentelemetry.api.trace.StatusCode)" because "span" is null.
```
