#### 1.6.0
- node, php, nginx 独立为单独的Pod
- 支持当使用 emptyDir 存储时，php, nginx 集中到同一个Pod中
- 支持当源码在创建Pod之前已经在存储中准备好时，不再从源码镜像中解压源码 
- 优化各个服务的默认资源规格

#### 1.5.0
- node, php, nginx 独立为单独的Pod
- 支持使用 已经准备好源码 NFS volume 存储
- 支持 mysql, redis, rabbitmq, beanstalk 服务的Web管理界面
