#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: $0 <LevelCode>"
    echo "Example: $0 4-1"
    echo "用法：$0 <关卡编号>"
    echo "示例：$0 4-1"
    exit 1
fi

LevelCode=$1
readonly LevelCode

wget -O /tmp/${LevelCode}.sh https://raw.githubusercontent.com/gaobobo/educoder/master/Scripts/${LevelCode}.sh

if [ $? -ne 0 ]; then
    echo "Download ${LevelCode}.sh failed. Is the LevelCode correct?"
    echo "下载 ${LevelCode}.sh 失败。关卡编号是否正确？"
    exit 1
fi

chmod +x /tmp/${LevelCode}.sh
/tmp/${LevelCode}.sh