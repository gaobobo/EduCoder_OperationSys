#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/2.1.kehou-1

case $DownloadSite in
    Gitee)
        wget -O /tmp/2.1.kehou-1/system_call.s https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/2.1.kehou-1/system_call.s
        ;;
    Github)
        wget -O /tmp/2.1.kehou-1/system_call.s https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/2.1.kehou-1/system_call.s
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac


cp /data/workspace/myshixun/exp1/1.tgz ~/os/

cd ~/os/linux-0.11-lab
tar -zxvf ../1.tgz 1/

rm -rf cur
ln -s 1 cur

cd 1/linux/
# make

rm -f /tmp/2.1.kehou-1/system_call.s /root/os/linux-0.11-lab/1/linux/kernel/system_call.s
make ~/os/linux-0.11-lab/1/linux/

exit 0