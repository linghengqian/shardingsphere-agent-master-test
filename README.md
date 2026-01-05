# shardingsphere-agent-master-test

- For https://github.com/apache/shardingsphere/issues/32793 .

- Execute the following commands on Ubuntu 22.04.4 WSL with `Docker Engine` and `SDKMAN!` installed.

```shell
sdk install java 25.0.1-graalce
sdk use java 25.0.1-graalce

git clone -b fix-agent git@github.com:linghengqian/shardingsphere.git
cd ./shardingsphere/
git reset --hard b3db025aac44af8255bd6bbd4a1d84e12a37de61
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

- The error log is as follows.

```shell
lingh@DESKTOP-58BHAE6:~/TwinklingLiftWorks/git/public/shardingsphere-agent-master-test$ docker compose logs --follow shardingsphere-agent-master-test
shardingsphere-agent-master-test-1  | Jan 05, 2026 4:44:36 PM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 05, 2026 4:44:36 PM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 05, 2026 4:44:36 PM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 05, 2026 4:44:36 PM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 05, 2026 4:44:36 PM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | WARNING: A terminally deprecated method in sun.misc.Unsafe has been called
shardingsphere-agent-master-test-1  | WARNING: sun.misc.Unsafe::objectFieldOffset has been called by org.apache.shardingsphere.shade.net.bytebuddy.dynamic.loading.ClassInjector$UsingUnsafe$Dispatcher$CreationAction (file:/usr/agent/shardingsphere-agent.jar)
shardingsphere-agent-master-test-1  | WARNING: Please consider reporting this to the maintainers of class org.apache.shardingsphere.shade.net.bytebuddy.dynamic.loading.ClassInjector$UsingUnsafe$Dispatcher$CreationAction
shardingsphere-agent-master-test-1  | WARNING: sun.misc.Unsafe::objectFieldOffset will be removed in a future release
shardingsphere-agent-master-test-1  | SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
shardingsphere-agent-master-test-1  | SLF4J: Defaulting to no-operation (NOP) logger implementation
shardingsphere-agent-master-test-1  | SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
shardingsphere-agent-master-test-1  | Exception in thread "main" java.lang.reflect.InvocationTargetException
shardingsphere-agent-master-test-1  |   at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:119)
shardingsphere-agent-master-test-1  |   at java.base/java.lang.reflect.Method.invoke(Method.java:565)
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
shardingsphere-agent-master-test-1  |   at java.base/java.util.ImmutableCollections$List12.forEach(ImmutableCollections.java:681)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplicationRunListeners.doWithListeners(SpringApplicationRunListeners.java:123)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplicationRunListeners.starting(SpringApplicationRunListeners.java:56)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplication.run(SpringApplication.java:313)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplication.run(SpringApplication.java:1365)
shardingsphere-agent-master-test-1  |   at org.springframework.boot.SpringApplication.run(SpringApplication.java:1354)
shardingsphere-agent-master-test-1  |   at io.github.linghengqian.shardingsphere.agent.master.test.ShardingsphereAgentMasterTestApplication.main(ShardingsphereAgentMasterTestApplication.java:28)
shardingsphere-agent-master-test-1  |   at java.base/jdk.internal.reflect.DirectMethodHandleAccessor.invoke(DirectMethodHandleAccessor.java:104)
shardingsphere-agent-master-test-1  |   ... 4 more
```
