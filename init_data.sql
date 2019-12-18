USE team_cooperation;

INSERT INTO `role`(`role_id`, `role_name`) 
VALUES ("0", "site_admin"),
("1", "organization_super_admin"),
("2", "organization_admin"),
("3", "organization_member"),
("4", "team_super_admin"),
("5", "team_admin"),
("6", "team_member"),
("7", "board_super_admin"),
("8", "board_admin"),
("9", "board_member");

INSERT INTO `permission`(`permission_id`, `slug`)
VALUES("0", "manage_site"),
("1", "manage_organization_admin"),
("1", "delete_organization"),
("2", "manage_organization_member"),
("1", "manage_team_admin"),
("2", "manage_team_member"),
("3", "delete_team"),
("4", "create_team_board");

