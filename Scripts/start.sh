#!/bin/bash

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo


helpInfo(){
    echo "Usage: $0 <LevelCode> [Gitee|Github]"
    echo "Example: $0 4-1"
    echo "用法：$0 <关卡编号> [Gitee|Github]"
    echo "示例：$0 4-1"
}

if [ -z "$1" ]; then
    helpInfo
    exit 1
fi

readonly LevelCode=$1
readonly DownloadSite=${2:-Gitee}

case $DownloadSite in
    Gitee)
        wget -O /tmp/${LevelCode}.sh https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Scripts/${LevelCode}/${LevelCode}.sh
        ;;
    Github)
        wget -O /tmp/${LevelCode}.sh https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Scripts/${LevelCode}/${LevelCode}.sh
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        exit 1
        ;;
esac

if [ $? -ne 0 ]; then
    echo "Download ${LevelCode}.sh failed. Is the LevelCode correct?"
    echo "下载 ${LevelCode}.sh 失败。关卡编号是否正确？"
    exit 1
fi

source /tmp/${LevelCode}.sh

if [ $? -eq 0 ]; then
    echo "脚本运行完成。可直接评测。"
else
    echo "脚本运行失败。请重试。"
fi