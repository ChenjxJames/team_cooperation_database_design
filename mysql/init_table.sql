CREATE DATABASE team_cooperation;

USE team_cooperation;

CREATE TABLE `user` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(32) NOT NULL UNIQUE,
  `password` BINARY(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `phone` CHAR(11),
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `role` (
  `role_id` INT PRIMARY KEY,
  `role_name` VARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE `permission` (
  `permission_id` INT PRIMARY KEY,
  `permission_name` VARCHAR(32) NOT NULL UNIQUE
);

CREATE TABLE `role_permission` (
  `role_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY(`role_id`, `permission_id`),
  FOREIGN KEY (`role_id`) REFERENCES role(`role_id`),
  FOREIGN KEY (`permission_id`) REFERENCES permission(`permission_id`)
);

CREATE TABLE `organization` (
  `organization_id` INT PRIMARY KEY AUTO_INCREMENT,
  `organization_name` VARCHAR(32) NOT NULL,
  `email` VARCHAR(32),
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `organization_user` (
  `organization_id` INT NOT NULL,
  `user_id` INT NOT NULL UNIQUE,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`organization_id`, `user_id`),
  FOREIGN KEY (`organization_id`) REFERENCES organization(`organization_id`),
  FOREIGN KEY (`user_id`) REFERENCES user(`user_id`),
  FOREIGN KEY (`role_id`) REFERENCES role(`role_id`)
);

CREATE TABLE `team` (
  `team_id` INT PRIMARY KEY AUTO_INCREMENT,
  `team_name` VARCHAR(32) NOT NULL,
  `organization_id` INT NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`organization_id`) REFERENCES organization(`organization_id`)
);

CREATE TABLE `team_user` (
  `team_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`team_id`, `user_id`),
  FOREIGN KEY (`team_id`) REFERENCES team(`team_id`),
  FOREIGN KEY (`user_id`) REFERENCES user(`user_id`),
  FOREIGN KEY (`role_id`) REFERENCES role(`role_id`)
);


-- 看板模块 start

CREATE TABLE `board` (
  `board_id` INT PRIMARY KEY AUTO_INCREMENT,
  `board_name` VARCHAR(32) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `board_user` (
  `board_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`board_id`, `user_id`),
  FOREIGN KEY (`board_id`) REFERENCES board(`board_id`),
  FOREIGN KEY (`user_id`) REFERENCES user(`user_id`),
  FOREIGN KEY (`role_id`) REFERENCES role(`role_id`)
);

CREATE TABLE `team_board` (
  `team_id` INT NOT NULL,
  `board_id` INT NOT NULL,
  PRIMARY KEY (`team_id`, `board_id`),
  FOREIGN KEY (`team_id`) REFERENCES team(`team_id`),
  FOREIGN KEY (`board_id`) REFERENCES board(`board_id`)
);

CREATE TABLE `list` (
  `list_id` INT PRIMARY KEY AUTO_INCREMENT,
  `list_name` VARCHAR(32) NOT NULL,
  `board_id` INT NOT NULL,
  `order` INT NOT NULL,
  FOREIGN KEY (`board_id`) REFERENCES board(`board_id`)
);

CREATE TABLE `lane` (
  `lane_id` INT PRIMARY KEY AUTO_INCREMENT,
  `lane_name` VARCHAR(32) NOT NULL,
  `board_id` INT NOT NULL,
  `order` INT NOT NULL,
  FOREIGN KEY (`board_id`) REFERENCES board(`board_id`)
);

CREATE TABLE `task` (
  `task_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `task_name` VARCHAR(64) NOT NULL,
  `information` VARCHAR(10000),
  `task_dealine` DATETIME,
  `list_id` INT NOT NULL,
  `lane_id` INT NOT NULL DEFAULT 0, 
  `order` INT NOT NULL,

  `have_sub_task` BOOLEAN NOT NULL DEFAULT FALSE,
  `have_user` BOOLEAN NOT NULL DEFAULT FALSE,
  `have_file` BOOLEAN NOT NULL DEFAULT FALSE,
  `have_comment` BOOLEAN NOT NULL DEFAULT FALSE,
  `have_tag` BOOLEAN NOT NULL DEFAULT FALSE,

  FOREIGN KEY (`list_id`) REFERENCES list(`list_id`),
  FOREIGN KEY (`lane_id`) REFERENCES lane(`lane_id`)
);

CREATE TABLE `sub_task` (
  `sub_task_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `sub_task_name` VARCHAR(64),
  `is_completed` BOOLEAN NOT NULL DEFAULT FALSE,
  `task_id` BIGINT NOT NULL,
  FOREIGN KEY (`task_id`) REFERENCES task(`task_id`)
);

CREATE TABLE `task_user` (
  `task_id` BIGINT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`task_id`, `user_id`),
  FOREIGN KEY (`task_id`) REFERENCES task(`task_id`),
  FOREIGN KEY (`user_id`) REFERENCES user(`user_id`)
);

CREATE TABLE `task_comment` (
  `comment_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `comment_content` VARCHAR(255) NOT NULL,
  `task_id` BIGINT NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`task_id`) REFERENCES task(`task_id`)
);

CREATE TABLE `tag` (
  `tag_id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `tag_name` VARCHAR(64) NOT NULL,
  `board_id` INT NOT NULL,
  `listor` BINARY(3) NOT NULL,
  FOREIGN KEY (`board_id`) REFERENCES board(`board_id`)
);
-- UNHEX()可以将"af09cb"装换成BINARY,HEX()反之

CREATE TABLE `task_tag` (
  `task_id` BIGINT NOT NULL,
  `tag_id` BIGINT NOT NULL,
  PRIMARY KEY (`task_id`, `tag_id`),
  FOREIGN KEY (`task_id`) REFERENCES task(`task_id`),
  FOREIGN KEY (`tag_id`) REFERENCES tag(`tag_id`)
);

-- 看板模块 end

-- 日程模块 start

CREATE TABLE  `event` (
  `event_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `event_name` VARCHAR(64) NOT NULL,
  `information` VARCHAR(10000),
  `is_group` BOOLEAN NOT NULL DEFAULT FALSE, 
  `create_user` INT NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`create_user`) REFERENCES user(`user_id`)
);

