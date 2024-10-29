# shardingsphere-agent-master-test

- For https://github.com/apache/shardingsphere/issues/32793 .

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.

```shell
sdk install java 22.0.2-graalce
sdk use java 22.0.2-graalce

git clone git@github.com:apache/shardingsphere.git
cd ./shardingsphere/
git reset --hard d10aa6fbb6b3b1ad3b6ff2caeca9384f5ebe7937
./mvnw clean install -Prelease -T1C -DskipTests -Djacoco.skip=true -Dcheckstyle.skip=true -Drat.skip=true -Dmaven.javadoc.skip=true
./mvnw -am -pl distribution/agent -Prelease,docker -T1C -DskipTests clean package
cd ../

git clone git@github.com:linghengqian/shardingsphere-agent-master-test.git
cd ./shardingsphere-agent-master-test/
./mvnw clean package -DskipTests
docker compose up -d
docker compose logs --follow shardingsphere-agent-master-test
```

- The error log is as follows.

```shell
shardingsphere-agent-master-test-1  | Oct 29, 2024 7:25:32 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Oct 29, 2024 7:25:32 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Oct 29, 2024 7:25:32 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Oct 29, 2024 7:25:32 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Oct 29, 2024 7:25:32 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  |   .   ____          _            __ _ _
shardingsphere-agent-master-test-1  |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
shardingsphere-agent-master-test-1  | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
shardingsphere-agent-master-test-1  |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
shardingsphere-agent-master-test-1  |   '  |____| .__|_| |_|_| |_\__, | / / / /
shardingsphere-agent-master-test-1  |  =========|_|==============|___/=/_/_/_/
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  |  :: Spring Boot ::                (v3.3.3)
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:33.860Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Starting ShardingsphereAgentMasterTestApplication v0.0.1-SNAPSHOT using Java 23.0.1 with PID 1 (/app.jar started by root in /)
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:33.865Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : No active profile set, falling back to 1 default profile: "default"
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:35.510Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:35.526Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:35.527Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.28]
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:35.574Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:35.575Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1316 ms
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:36.373Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:36.455Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:36.471Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Started ShardingsphereAgentMasterTestApplication in 3.159 seconds (process running for 4.188)
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:36.580Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:36.923Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:37.085Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:config user=SA
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:37.088Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:37.153Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Starting...
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:37.160Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-3 - Added connection conn1: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:37.160Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Start completed.
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:38.346Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@14d9ae22
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:38.348Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:38.369Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] .a.s.a.c.p.PluginLifecycleServiceManager : Start plugin: OpenTelemetry
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:38.816Z ERROR 1 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the pre-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.context.ImplicitContextKeyed.storeInContext(org.apache.shardingsphere.shade.io.opentelemetry.context.Context)" because "value" is null.
shardingsphere-agent-master-test-1  | 2024-10-29T07:25:39.493Z ERROR 1 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the post-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.api.trace.Span.setStatus(org.apache.shardingsphere.shade.io.opentelemetry.api.trace.StatusCode)" because "span" is null.
```
