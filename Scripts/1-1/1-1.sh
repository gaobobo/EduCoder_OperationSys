#!/bin/sh

#     Operation System Course's Educoder excrises shell script. / 操作系统课程的头歌过关脚本。
#     Copyright (C) 2024  gaobobo

echo "${0}脚本已运行"

mkdir /linux
touch hello.txt
mv /hello.txt /linux/hello.txt
rm -f hello.txt

echo "脚本运行完成。可直接评测。"

exit 0