#!/bin/sh第二关

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/3.2.kehou-1

case $DownloadSite in
    Gitee)
        wget -O /tmp/3.2.kehou-1/exec.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.2.kehou-1/exec.c
        wget -O /tmp/3.2.kehou-1/fork.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.2.kehou-1/fork.c
        ;;
    Github)
        wget -O /tmp/3.2.kehou-1/exec.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.2.kehou-1/exec.c
        wget -O /tmp/3.2.kehou-1/fork.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.2.kehou-1/fork.c
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

mv -f /tmp/3.2.kehou-1/exec.c /home/headless/os/linux-0.11-lab/0/linux/fs/exec.c
mv -f /tmp/3.2.kehou-1/fork.c /home/headless/os/linux-0.11-lab/0/linux/kernel/fork.c

cd  ~/os/linux-0.11-lab/0/linux/
make

return 0
