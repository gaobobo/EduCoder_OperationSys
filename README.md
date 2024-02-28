# 操作系统头歌快捷通关脚本

本项目提供shell脚本，运行后即可快速通关。

本项目不检查任何来自Gitee的Issue。如果你从Gitee访问本项目，可能不是最新的副本。前往本项目的[Github主页](githun.com/gaobobo/EduCoder_OperationSys)获取最新的更新。

## 如何使用

将下列代码中的`{LevelCode}`替换为相应的的关卡代号即可。关卡代号为`章节号.小关`。例如，“课堂练习1：环境体验”的“第4关：实验环境练习”关卡代号为`4.1`。

```shell
sudo apt update
sudo apt install -y wget
wget -O /tmp/start.sh https://github.com/gaobobo/EduCoder_OperationSys/blob/main/Scripts/start.sh
chmod +x /tmp/start.sh
/tmp/start.sh
```

各个关卡的通关代码也可在微信公众号“椰松杂货铺”获取。

## 如何反馈

直接提交Issue即可。

## 开源许可

本项目遵循`GNU GENERAL PUBLIC LICENSE`开源许可。