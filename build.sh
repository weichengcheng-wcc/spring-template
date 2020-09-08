#!/usr/bin/env bash
#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    build.sh
# Revision:    0.0.0
# Date:        2020/9/4 17:54
# Author:      C.W
# Description: 构建docker镜像
# -------------------------------------------------------------------------------


echo '构建jar包.....'
mvn clean package -Dmaven.test.skip=true
echo '构建jar包完毕.....'


echo '停止旧服务.....'
running=`docker ps --filter name=mybatis-generator --format "table {{.ID}}"`

running_id=$(echo $running | awk '{print $3}')

if [ -n "$running_id" ] ;
then
  docker stop $running_id

fi
echo '旧服务停止完毕......'




echo '删除运行容器.....'
continer=`docker ps -a --filter name=mybatis-generator --format "table {{.ID}}"`

continer_id=$(echo $continer | awk '{print $3}')

if [ -n "$continer_id" ] ;
then
  docker rm $continer_id

fi
echo '运行容器删除完毕.....'



echo '删除镜像.......'
images=`docker images mybatis-generator:1.0 --format "table {{.ID}}\t{{.Repository}}\t{{.Size}}"`

id=$(echo $images | awk '{print $5}')

if [ -n "$id" ] ;
then
  docker rmi $id

fi
echo '删除镜像完毕.......'




echo '构建镜像.......'
docker build -t mybatis-generator:1.0 .
echo '构建镜像完毕.......'



echo '启动镜像.......'
docker run -dit --name mybatis-generator mybatis-generator:1.0 /bin/bash
echo '启动镜像成功......'



echo '保存镜像.....'
docker save -o mybatis-generator.tar mybatis-generator:1.0
echo '保存镜像完毕.....'


echo '开始上传镜像.....'
docker scp mybatis-generator.tar root@111.229.180.167:/data/images
echo '上传镜像完毕.....'