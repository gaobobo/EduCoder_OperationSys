#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/3.3.2.kehou-1

case $DownloadSite in
    Gitee)
        wget -O /tmp/3.3.2.kehou-1/第四关.txt https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.3.2.kehou-1/第五关.txt
        wget -O /tmp/3.3.2.kehou-1/gdb.log https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.3.2.kehou-1/gdb.log
        ;;
    Github)
        wget -O /tmp/3.3.2.kehou-1/第四关.txt https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.3.2.kehou-1/第五关.txt
        wget -O /tmp/3.3.2.kehou-1/gdb.log https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.3.2.kehou-1/gdb.log
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

mv -f /tmp/3.3.2.kehou-1/第五关.txt /data/workspace/myshixun/第五关.txt
mv -f /tmp/3.3.2.kehou-1/gdb.log /root/gdb.log

return 0
