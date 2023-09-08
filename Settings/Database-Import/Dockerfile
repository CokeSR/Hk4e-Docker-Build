FROM mariadb:10.9

# 这地方写的真他妈绝望 疯狂提示找不到目录，喂给chatgpt了

COPY Database-Import.sh /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/Database-Import.sh

RUN chmod +x /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/Database-Import.sh

WORKDIR /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/

COPY ./sqlfile/root/bootstrap.sql /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/
COPY ./sqlfile/coke/data.sql /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/
COPY ./sqlfile/coke/adjust.sql /GenshinServer-{{%game_version%}}-Docker-Coke/Settings/Database-Import/
CMD ["sh", "Database-Import.sh"]