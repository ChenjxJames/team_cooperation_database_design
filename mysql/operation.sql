-- table user
-- register
INSERT INTO `user`(`username`, `password`, `email`)
VALUES("username", UNHEX("password"), "email");
-- login
SELECT * FROM `user` WHERE `username`="username", `password`=UNHEX("password");
-- set password
UPDATE `user` SET `password`=UNHEX("password") WHERE `username`="username";
-- set info
UPDATE `user` SET `username`=?,`password`=UNHEX(?),`email`=?,`phone`=? WHERE `user_id`=?;


-- table team

INSERT INTO `team`(`team_name`) VALUES("team_name");


-- permission
-- query all role permission
SELECT * FROM `role`
LEFT JOIN `role_permission` ON `role`.`role_id`=`role_permission`.`role_id`
LEFT JOIN `permission` ON `role_permission`.`permission_id`=`permission`.`permission_id`
ORDER BY `role`.`role_id`;