# 数据库设计

* create database
  ```sql
  CREATE DATABASE team_cooperation;
  ```

* user  (all user information)
  | name | class | length | not null | default |
  | :-: | :-: | :-: | :-: | :-: |
  | user_id | int |  | yes | AUTO_INCREMENT |
  | username | varchar | 32 | yes | |
  | password | binary | 16 | yes | |
  | email | varchar | 255 | yes | |
  | phone | varchar | 11 | no | null |
  | create_time | datetime | | yes | CURRENT_TIMESTAMP |


  ```sql
  USE team_cooperation;
  CREATE TABLE `user` (
    `user_id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(31) NOT NULL UNIQUE,
    `password` BINARY(16) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `phone` VARCHAR(11),
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  );
  ```

* organization  (all organization information)
  | name | class | length | not null | default |
  | :-: | :-: | :-: | :-: | :-: |
  | organization_id | int |  | yes | AUTO_INCREMENT |
  | organization_name | varchar | 31 | yes |  |
  | create_user | int | | yes | |
  | create_time | datetime | | yes | CURRENT_TIMESTAMP |

  ```sql
  CREATE TABLE `organization` (
    `organization_id` INT PRIMARY KEY AUTO_INCREMENT,
    `organization_name` VARCHAR(31) NOT NULL,
    `create_user` INT NOT NULL,
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`create_user`) REFERENCES user(`user_id`),
  );
  ```

* team  (all team information)
  | name | class | length | not null | default |
  | :-: | :-: | :-: | :-: | :-: |
  | team_id | int |  | yes | AUTO_INCREMENT |
  | team_name | varchar | 31 | yes |  |
  | create_user | int | | yes | |
  | create_time | datetime | | yes | CURRENT_TIMESTAMP |

  type ["organization", "personal"]

  ```sql
  CREATE TABLE `team` (
    `team_id` INT PRIMARY KEY AUTO_INCREMENT,
    `team_name` VARCHAR(31) NOT NULL,
    `type` VARCHAR(31) NOT NULL,
    `create_user` INT NOT NULL,
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`create_user`) REFERENCES user(`user_id`),
  );
  ```

* team_user  ()
  | name | class | length | not null | default |
  | :-: | :-: | :-: | :-: | :-: |
  | team_id | int |  | yes |  |
  | user_id | int |  | yes |  |
  | role_id | int |  | yes |  |

  ```sql
  CREATE TABLE `team_user` (
    `team_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    PRIMARY KEY (`team_id`, `user_id`),
    FOREIGN KEY (`team_id`) REFERENCES team(`team_id`),
    FOREIGN KEY (`user_id`) REFERENCES user(`user_id`),
    FOREIGN KEY (`role_id`) REFERENCES role(`role_id`)
  );
  ```

* role
  | name | class | length | not null | default |
  | :-: | :-: | :-: | :-: | :-: |
  | role_id | int | | yes |  |
  | role_name | varchar | 31 | yes |  |

  * 0 site_admin
  * 1 organization_creater
  * 2 board_creater
  * 3 board_admin
  * 4 board_member

  ```sql
  CREATE TABLE `role` (
    `role_id` INT PRIMARY KEY,
    `role_name` VARCHAR(31) NOT NULL UNIQUE
  );
  ```


* permission
  | name | class | length | not null | default |
  | :-: | :-: | :-: | :-: | :-: |
  | permission_id | int | | yes |  |
  | slug | varchar | 31 | yes |  |

  ```sql
  CREATE TABLE `permission` (
    `permission_id` INT PRIMARY KEY,
    `slug` VARCHAR(31) NOT NULL UNIQUE
  );
  ```

* role_permission
  | name | class | length | not null | default |
  | :-: | :-: | :-: | :-: | :-: |
  | role_id | int | | yes | |
  | permission_id | int | | yes | |

  ```sql
  CREATE TABLE `role_permission` (
    `role_id` INT NOT NULL,
    `permission_id` INT NOT NULL,
    PRIMARY KEY(`role_id`, `permission_id`),
    FOREIGN KEY (`role_id`) REFERENCES role(`role_id`),
    FOREIGN KEY (`permission_id`) REFERENCES permission(`permission_id`)
  );
  ```

* board 
  | name | class | length | not null | default |
  | :-: | :-: | :-: | :-: | :-: |
  | board_id | int | | yes | AUTO_INCREMENT |
  | team_id | int | yes | |
  | board_name | varchar | 31 | yes | |
  | create_user | int | | yes | |
  | create_time | datetime | | yes | CURRENT_TIMESTAMP |

  ```sql
  CREATE TABLE `board` (
    `board_id` INT PRIMARY KEY AUTO_INCREMENT,
    `team_id` INT NOT NULL,
    `board_name` VARCHAR(31) NOT NULL,
    `create_user` INT NOT NULL,
    `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (`team_id`) REFERENCES team(`team_id`)
  );
  ```
