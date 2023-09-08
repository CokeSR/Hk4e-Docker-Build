#!/bin/bash
while ! mysqladmin ping --host 172.10.3.100 -u root -pG4H8H9G4SWT8HJIIUUOI8WR4S89HDF1H151A99EQ19ES6X60G4H8RGF4S9DF1F9 --connect-timeout 3; do
  echo "等待连接到数据库..."
  sleep 1
done
echo "连接中..."
mysql -h172.10.3.100 -u root -pG4H8H9G4SWT8HJIIUUOI8WR4S89HDF1H151A99EQ19ES6X60G4H8RGF4S9DF1F9 < /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/bootstrap.sql
mysql -h172.10.3.100 -u hk4e_coke -pG4H8H9G4SWT8HJIIUUOI8WR4S89HDF1H151A99EQ19ES6X60G4H8RGF4S9DF1F9 < /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/data.sql
mysql -h172.10.3.100 -u hk4e_coke -pG4H8H9G4SWT8HJIIUUOI8WR4S89HDF1H151A99EQ19ES6X60G4H8RGF4S9DF1F9 < /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/adjust.sql

echo "数据库导入操作完成"