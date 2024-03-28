#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/2.3.kehou-4

case $DownloadSite in
    Gitee)
        wget -O /tmp/2.3.kehou-4/sys.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/2.3.kehou-4/sys.c
        wget -O /tmp/2.3.kehou-4/sys.h https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/2.3.kehou-4/sys.h
        wget -O /tmp/2.3.kehou-4/main.c https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/2.3.kehou-4/main.c
        wget -O /tmp/2.3.kehou-4/system_call.s https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/2.3.kehou-4/system_call.s

        ;;
    Github)
        wget -O /tmp/2.3.kehou-4/sys.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/2.3.kehou-4/sys.c
        wget -O /tmp/2.3.kehou-4/sys.h https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/2.3.kehou-4/sys.h
        wget -O /tmp/2.3.kehou-4/main.c https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/2.3.kehou-4/main.c
        wget -O /tmp/2.3.kehou-4/system_call.s https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/2.3.kehou-4/system_call.s
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

rm -rf /home/headless/os/linux-0.11-lab/0/

cd ~/os/linux-0.11-lab
tar -zxvf ../0.tgz 0/

mv -f /tmp/2.3.kehou-4/sys.c /home/headless/os/linux-0.11-lab/0/linux/kernel/sys.c
mv -f /tmp/2.3.kehou-4/sys.h /home/headless/os/linux-0.11-lab/0/linux/include/linux/sys.h
mv -f /tmp/2.3.kehou-4/main.c /home/headless/os/linux-0.11-lab/0/linux/init/main.c
mv -f /tmp/2.3.kehou-4/system_call.s /home/headless/os/linux-0.11-lab/1/linux/kernel/system_call.s

cd  ~/os/linux-0.11-lab/0/linux/
make

cd ~/os/linux-0.11-lab
rm -rf cur
ln -s 0 cur

return 0