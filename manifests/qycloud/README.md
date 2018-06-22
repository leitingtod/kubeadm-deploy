#### 1.6.0
- node, php, nginx 独立为单独的Pod
- 默认使用 emptyDir 存储（php, nginx 合并到同一个Pod中）
- 支持emptyDir存储与NFS存储的切换
- 支持Pod启动时，可以跳过从源码镜像中解压源码（源码已经提前准备在存储上） 
- 优化各个服务的默认资源规格，各个结点资源利率较为平均

#### 1.5.0
- node, php, nginx 独立为单独的Pod
- 支持使用 已经准备好源码 NFS volume 存储
- 支持 mysql, redis, rabbitmq, beanstalk 服务的Web管理界面
