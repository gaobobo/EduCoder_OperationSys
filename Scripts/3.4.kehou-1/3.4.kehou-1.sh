#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee}
readonly DownloadSite

mkdir -p /tmp/3.4.kehou-1

case $DownloadSite in
    Gitee)
        wget -O /tmp/3.4.kehou-1/第三关.txt https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.4.kehou-1/第三关.txt
        wget -O /tmp/3.4.kehou-1/gdb.log https://gitee.com/coconut_floss/EduCoder_OperationSys/raw/main/Source/3.4.kehou-1/gdb.log
        ;;
    Github)
        wget -O /tmp/3.4.kehou-1/第三关.txt https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.4.kehou-1/第三关.txt
        wget -O /tmp/3.4.kehou-1/gdb.log https://raw.githubusercontent.com/gaobobo/EduCoder_OperationSys/main/Source/3.4.kehou-1/gdb.log
        ;;
    *)
        echo "Unknown download site: $DownloadSite"
        echo "未知的下载站点：$DownloadSite"
        return 1
        ;;
esac

mv -f /tmp/3.4.kehou-1/第三关.txt /data/workspace/myshixun/第三关.txt
mv -f /tmp/3.4.kehou-1/gdb.log /root/gdb.log

echo "提示：该关卡的第4题答案不唯一，如果无法通关可能是其他答案。可能的其他答案有：0x06f33、0x6f37或0x8:0x00006f33、0x8:0x00006f37或0x6f33、0x6f37或0x00006f33、0x00006f37或0x8:0x6f33、0x8:0x6f37等。"
echo "关于该问题的解释请参见： https://github.com/gaobobo/EduCoder_OperationSys/issues/27 。"
echo "如果遇到了其他答案，欢迎在 https://github.com/gaobobo/EduCoder_OperationSys 中提出。"

return 0
