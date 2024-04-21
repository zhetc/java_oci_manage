# java_oci_manage

## 简介

基于 [semicons/java_oci_manage](https://github.com/semicons/java_oci_manage) 项目的 docker 镜像.  
本项目仅为方便 docker 容器化部署,相关使用教程及问题请参考官方项目.

## docker 部署

### 准备配置文件

- 参考官方项目,准备 oracle api key 私钥文件`key.pem`.
- 参考官方项目,配置 client_config 文件,注意 key 路径为`key_file=/app/key.pem`.

### 启动 docker 容器

```bash
docker run -itd --name java_oci_manage --restart always \
  -v /root/config/client_config:/app/client_config \
  -v /root/config/key.pem:/app/key.pem \
  -p 9527:9527 \
  zhetc/java_oci_manage
```

### 查看日志

```bash
docker logs -tf java_oci_manage
```

## docker compose 部署

```shell
version: "3"
services: 
  oci:
    image: zhetc/java_oci_manage
    container_name: java_oci_manage
    restart: always
#    可以指定环境变量设置启动端口
#    environment:
#      SERVER_PORT: 52781
    ports:
      - 9527:9527
    volumes:
      - ./config/client_config:/app/client_config
      - ./config/key.pem:/app/key.pem
    restart: always
```

### 启动

```shell
docker-compose up -d
```

## Dockerfile

- [zhetc/java_oci_manage](https://github.com/zhetc/java_oci_manage)