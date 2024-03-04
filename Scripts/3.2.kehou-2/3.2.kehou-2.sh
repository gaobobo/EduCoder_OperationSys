#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/3.2.kehou-2

case $DownloadSite in
    Gitee)
        wget -O /tmp/3.2.kehou-2/main.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.2.kehou-2/main.c
        wget -O /tmp/3.2.kehou-2/rootimage-0.11 https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.2.kehou-2/rootimage-0.11
        ;;
    Github)
        wget -O /tmp/3.2.kehou-2/main.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.2.kehou-2/main.c
        wget -O /tmp/3.2.kehou-2/rootimage-0.11 https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.2.kehou-2/rootimage-0.11
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

mv -f /tmp/3.2.kehou-2/rootimage-0.11 /home/headless/os/linux-0.11-lab/images/rootimage-0.11
mv -f /tmp/3.2.kehou-2/main.c /home/headless/os/linux-0.11-lab/0/linux/init/main.c


cd  ~/os/linux-0.11-lab/0/linux/
make

return 0
