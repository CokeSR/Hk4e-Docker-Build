SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE USER IF NOT EXISTS 'hk4e_coke'@'172.10.%' IDENTIFIED BY 'G4H8H9G4SWT8HJIIUUOI8WR4S89HDF1H151A99EQ19ES6X60G4H8RGF4S9DF1F9';
CREATE USER IF NOT EXISTS 'hk4e_readonly_coke'@'172.10.%' IDENTIFIED BY 'G4H8H9G4SWT8HJIIUUOI8WR4S89HDF1H151A99EQ19ES6X60G4H8RGF4S9DF1F9';

DROP DATABASE IF EXISTS `{{%game_version%}}-hk4e-config`; CREATE DATABASE `{{%game_version%}}-hk4e-config` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
DROP DATABASE IF EXISTS `{{%game_version%}}-hk4e-deploy`; CREATE DATABASE `{{%game_version%}}-hk4e-deploy` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
DROP DATABASE IF EXISTS `{{%game_version%}}-hk4e-order`; CREATE DATABASE `{{%game_version%}}-hk4e-order` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
DROP DATABASE IF EXISTS `{{%game_version%}}-hk4e-user`; CREATE DATABASE `{{%game_version%}}-hk4e-user` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

GRANT ALL PRIVILEGES ON `{{%game_version%}}-hk4e-user`.* TO 'hk4e_coke'@'172.10.%';
GRANT ALL PRIVILEGES ON `{{%game_version%}}-hk4e-config`.* TO 'hk4e_coke'@'172.10.%';
GRANT ALL PRIVILEGES ON `{{%game_version%}}-hk4e-deploy`.* TO 'hk4e_coke'@'172.10.%';
GRANT ALL PRIVILEGES ON `{{%game_version%}}-hk4e-order`.* TO 'hk4e_coke'@'172.10.%';

GRANT SELECT ON `{{%game_version%}}-hk4e-user`.* TO 'hk4e_readonly_coke'@'172.10.%';
GRANT SELECT ON `{{%game_version%}}-hk4e-config`.* TO 'hk4e_readonly_coke'@'172.10.%';
GRANT SELECT ON `{{%game_version%}}-hk4e-deploy`.* TO 'hk4e_readonly_coke'@'172.10.%';
GRANT SELECT ON `{{%game_version%}}-hk4e-order`.* TO 'hk4e_readonly_coke'@'172.10.%';

FLUSH PRIVILEGES;