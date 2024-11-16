# shardingsphere-agent-master-test

- For https://github.com/apache/shardingsphere/issues/32793 .

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.

```shell
sdk install java 22.0.2-graalce
sdk use java 22.0.2-graalce

git clone git@github.com:apache/shardingsphere.git
cd ./shardingsphere/
git reset --hard fa4e76de3aaa72b97748963143824dd4f674be7d
./mvnw clean install -Prelease -T1C -DskipTests -Djacoco.skip=true -Dcheckstyle.skip=true -Drat.skip=true -Dmaven.javadoc.skip=true
./mvnw -am -pl distribution/agent -Prelease,docker -T1C -DskipTests clean package
cd ../

git clone git@github.com:linghengqian/shardingsphere-agent-master-test.git
cd ./shardingsphere-agent-master-test/
./mvnw clean package -T1C -DskipTests
docker compose up -d
docker compose logs --follow shardingsphere-agent-master-test
```

- The error log is as follows.

```shell
shardingsphere-agent-master-test-1  | Nov 16, 2024 4:14:47 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Nov 16, 2024 4:14:47 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Nov 16, 2024 4:14:47 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Nov 16, 2024 4:14:47 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Nov 16, 2024 4:14:47 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.2-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  |   .   ____          _            __ _ _
shardingsphere-agent-master-test-1  |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
shardingsphere-agent-master-test-1  | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
shardingsphere-agent-master-test-1  |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
shardingsphere-agent-master-test-1  |   '  |____| .__|_| |_|_| |_\__, | / / / /
shardingsphere-agent-master-test-1  |  =========|_|==============|___/=/_/_/_/
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  |  :: Spring Boot ::                (v3.3.5)
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:48.736Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Starting ShardingsphereAgentMasterTestApplication v0.0.1-SNAPSHOT using Java 23.0.1 with PID 1 (/app.jar started by root in /)
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:48.739Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : No active profile set, falling back to 1 default profile: "default"
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:50.297Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:50.313Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:50.313Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.31]
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:50.348Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:50.349Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1323 ms
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:51.303Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:51.401Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port 8080 (http) with context path '/'
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:51.421Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Started ShardingsphereAgentMasterTestApplication in 3.129 seconds (process running for 4.353)
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:51.529Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:51.861Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:52.038Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:config user=SA
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:52.040Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:52.085Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Starting...
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:52.092Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-3 - Added connection conn1: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:52.092Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-3 - Start completed.
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:53.572Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@15e881c0
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:53.576Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:53.600Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] .a.s.a.c.p.PluginLifecycleServiceManager : Start plugin: OpenTelemetry
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:54.077Z ERROR 1 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the pre-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.context.ImplicitContextKeyed.storeInContext(org.apache.shardingsphere.shade.io.opentelemetry.context.Context)" because "value" is null.
shardingsphere-agent-master-test-1  | 2024-11-16T04:14:54.810Z ERROR 1 --- [shardingsphere-agent-master-test] [           main] s.a.c.a.e.t.InstanceMethodAdviceExecutor : Failed to execute the post-method of method `parse` in class `org.apache.shardingsphere.infra.parser.ShardingSphereSQLParserEngine`, Cannot invoke "org.apache.shardingsphere.shade.io.opentelemetry.api.trace.Span.setStatus(org.apache.shardingsphere.shade.io.opentelemetry.api.trace.StatusCode)" because "span" is null.
```
