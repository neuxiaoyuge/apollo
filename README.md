# apollo
注意：当apollo服务端部署在云或远程时，apollo服务在注册中心中的服务地址为内网地址，本地开发环境是无法访问的，开发环境启动参数可以添加如下，绕过注册中心直连apollo config server。
-Dapollo.configService=http://119.45.50.7:8099
