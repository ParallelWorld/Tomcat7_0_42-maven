# maven 管理的 tomcat 源码

* java version: 1.6.0_45
* tomcat version: 7.0.42
* tomcat 各种历史版本的源码下载地址: [http://archive.apache.org/dist/tomcat]()

此工程用作学习 tomcat 源码。

## 运行须知

use main class org.apache.catalina.startup.Bootstrap and add VM Options: clone 到本地之后，需要使用 org.apache.catalina.startup.Bootstrap 来运行，同时需要配置启动参数：

```xml
-Dcatalina.home=target/classes/
-Dcatalina.base=target/classes/
-Djava.endorsed.dirs=${catalina.base}endorsed
-Djava.io.tmpdir=${catalina.base}temp
-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager
-Djava.util.logging.config.file=${catalina.base}conf/logging.properties
```
