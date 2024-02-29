#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/2.1.kehou-2

case $DownloadSite in
    Gitee)
        wget -O /tmp/2.1.kehou-2/sched.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/2.1.kehou-2/sched.c
        ;;
    Github)
        wget -O /tmp/2.1.kehou-2/sched.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/2.1.kehou-2/sched.c
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

mv -f /tmp/2.1.kehou-2/sched.c /root/os/linux-0.11-lab/0/linux/kernel/sched.c

make ~/os/linux-0.11-lab/0/linux/

return 0