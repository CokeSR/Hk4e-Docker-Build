# 创建其他版本的文件时，应该修改以下内容：

- Server下的xml文件，注意数据库配置

- Settings下的导入数据库的dockerfile，路径和文件名是否正确

- shell脚本的文件路径和文件名是否正确

- 使用前更改所有包含{{%game_version%}}和{{%client_version%}}字段的文件（docker-compose.yml | Setting目录 | start.sh）

# Server目录下导入服务端即可 （常规结构的目录）
- 使用Ubuntu22.04最佳，执行脚本即可

# 在正式进入游戏前，你要知道？
- 在http://{{%YOUR_ADDRESS%}}:21000/account/register中来注册你的游戏账号
- 登录时只需要记住用户名即可，密码随意
- 如果你没有热更文件，请清除{{%game_version%}}-hk4e-deploy库中的region表的rescourse_url和data_url以继续
- 如果你没有可用于计算muip_sign的GM工具，请留空muipserver.xml和muipserver.xml.tmpl中的http签名项

# 其他信息
## 以下是端口信息：
|  ServerName  |  Port   |  App_Id(1003)  |
| ------------ | ------- | -------------- |
|  mysql       |  3000   |     noApp_Id   |
|  redis       | noport  |     noApp_Id   |
|  nodeserver  |  21121  |   1003.3.3.1   |
|  dbgate      | noport  |   1003.4.4.1   |
|  dispatch    |  21041  |   1003.5.5.1   |
|  gateserver  |  21081  |   1003.1.1.1   |
|  gameserver  |  21111  |   1003.2.2.1   |
|  muipserver  |  21051  |   1003.6.5.1   |
|  multiserver | noport  |   1003.7.7.1   |
|  oaserver    |  21091  |   1003.9.9.1   |
- Docker可视化面板链接：http://{{%YOUR_ADDRESS%}}:9000
- SDK代理：http://{{%YOUR_ADDRESS%}}:21000

## 以下是配置信息：
- mysql/root passwd: G4H8H9G4SWT8HJIIUUOI8WR4S89HDF1H151A99EQ19ES6X60G4H8RGF4S9DF1F9
- redis passwd: G4H8H9G4SWT8HJIIUUOI8WR4S89HDF1H151A99EQ19ES6X60G4H8RGF4S9DF1F9
- sdkserver secret_key: cokeserver2022
- region: dev_docker
- muip_sign: g5fg5s5ty9h5j9e9f5rw09g5e9fhrg9e4grgss

## RSAKEY:
- 你需要获得某些客户端的补丁以继续游戏（公测1.0-2.8版本无须补丁）
### Dispatch_key:
```
<RSAKeyValue><Modulus>x6DXVi3/8v/9W0kbDjAi/96yoZG30Fydk7hWxdR4dpqKP0M58aLScwmd49c1i+uUGmGNmSSP0yqH2gFr6QS3yhBTnvQ3cs1UYG/j1PAHUs263pQy5gZay7RW41G+Vm2cL1AzuXpoEQ9JXDpTbOlGwl8pin+enVSYjXAwLrOQKSVRC6vrlnjDX8ozf7mPCC8h7w2XfBfsmuL+K8UvE6KDKQshQYppjDSGi8AtsFScIUmTMmXYPjWdP+gN/iD2M/vjXQAvlunSvXkHgWJ2bo/45cfFbXlxrRfStdri3SC16yFaTR6FbPh+cwci1RSZE/G1yA4hjB4UdYrb/hsYfMpK7w==</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>
```
### Password:
```
<RSAKeyValue><Modulus>yeF8n3X+VkwIhAdEK6Mp9ZGMW37N9tLWAlRnLkQ/7XccC7fim0LtK4FqEZLgnRvoPj0kWEhi6lWiY8v2gPdkKXhLqyTu/Cc2Ug+Let7U9t6Ez3gIdt3m5p499mbRFhx8ZuvZb6Q9I4++UXYWEfNisWADGOBl5qJD23FnMcTzjis=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>
```
## RecoverServer
- 在docker-compose中，配置了importserver项，这是用于重置数据库(存档数据也会清除)，请谨慎使用

# 注意！这只是一个模板，具体部分还需自己进行调控
![image](https://github.com/CokeSR/Hk4e-docker-build/blob/CokeSR/Public/images/coke.png)
