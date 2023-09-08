#!/bin/bash
#-*-coding:utf-8-*-
outernal_ip=$(curl -s https://api.ipify.org)
get_internal_ip() {
  internal_ip=$(hostname -I | awk '{print $1}')
  echo $internal_ip
}
internal_ip=$(get_internal_ip)
while true; do
    clear
    echo "准备替换XML文件的OUTER_IP:"
    echo "私网地址: $internal_ip 公网地址: $outernal_ip"
    echo "++++++++++++++++++++++++++++++++++++++++++"
    echo "| 下面选择你的服务器类型以进行相关的操作 |"
    echo "++++++++++++++++++++++++++++++++++++++++++"
    echo "| 1) 有公网IP的云服务器/物理服务器       |"
    echo "| 2) 无公网IP的虚拟机/物理服务器         |"
    echo "++++++++++++++++++++++++++++++++++++++++++"
    read -p "请选择: " choice
    case $choice in
        1)
          echo "替换IP...($outernal_ip)"
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/dbgate/conf/dbgate.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/dbgate/conf/dbgate.xml
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/dispatch/conf/dispatch.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/dispatch/conf/dispatch.xml
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/gameserver/conf/gameserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/gameserver/conf/gameserver.xml
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/gateserver/conf/gateserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/gateserver/conf/gateserver.xml
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/muipserver/conf/muipserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/muipserver/conf/muipserver.xml
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/multiserver/conf/multiserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/multiserver/conf/multiserver.xml
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/nodeserver/conf/nodeserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/nodeserver/conf/nodeserver.xml
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/oaserver/conf/oaserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/oaserver/conf/oaserver.xml
          sed "s/%OUTER_IP%/$outernal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/sqlfile/coke/data.sql.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/sqlfile/coke/data.sql
          echo "替换IP完成"
          sleep 3s
          exit 0
          ;;
        2)
          echo "替换IP...($internal_ip)"
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/dbgate/conf/dbgate.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/dbgate/conf/dbgate.xml
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/dispatch/conf/dispatch.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/dispatch/conf/dispatch.xml
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/gameserver/conf/gameserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/gameserver/conf/gameserver.xml
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/gateserver/conf/gateserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/gateserver/conf/gateserver.xml
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/muipserver/conf/muipserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/muipserver/conf/muipserver.xml
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/multiserver/conf/multiserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/multiserver/conf/multiserver.xml
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/nodeserver/conf/nodeserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/nodeserver/conf/nodeserver.xml
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Server/oaserver/conf/oaserver.xml.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Server/oaserver/conf/oaserver.xml
          sed "s/%OUTER_IP%/$internal_ip/g" /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/sqlfile/coke/data.sql.tmpl > /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/sqlfile/coke/data.sql
          echo "替换IP完成"
          sleep 3s
          exit 0
          ;;
        *)
          echo "一共就他妈俩数字，你还能输错？？？？？"
          sleep 3s
          ;;
    esac
done
