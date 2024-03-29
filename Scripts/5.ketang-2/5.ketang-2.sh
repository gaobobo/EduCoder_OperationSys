#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/5.ketang-2

case $DownloadSite in
    Gitee)
        wget -O /tmp/5.ketang-2/4.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/5.ketang-2/4.c
        ;;
    Github)
        wget -O /tmp/5.ketang-2/4.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/5.ketang-2/4.c
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

mv -f /tmp/5.ketang-2/4.c /home/headless/Desktop/workspace/myshixun/exp6/4.c

return 0