-- 参与事件的用户
CREATE TABLE `event_user` (
  `event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `user_id`),
  FOREIGN KEY (`event_id`) REFERENCES event(`event_id`),
  FOREIGN KEY (`user_id`) REFERENCES user(`user_id`)
);

-- 参与事件的团队
CREATE TABLE `event_team` (
  `event_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `team_id`),
  FOREIGN KEY (`event_id`) REFERENCES event(`event_id`),
  FOREIGN KEY (`team_id`) REFERENCES team(`team_id`)
);

-- 工作时间记录，week填星期，用来生成一周工作的时间表
CREATE TABLE `work_time` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `create_user` INT NOT NULL,
  `week` VARCHAR(10),
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`create_user`) REFERENCES user(`user_id`)
);
-- 日程模块 end

-- 文件模块 start

CREATE TABLE `file` (
  `file_id` INT PRIMARY KEY AUTO_INCREMENT,
  `filename` VARCHAR(255) NOT NULL,
  `file_type` VARCHAR(16) NOT NULL,
  `md5` BINARY(16) NOT NULL,
  `path` VARCHAR(255) NOT NULL,
  `create_user` INT NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`create_user`) REFERENCES user(`user_id`)
);

CREATE TABLE `file_share` (
  `file_id` INT NOT NULL,
  `share_user` INT NOT NULL,
  `create_user` INT NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_id`, `share_user`, `create_user`),
  FOREIGN KEY (`file_id`) REFERENCES file(`file_id`),
  FOREIGN KEY (`share_user`) REFERENCES user(`user_id`),
  FOREIGN KEY (`create_user`) REFERENCES user(`user_id`)
);

-- 文件模块 end

CREATE TABLE `task_file` (
  `task_id` BIGINT NOT NULL,
  `file_id` INT NOT NULL,
  PRIMARY KEY (`task_id`, `file_id`),
  FOREIGN KEY (`task_id`) REFERENCES task(`task_id`),
  FOREIGN KEY (`file_id`) REFERENCES file(`file_id`)
);