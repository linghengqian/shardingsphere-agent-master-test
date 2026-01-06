# shardingsphere-agent-master-test

- For https://github.com/apache/shardingsphere/issues/32793 .

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.

```shell
sdk install java 23.0.2-graalce
sdk use java 23.0.2-graalce

git clone -b master git@github.com:apache/shardingsphere.git
cd ./shardingsphere/
git reset --hard 18a1658bf4e8997e7e466de7fb08480c2bec9bc7
./mvnw clean install -Prelease -T1C -DskipTests -Djacoco.skip=true -Dcheckstyle.skip=true -Drat.skip=true -Dmaven.javadoc.skip=true
./mvnw -am -pl distribution/agent -Prelease,docker -T1C -DskipTests clean package
cd ../

git clone git@github.com:linghengqian/shardingsphere-agent-master-test.git
cd ./shardingsphere-agent-master-test/
./mvnw clean test
./mvnw clean package -T1C -DskipTests
docker compose up -d
docker compose logs --follow shardingsphere-agent-master-test
```

## For `./mvnw clean test`

- The error log is as follows.

```shell
[INFO] Scanning for projects...
[INFO] 
[INFO] ------< io.github.linghengqian:shardingsphere-agent-master-test >-------
[INFO] Building shardingsphere-agent-master-test 0.0.1-SNAPSHOT
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- clean:3.5.0:clean (default-clean) @ shardingsphere-agent-master-test ---
[INFO] Deleting /home/lingh/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test/target
[INFO] 
[INFO] --- resources:3.3.1:resources (default-resources) @ shardingsphere-agent-master-test ---
[INFO] Copying 1 resource from src/main/resources to target/classes
[INFO] Copying 1 resource from src/main/resources to target/classes
[INFO] 
[INFO] --- compiler:3.14.1:compile (default-compile) @ shardingsphere-agent-master-test ---
[INFO] Recompiling the module because of changed source code.
[INFO] Compiling 1 source file with javac [debug parameters release 23] to target/classes
[INFO] /home/lingh/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test/src/main/java/io/github/linghengqian/shardingsphere/agent/master/test/ShardingsphereAgentMasterTestApplication.java: /home/lingh/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test/src/main/java/io/github/linghengqian/shardingsphere/agent/master/test/ShardingsphereAgentMasterTestApplication.java uses or overrides a deprecated API.
[INFO] /home/lingh/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test/src/main/java/io/github/linghengqian/shardingsphere/agent/master/test/ShardingsphereAgentMasterTestApplication.java: Recompile with -Xlint:deprecation for details.
[INFO] 
[INFO] --- resources:3.3.1:testResources (default-testResources) @ shardingsphere-agent-master-test ---
[INFO] skip non existing resourceDirectory /home/lingh/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test/src/test/resources
[INFO] 
[INFO] --- compiler:3.14.1:testCompile (default-testCompile) @ shardingsphere-agent-master-test ---
[INFO] Recompiling the module because of changed dependency.
[INFO] Compiling 1 source file with javac [debug parameters release 23] to target/test-classes
[INFO] 
[INFO] --- surefire:3.5.4:test (default-test) @ shardingsphere-agent-master-test ---
[INFO] Using auto detected provider org.apache.maven.surefire.junitplatform.JUnitPlatformProvider
[INFO] 
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running io.github.linghengqian.shardingsphere.agent.master.test.ShardingsphereAgentMasterTestApplicationTests
11:15:54.674 [main] INFO org.springframework.test.context.support.AnnotationConfigContextLoaderUtils -- Could not detect default configuration classes for test class [io.github.linghengqian.shardingsphere.agent.master.test.ShardingsphereAgentMasterTestApplicationTests]: ShardingsphereAgentMasterTestApplicationTests does not declare any static, non-private, non-final, nested classes annotated with @Configuration.
11:15:54.776 [main] INFO org.springframework.boot.test.context.SpringBootTestContextBootstrapper -- Found @SpringBootConfiguration io.github.linghengqian.shardingsphere.agent.master.test.ShardingsphereAgentMasterTestApplication for test class io.github.linghengqian.shardingsphere.agent.master.test.ShardingsphereAgentMasterTestApplicationTests

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/

 :: Spring Boot ::                (v4.0.1)

2026-01-06T11:15:55.142+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] ingsphereAgentMasterTestApplicationTests : Starting ShardingsphereAgentMasterTestApplicationTests using Java 23.0.2 with PID 178787 (started by lingh in /home/lingh/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test)
2026-01-06T11:15:55.145+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] ingsphereAgentMasterTestApplicationTests : No active profile set, falling back to 1 default profile: "default"
2026-01-06T11:15:57.111+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
2026-01-06T11:15:57.162+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] ingsphereAgentMasterTestApplicationTests : Started ShardingsphereAgentMasterTestApplicationTests in 2.268 seconds (process running for 3.339)
2026-01-06T11:15:57.239+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Starting...
2026-01-06T11:15:57.391+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Starting...
2026-01-06T11:15:57.533+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-2 - Added connection conn0: url=jdbc:h2:mem:local_sharding_ds_0 user=SA
2026-01-06T11:15:57.536+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-2 - Start completed.
2026-01-06T11:15:58.622+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] o.a.s.d.j.c.d.ShardingSphereDataSource   : ShardingSphere-JDBC Standalone mode started successfully.
2026-01-06T11:15:58.623+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] o.a.s.d.j.c.d.ShardingSphereDataSource   : Instance id: a539b58d-581f-47ed-a196-ae77a580e1a6, IP: 10.255.255.254
2026-01-06T11:15:58.631+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.pool.HikariPool        : HikariPool-1 - Added connection org.apache.shardingsphere.driver.jdbc.core.connection.ShardingSphereConnection@2f6ede9
2026-01-06T11:15:58.633+08:00  INFO 178787 --- [shardingsphere-agent-master-test] [           main] com.zaxxer.hikari.HikariDataSource       : HikariPool-1 - Start completed.
Mockito is currently self-attaching to enable the inline-mock-maker. This will no longer work in future releases of the JDK. Please add Mockito as an agent to your build as described in Mockito's documentation: https://javadoc.io/doc/org.mockito/mockito-core/latest/org.mockito/org/mockito/Mockito.html#0.3
WARNING: A Java agent has been loaded dynamically (/home/lingh/.m2/repository/net/bytebuddy/byte-buddy-agent/1.17.8/byte-buddy-agent-1.17.8.jar)
WARNING: If a serviceability tool is in use, please run with -XX:+EnableDynamicAgentLoading to hide this warning
WARNING: If a serviceability tool is not in use, please run with -Djdk.instrument.traceUsage for more information
WARNING: Dynamic loading of agents will be disallowed by default in a future release
OpenJDK 64-Bit Server VM warning: Sharing is only supported for boot loader classes because bootstrap classpath has been appended
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 5.899 s -- in io.github.linghengqian.shardingsphere.agent.master.test.ShardingsphereAgentMasterTestApplicationTests
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 1, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  9.559 s
[INFO] Finished at: 2026-01-06T11:16:00+08:00
[INFO] ------------------------------------------------------------------------
```

