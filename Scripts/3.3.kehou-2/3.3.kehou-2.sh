#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/3.3.kehou-2

case $DownloadSite in
    Gitee)
        wget -O /tmp/3.3.kehou-2/1.log https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.3.kehou-1/1.log
        wget -O /tmp/3.3.kehou-2/sched.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.3.kehou-1/sched.c
        ;;
    Github)
        wget -O /tmp/3.3.kehou-2/1.log https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.3.kehou-1/1.log
        wget -O /tmp/3.3.kehou-2/sched.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.3.kehou-1/sched.c
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

cp /data/workspace/myshixun/exp2/1.2.tgz ~/os/

cd ~/os/linux-0.11-lab
tar -zxvf ../1.2.tgz 1.2/

rm -rf cur
ln -s 1.2 cur

cd 1.2/linux/
# make

mv -f /tmp/3.3.kehou-2/system_call.s /root/os/linux-0.11-lab/1.2/linux/kernel/sched.c

cd ~/os/linux-0.11-lab/1.2/linux/
make 

mv -f /tmp/3.3.kehou-2/1.log /root/1.log

return 0
