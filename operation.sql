-- table user

-- register
INSERT INTO `user`(`username`, `password`, `email`, `phone`)
VALUES("username", UNHEX("password"), "email", "phone");
-- login
SELECT * FROM `user` WHERE `username`="username", `password`=UNHEX("password");
-- set password
UPDATE `user` SET `password`=UNHEX("password") WHERE `username`="username";
-- set info
UPDATE `user` SET `email`="email",`phone`="phone" WHERE `username`="username";


-- table team

INSERT INTO `team`(`team_name`) VALUES("team_name");


