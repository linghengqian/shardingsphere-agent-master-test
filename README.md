# shardingsphere-agent-master-test

- For https://github.com/apache/shardingsphere/issues/32793 .

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.

```shell
sdk install java 25.0.1-graalce
sdk use java 25.0.1-graalce

git clone -b fix-agent git@github.com:linghengqian/shardingsphere.git
cd ./shardingsphere/
git reset --hard 1fd3fd21bb8715edc6ea7f467d32a40022ec5d82
./mvnw clean install -Prelease -T1C -DskipTests -Djacoco.skip=true -Dcheckstyle.skip=true -Drat.skip=true -Dmaven.javadoc.skip=true
./mvnw -am -pl distribution/agent -Prelease,docker -T1C -DskipTests clean package
cd ../

git clone git@github.com:linghengqian/shardingsphere-agent-master-test.git
cd ./shardingsphere-agent-master-test/
docker compose up -d
docker compose logs --follow shardingsphere-agent-master-test
```

- You can also execute `./mvnw clean test` to verify whether the Spring Boot application can start normally.

## For `docker compose logs --follow shardingsphere-agent-master-test`

- The error log is as follows.

```shell
lingh@DESKTOP-58BHAE6:~/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test$ docker compose logs --follow shardingsphere-agent-master-test
shardingsphere-agent-master-test-1  | Jan 06, 2026 8:17:52 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 06, 2026 8:17:52 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 06, 2026 8:17:52 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 06, 2026 8:17:52 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 06, 2026 8:17:52 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | WARNING: A terminally deprecated method in sun.misc.Unsafe has been called
shardingsphere-agent-master-test-1  | WARNING: sun.misc.Unsafe::objectFieldOffset has been called by org.apache.shardingsphere.shade.net.bytebuddy.dynamic.loading.ClassInjector$UsingUnsafe$Dispatcher$CreationAction (file:/usr/agent/shardingsphere-agent.jar)
shardingsphere-agent-master-test-1  | WARNING: Please consider reporting this to the maintainers of class org.apache.shardingsphere.shade.net.bytebuddy.dynamic.loading.ClassInjector$UsingUnsafe$Dispatcher$CreationAction
shardingsphere-agent-master-test-1  | WARNING: sun.misc.Unsafe::objectFieldOffset will be removed in a future release
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  |   .   ____          _            __ _ _
shardingsphere-agent-master-test-1  |  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
shardingsphere-agent-master-test-1  | ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
shardingsphere-agent-master-test-1  |  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
shardingsphere-agent-master-test-1  |   '  |____| .__|_| |_|_| |_\__, | / / / /
shardingsphere-agent-master-test-1  |  =========|_|==============|___/=/_/_/_/
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  |  :: Spring Boot ::                (v4.0.1)
shardingsphere-agent-master-test-1  | 
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:54.538Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Starting ShardingsphereAgentMasterTestApplication v0.0.1-SNAPSHOT using Java 25.0.1 with PID 1 (/app.jar started by root in /)
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:54.543Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : No active profile set, falling back to 1 default profile: "default"
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:56.292Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat initialized with port 8080 (http)
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:56.308Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:56.309Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/11.0.15]
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:56.341Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] b.w.c.s.WebApplicationContextInitializer : Root WebApplicationContext: initialization completed in 1469 ms
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:57.403Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:57.483Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat started on port 8080 (http) with context path '/'
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:57.496Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Started ShardingsphereAgentMasterTestApplication in 3.601 seconds (process running for 4.888)
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:57.576Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:57.781Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:58.014Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:58.017Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:59.267Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.s.d.j.c.d.ShardingSphereDataSource   : ShardingSphere-JDBC Standalone mode started successfully.
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:59.268Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.s.d.j.c.d.ShardingSphereDataSource   : Instance id: c852d5ae-7d87-4db5-af4b-c1a9c0c4aee6, IP: 172.18.0.3
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:59.281Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@6add8aac
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:59.283Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
shardingsphere-agent-master-test-1  | 2026-01-06T08:17:59.306Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] .a.s.a.c.p.PluginLifecycleServiceManager : Start plugin: OpenTelemetry
```
