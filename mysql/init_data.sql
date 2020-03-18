USE team_cooperation;

INSERT INTO `role`(`role_id`, `role_name`) 
VALUES ("0", "site_admin"),
("1", "organization_super_admin"),
("2", "organization_admin"),
("3", "organization_member"),
("4", "team_super_admin"),
("5", "team_admin"),
("6", "team_member");

INSERT INTO `permission`(`permission_id`, `permission_name`)
VALUES("0", "manage_site"),
("10", "set_organization_admin"),
("11", "remove_organization"),
("12", "set_organization_info"),
("13", "manage_organization_member"),
("14", "join_organization"),
("15", "exit_organization"),
("20", "set_team_admin"),
("21", "remove_team"),
("22", "set_team_info"),
("23", "manage_team_member"),
("24", "exit_team"),
("31", "remove_board");

INSERT INTO `role_permission`(`role_id`, `permission_id`)
VALUES("0", "0"),
("1", "10"),
("1", "11"),
("1", "12"),
("1", "13"),
("2", "12"),
("2", "13"),
("4", "20"),
("4", "21"),
("4", "22"),
("4", "23"),
("4", "31"),
("5", "22"),
("5", "23"),
("5", "24"),
("5", "31"),
("6", "24");


-- INSERT INTO `role_permission`(`role_id`, `permission_id`) VALUES("2", "15"),("3", "15");