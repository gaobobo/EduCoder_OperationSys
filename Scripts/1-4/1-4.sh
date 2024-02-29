#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

readonly DownloadSite=${1:-Gitee}

case $DownloadSite in
    Gitee)
        wget -O /tmp/1-4/hd.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/1-4/hd.c
        ;;
    Github)
        wget -O /tmp/1-4/hd.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/1-4/hd.c
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

if [ $? -ne 0 ]; then
    echo "Download hd.c failed. Check netork."
    echo "下载 hd.c 失败。请检查网络。"
    exit 1
fi

mv -f /tmp/1-4/hd.c /home/headless/os/linux-0.11-lab/0/linux/kernel/blk_drv/hd.c

cd /home/headless/os/linux-0.11-lab/0/linux/
make

return 0