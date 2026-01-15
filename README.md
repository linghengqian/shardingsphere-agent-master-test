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
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:01:54 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:01:54 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:01:54 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:01:54 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:01:54 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | WARNING: A terminally deprecated method in sun.misc.Unsafe has been called
shardingsphere-agent-master-test-1  | WARNING: sun.misc.Unsafe::objectFieldOffset has been called by org.apache.shardingsphere.shade.net.bytebuddy.dynamic.loading.ClassInjector$UsingUnsafe$Dispatcher$CreationAction (file:/usr/agent/shardingsphere-agent.jar)
shardingsphere-agent-master-test-1  | WARNING: Please consider reporting this to the maintainers of class org.apache.shardingsphere.shade.net.bytebuddy.dynamic.loading.ClassInjector$UsingUnsafe$Dispatcher$CreationAction
shardingsphere-agent-master-test-1  | WARNING: sun.misc.Unsafe::objectFieldOffset will be removed in a future release
shardingsphere-agent-master-test-1  | SLF4J(E): A service provider failed to instantiate:
shardingsphere-agent-master-test-1  | org.slf4j.spi.SLF4JServiceProvider: Provider ch.qos.logback.classic.spi.LogbackServiceProvider could not be instantiated
shardingsphere-agent-master-test-1  | SLF4J(W): No SLF4J providers were found.
shardingsphere-agent-master-test-1  | SLF4J(W): Defaulting to no-operation (NOP) logger implementation
shardingsphere-agent-master-test-1  | SLF4J(W): See https://www.slf4j.org/codes.html#noProviders for further details.
shardingsphere-agent-master-test-1  | SLF4J(W): Class path contains SLF4J bindings targeting slf4j-api versions 1.7.x or earlier.
shardingsphere-agent-master-test-1  | SLF4J(W): Ignoring binding found at [jar:file:/usr/agent/shardingsphere-agent.jar!/org/slf4j/impl/StaticLoggerBinder.class]
shardingsphere-agent-master-test-1  | SLF4J(W): See https://www.slf4j.org/codes.html#ignoredBindings for an explanation.
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
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:01:57 AM org.apache.catalina.core.StandardService startInternal
shardingsphere-agent-master-test-1  | INFO: Starting service [Tomcat]
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:01:57 AM org.apache.catalina.core.StandardEngine startInternal
shardingsphere-agent-master-test-1  | INFO: Starting Servlet engine: [Apache Tomcat/11.0.15]
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:02:01 AM org.apache.shardingsphere.agent.core.plugin.PluginLifecycleServiceManager start
shardingsphere-agent-master-test-1  | INFO: Start plugin: OpenTelemetry
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
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:19:48 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-logging-file-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:19:48 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-plugin-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:19:48 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-core-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:19:48 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-metrics-prometheus-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:19:48 AM org.apache.shardingsphere.agent.core.plugin.jar.PluginJarLoader load
shardingsphere-agent-master-test-1  | INFO: Loaded jar: shardingsphere-agent-tracing-opentelemetry-5.5.3-SNAPSHOT.jar
shardingsphere-agent-master-test-1  | WARNING: A terminally deprecated method in sun.misc.Unsafe has been called
shardingsphere-agent-master-test-1  | WARNING: sun.misc.Unsafe::objectFieldOffset has been called by org.apache.shardingsphere.shade.net.bytebuddy.dynamic.loading.ClassInjector$UsingUnsafe$Dispatcher$CreationAction (file:/usr/agent/shardingsphere-agent.jar)
shardingsphere-agent-master-test-1  | WARNING: Please consider reporting this to the maintainers of class org.apache.shardingsphere.shade.net.bytebuddy.dynamic.loading.ClassInjector$UsingUnsafe$Dispatcher$CreationAction
shardingsphere-agent-master-test-1  | WARNING: sun.misc.Unsafe::objectFieldOffset will be removed in a future release
shardingsphere-agent-master-test-1  | SLF4J(E): A service provider failed to instantiate:
shardingsphere-agent-master-test-1  | org.slf4j.spi.SLF4JServiceProvider: Provider ch.qos.logback.classic.spi.LogbackServiceProvider could not be instantiated
shardingsphere-agent-master-test-1  | SLF4J(W): No SLF4J providers were found.
shardingsphere-agent-master-test-1  | SLF4J(W): Defaulting to no-operation (NOP) logger implementation
shardingsphere-agent-master-test-1  | SLF4J(W): See https://www.slf4j.org/codes.html#noProviders for further details.
shardingsphere-agent-master-test-1  | SLF4J(W): Class path contains SLF4J bindings targeting slf4j-api versions 1.7.x or earlier.
shardingsphere-agent-master-test-1  | SLF4J(W): Ignoring binding found at [jar:file:/usr/agent/shardingsphere-agent.jar!/org/slf4j/impl/StaticLoggerBinder.class]
shardingsphere-agent-master-test-1  | SLF4J(W): See https://www.slf4j.org/codes.html#ignoredBindings for an explanation.
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
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:19:52 AM org.apache.catalina.core.StandardService startInternal
shardingsphere-agent-master-test-1  | INFO: Starting service [Tomcat]
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:19:52 AM org.apache.catalina.core.StandardEngine startInternal
shardingsphere-agent-master-test-1  | INFO: Starting Servlet engine: [Apache Tomcat/11.0.15]
shardingsphere-agent-master-test-1  | Jan 15, 2026 6:19:55 AM org.apache.shardingsphere.agent.core.plugin.PluginLifecycleServiceManager start
shardingsphere-agent-master-test-1  | INFO: Start plugin: OpenTelemetry
```
