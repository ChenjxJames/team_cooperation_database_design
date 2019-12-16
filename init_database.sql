CREATE DATABASE team_cooperation;

USE team_cooperation;

CREATE TABLE `user` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(31) NOT NULL UNIQUE,
  `password` BINARY(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `phone` VARCHAR(11),
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `role` (
  `role_id` INT PRIMARY KEY,
  `id` INT NOT NULL,
  `type` VARCHAR(16) NOT NULL, 
  `role_name` VARCHAR(31) NOT NULL UNIQUE
);

CREATE TABLE `permission` (
  `permission_id` INT PRIMARY KEY,
  `slug` VARCHAR(31) NOT NULL UNIQUE
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
  `organization_name` VARCHAR(31) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `team` (
  `team_id` INT PRIMARY KEY AUTO_INCREMENT,
  `team_name` VARCHAR(31) NOT NULL,
  `organization_id` INT NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`organization_id`) REFERENCES organization(`organization_id`),
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

CREATE TABLE `kanban` (
  `kanban_id` INT PRIMARY KEY AUTO_INCREMENT,
  `team_id` INT NOT NULL,
  `kanban_name` VARCHAR(31) NOT NULL,
  `create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`team_id`) REFERENCES team(`team_id`)
);

CREATE TABLE `kanban_user` (
  `kanban_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`kanban_id`, `user_id`),
  FOREIGN KEY (`kanban_id`) REFERENCES kanban(`kanban_id`),
  FOREIGN KEY (`user_id`) REFERENCES user(`user_id`)
);