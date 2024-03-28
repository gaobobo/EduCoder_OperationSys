#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/2.3.kehou-5

case $DownloadSite in
    Gitee)
        wget -O /tmp/2.3.kehou-5/1.log https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/2.3.kehou-5/1.log
        wget -O /tmp/2.3.kehou-5/rootimage-0.11 https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/2.3.kehou-5/rootimage-0.11
        wget -O /tmp/2.3.kehou-4.sh https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Scripts/2.3.kehou-4/2.3.kehou-4.sh
        ;;
    Github)
        wget -O /tmp/2.3.kehou-5/1.log https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/2.3.kehou-5/1.log
        wget -O /tmp/2.3.kehou-5/rootimage-0.11 https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/2.3.kehou-5/rootimage-0.11
        wget -O /tmp/2.3.kehou-4.sh https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Scripts/2.3.kehou-4/2.3.kehou-4.sh
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

chmod +x /tmp/2.3.kehou-4.sh
/tmp/2.3.kehou-4.sh $DownloadSite

mv -f /tmp/2.3.kehou-5/rootimage-0.11 /home/headless/os/linux-0.11-lab/images/rootimage-0.11
mv -f /tmp/2.3.kehou-5/1.log /root/1.log

return 0
