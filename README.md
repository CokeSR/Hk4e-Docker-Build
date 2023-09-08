# 创建其他版本的文件时，应该修改以下内容：

- Server下的xml文件，注意数据库配置

- Settings下的导入数据库的dockerfile，路径和文件名是否正确

- shell脚本的文件路径和文件名是否正确

- 使用前更改所有包含{{%game_version%}}字段的文件（docker-compose.yml、Setting目录、start.sh）

- 剩下的自己调控吧（自带的sql不一定支持某些版本，请自己提供）

# Server目录下导入服务端即可 （常规结构的目录）
- 使用Ubuntu22.04最佳，执行脚本即可

# 注意！这只是一个模板，具体部分还需自己进行调控
