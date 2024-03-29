#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/5.ketang-3

case $DownloadSite in
    Gitee)
        wget -O /tmp/5.ketang-3/9.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/5.ketang-3/9.c
        ;;
    Github)
        wget -O /tmp/5.ketang-3/9.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/5.ketang-3/9.c
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

rm -rf /home/headless/Desktop/workspace/myshixun/3.c

mv -f /tmp/5.ketang-3/9.c /home/headless/Desktop/workspace/myshixun/9.c

return 0
