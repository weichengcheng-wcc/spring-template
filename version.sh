#!/bin/bash

# -------------------------------------------------------------------------------
# Filename:    version.sh
# Revision:    0.0.0
# Date:        2020/9/8 19:23
# Author:      C.W
# Description: 更新工程版本
# -------------------------------------------------------------------------------

# 正则参数
version_pattern="^[0-9][0-9\\.]{0,}[0-9]$"

read -p "version:" version
if [[ ! $version =~ $version_pattern ]]; then
  echo "version is not right, please enter version like 0.0.1"
  exit
fi

read -p "type(1-SNAPSHOT, 2-RELEASE):" type
if [ $type -ne "1" -a $type -ne "2" ]; then
  echo "type is not right"
  exit
fi

if [ $type -eq "1" ]; then
    version=$version"-SNAPSHOT"
fi
if [ $type -eq "2" ]; then
    version=$version"-RELEASE"
fi

mvn versions:set -DnewVersion=$version -DgenerateBackupPoms=false

echo "your version is: " $version