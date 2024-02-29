#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

DownloadSite=${1:-Gitee} 
readonly DownloadSite

mkdir /linux/
cd /
touch hello.txt
mv hello.txt /linux/1.txt
rm -f hello.txt

return 0