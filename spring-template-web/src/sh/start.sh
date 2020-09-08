#!/usr/bin/env bash
#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    start.sh
# Revision:    0.0.0
# Date:        2020/9/4 17:03
# Author:      C.W
# Description: 项目启动脚本
# -------------------------------------------------------------------------------

java \
-Xmx512m \
-Dserver.port=20688 \
-XX:+UseG1GC -verbose:gc \
-XX:+HeapDumpOnOutOfMemoryError \
-XX:+PrintGCDetails \
-XX:+PrintGCTimeStamps \
-XX:+PrintGCApplicationStoppedTime \
-XX:+UseGCLogFileRotation \
-jar /apps/instances/app.jar