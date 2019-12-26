USE team_cooperation;

INSERT INTO `role`(`role_id`, `role_name`) 
VALUES ("0", "site_admin"),
("1", "organization_super_admin"),
("2", "organization_admin"),
("3", "organization_member"),
("4", "team_super_admin"),
("5", "team_admin"),
("6", "team_member"),
("7", "board_admin"),
("8", "board_member");

INSERT INTO `permission`(`permission_id`, `permission_name`)
VALUES("0", "manage_site"),
("1", "manage_organization_admin"),
("2", "delete_organization"),
("3", "manage_organization_member"),
("4", "manage_team_admin"),
("5", "delete_team"),
("6", "manage_team_member"),
("7", "manage_board_member"),
("8", "delete_board");

INSERT INTO `role_permission`(`role_id`, `permission_id`)
VALUES("0", "0"),
("1", "1"),
("1", "2"),
("1", "3"),
("1", "4"),
("1", "5"),
("1", "6"),
("1", "7"),
("1", "8"),
("2", "3"),
("2", "4"),
("2", "5"),
("2", "6"),
("2", "7"),
("4", "4"),
("4", "5"),
("4", "6"),
("5", "6"),
("7", "7"),
("7", "8");