#!/bin/bash

curl -fsSL https://get.docker.com | bash -s docker --mirror aliyun
# 开机自启动
systemctl enable docker
#启动docker
service docker start

# 运行此命令以下载 Docker Compose 的当前稳定版本：
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 对二进制文件应用可执行权限：
sudo chmod +x /usr/local/bin/docker-compose
# 如果docker-compose安装后命令失败，请检查您的路径。您还可以/usr/bin在路径中创建指向或任何其他目录的符号链接。
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose