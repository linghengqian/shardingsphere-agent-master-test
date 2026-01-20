# shardingsphere-agent-master-test

- For,
    - https://github.com/apache/shardingsphere/issues/32793
    - https://github.com/apache/shardingsphere/issues/37683
    - https://github.com/apache/shardingsphere/issues/37682
    - https://github.com/apache/shardingsphere/issues/37652

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.

```shell
sdk install java 25.0.1-graalce
sdk use java 25.0.1-graalce

git clone -b master git@github.com:apache/shardingsphere.git
cd ./shardingsphere/
git reset --hard 1c897e82a4c8c2a24fdcfec772bde63f18b55eb1
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
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:30:40 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:30:40 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:30:40 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:30:40 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:30:40 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
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
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:42.005Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Starting ShardingsphereAgentMasterTestApplication v0.0.1-SNAPSHOT using Java 25.0.1 with PID 1 (/app.jar started by root in /)
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:42.008Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : No active profile set, falling back to 1 default profile: "default"
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:43.821Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat initialized with port 8080 (http)
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:43.834Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:43.835Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/11.0.15]
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:43.861Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] b.w.c.s.WebApplicationContextInitializer : Root WebApplicationContext: initialization completed in 1560 ms
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:44.965Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:45.059Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat started on port 8080 (http) with context path '/'
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:45.070Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Started ShardingsphereAgentMasterTestApplication in 3.632 seconds (process running for 4.911)
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:45.189Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:45.503Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:45.708Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:45.710Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:47.081Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.s.d.j.c.d.ShardingSphereDataSource   : ShardingSphere-JDBC Standalone mode started successfully.
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:47.082Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.s.d.j.c.d.ShardingSphereDataSource   : Instance id: 031f4523-999f-4d53-b326-ad57f0f6bdc7, IP: 172.19.0.3
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:47.094Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@6add8aac
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:47.099Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
shardingsphere-agent-master-test-1  | 2026-01-20T00:30:47.125Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] .a.s.a.c.p.PluginLifecycleServiceManager : Start plugin: OpenTelemetry
```


## For Zipkin and OTLP

View the web UI at `http://localhost:9411`.

```shell
sdk install java 25.0.1-graalce
sdk use java 25.0.1-graalce

git clone -b master git@github.com:apache/shardingsphere.git
cd ./shardingsphere/
git reset --hard 1c897e82a4c8c2a24fdcfec772bde63f18b55eb1
./mvnw clean install -Prelease -T1C -DskipTests -Djacoco.skip=true -Dcheckstyle.skip=true -Drat.skip=true -Dmaven.javadoc.skip=true
./mvnw -am -pl distribution/agent -Prelease,docker -T1C -DskipTests clean package
cd ../

git clone git@github.com:linghengqian/shardingsphere-agent-master-test.git
cd ./shardingsphere-agent-master-test/
docker compose --file ./compose-zipkin.yaml up -d
docker compose --file ./compose-zipkin.yaml logs --follow shardingsphere-agent-master-test
```

```shell
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:33:33 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:33:33 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:33:33 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:33:33 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 20, 2026 12:33:33 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
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
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:34.563Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Starting ShardingsphereAgentMasterTestApplication v0.0.1-SNAPSHOT using Java 25.0.1 with PID 1 (/app.jar started by root in /)
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:34.566Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : No active profile set, falling back to 1 default profile: "default"
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:36.032Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat initialized with port 8080 (http)
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:36.044Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:36.045Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/11.0.15]
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:36.065Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] b.w.c.s.WebApplicationContextInitializer : Root WebApplicationContext: initialization completed in 1229 ms
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:36.873Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:36.942Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat started on port 8080 (http) with context path '/'
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:36.952Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] ShardingsphereAgentMasterTestApplication : Started ShardingsphereAgentMasterTestApplication in 2.846 seconds (process running for 3.901)
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:37.039Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:37.247Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:37.431Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:37.435Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:38.631Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.s.d.j.c.d.ShardingSphereDataSource   : ShardingSphere-JDBC Standalone mode started successfully.
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:38.632Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] o.a.s.d.j.c.d.ShardingSphereDataSource   : Instance id: 44a0db10-00e9-4b19-8b7e-eff74b2b6697, IP: 172.19.0.3
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:38.647Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@4203190
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:38.649Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
shardingsphere-agent-master-test-1  | 2026-01-20T00:33:38.673Z  INFO 1 --- [shardingsphere-agent-master-test] [           main] .a.s.a.c.p.PluginLifecycleServiceManager : Start plugin: OpenTelemetry
```