## For `docker compose logs --follow shardingsphere-agent-master-test`

- The error log is as follows.

```shell
shardingsphere-agent-master-test-1  | Jan 06, 2026 3:17:04 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 06, 2026 3:17:04 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 06, 2026 3:17:04 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 06, 2026 3:17:04 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 06, 2026 3:17:04 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
shardingsphere-agent-master-test-1  | SLF4J: Defaulting to no-operation (NOP) logger implementation
shardingsphere-agent-master-test-1  | SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
shardingsphere-agent-master-test-1  | Exception in thread "main" java.lang.reflect.InvocationTargetException
shardingsphere-agent-master-test-1  |   at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:118)
shardingsphere-agent-master-test-1  |   at java.base/java.lang.reflect.Method.invoke(Method.java:580)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.loader.launch.Launcher.launch(Launcher.java:106)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.loader.launch.Launcher.launch(Launcher.java:64)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.loader.launch.JarLauncher.main(JarLauncher.java:40)
shardingsphere-agent-master-test-1  | Caused by: java.lang.IllegalStateException: LoggerFactory is not a Logback LoggerContext but Logback is on the classpath. Either remove Logback or the competing implementation (class org.slf4j.helpers.NOPLoggerFactory loaded from file:/usr/agent/shardingsphere-agent.jar). If you are using WebLogic you will need to add 'org.slf4j' to prefer-application-packages in WEB-INF/weblogic.xml
shardingsphere-agent-master-test-1  |   at org.springframework.util.Assert.state(Assert.java:102)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.logging.logback.LogbackLoggingSystem.getLoggerContext(LogbackLoggingSystem.java:420)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.logging.logback.LogbackLoggingSystem.beforeInitialize(LogbackLoggingSystem.java:130)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.context.logging.LoggingApplicationListener.onApplicationStartingEvent(LoggingApplicationListener.java:240)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.context.logging.LoggingApplicationListener.onApplicationEvent(LoggingApplicationListener.java:222)
shardingsphere-agent-master-test-1  |   at org.springframework.context.event.SimpleApplicationEventMulticaster.doInvokeListener(SimpleApplicationEventMulticaster.java:180)
shardingsphere-agent-master-test-1  |   at org.springframework.context.event.SimpleApplicationEventMulticaster.invokeListener(SimpleApplicationEventMulticaster.java:173)
shardingsphere-agent-master-test-1  |   at org.springframework.context.event.SimpleApplicationEventMulticaster.multicastEvent(SimpleApplicationEventMulticaster.java:151)
shardingsphere-agent-master-test-1  |   at org.springframework.context.event.SimpleApplicationEventMulticaster.multicastEvent(SimpleApplicationEventMulticaster.java:133)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.context.event.EventPublishingRunListener.multicastInitialEvent(EventPublishingRunListener.java:137)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.context.event.EventPublishingRunListener.starting(EventPublishingRunListener.java:76)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplicationRunListeners.lambda$starting$0(SpringApplicationRunListeners.java:56)
shardingsphere-agent-master-test-1  |   at java.base/java.lang.Iterable.forEach(Iterable.java:75)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplicationRunListeners.doWithListeners(SpringApplicationRunListeners.java:123)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplicationRunListeners.starting(SpringApplicationRunListeners.java:56)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplication.run(SpringApplication.java:313)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplication.run(SpringApplication.java:1365)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplication.run(SpringApplication.java:1354)
shardingsphere-agent-master-test-1  |   at io.github.linghengqian.shardingsphere.agent.master.test.ShardingsphereAgentMasterTestApplication.main(ShardingsphereAgentMasterTestApplication.java:28)
shardingsphere-agent-master-test-1  |   at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:103)
shardingsphere-agent-master-test-1  |   ... 4 more
```
