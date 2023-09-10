#!/bin/bash
# -*-coding:utf-8-*-
##########################################################
# Auth: Coke (1500811684)
# Function: install docker & pull GenshinServer
##########################################################


# Download latest rescourse
sudo apt update && apt upgrade -y && apt install unzip -y && apt install iproute2 -y && apt install ntp ntpdate -y && apt install curl -y

# Try to get inner_ip
outernal_ip=$(curl -s https://api.ipify.org)
get_internal_ip() {
  internal_ip=$(hostname -I | awk '{print $1}')
  echo $internal_ip
}
internal_ip=$(get_internal_ip)
echo "私网地址: $internal_ip 公网地址: $outernal_ip"

# unzip GenshinServer_Data & give permission
# unzip hk4e-Docker.zip
chmod -R 777 /GenshinServer-{{%game_version%}}-Docker-Coke
cd ../

# Install docker
sudo apt install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
echo "Docker安装完成...."
sleep 3s

# Pull & start portainer
docker pull portainer/portainer-ce
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /GenshinServer-{{%game_version%}}-Docker-Coke/Portainer:/data --restart=always --name portainer portainer/portainer-ce:latest
echo "访问docker可视化管理页面:"
echo "私网地址: $internal_ip:9000"
echo "公网地址: $outernal_ip:9000"
sleep 5s

# Try to update system time
echo "正在矫正服务器时间"
echo "当前时间为：$(date '+%Y年%m月%d日 %H时%M分%S秒')"
ntp_server="ntp.aliyun.com"
systemctl stop ntp
timedatectl set-timezone Asia/Shanghai
ntpdate $ntp_server
systemctl start ntp
echo "时间矫正操作完成，当前时间为：$(date '+%Y年%m月%d日 %H时%M分%S秒')"


# Time update in docker portainer
#apt install ntpdate -y
#dpkg-reconfigure tzdata

if [ -f docker-compose.yml ]; then
  docker compose kill
  docker compose rm -f
fi

docker compose kill
docker compose rm
sudo rm -rf /GenshinServer-{{%game_version%}}-Docker-Coke/Database/mysql/
sudo rm -rf /GenshinServer-{{%game_version%}}-Docker-Coke/Database/redis/

# Remove all unused networks. Unused networks are those which are not referenced by any containers
docker network prune -f
cd /GenshinServer-{{%game_version%}}-Docker-Coke/
# Starting build images & pull servers
sudo sh /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Server-Build/Server-Build.sh
docker build -t hk4e/cokeserver .
docker compose up -d mysql redis
docker compose up importserver
sleep 3s

# delete "{{%game_version%}}-RecoverServer" container
# {{%game_version%}}-RecoverServer是用来导入数据库的，必要的时候可以docker compose up importserver来重置数据库
container_id=$(docker ps -aqf "name={{%game_version%}}-RecoverServer")
if [ -n "$container_id" ]; then
  docker stop "$container_id"
  docker rm "$container_id"
  echo "{{%game_version%}}-RecoverServer成功删除."
else
  echo "{{%game_version%}}-RecoverServer不存在,请检查docker-compose配置"
fi

# start service
docker compose up -d nodeserver dbgate dispatch gateserver gameserver muipserver multiserver sdkserver
sudo rm -f /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/sqlfile/coke/data.sql
sleep 5s
clear
docker ps -a
echo "服务部署完成，请输入'docker ps'或Docker管理面板来查看服务运行状态"
echo "访问docker可视化管理页面:"
echo "私网地址: $internal_ip:9000"
echo "公网地址: $outernal_ip:9000"
# docker compose down