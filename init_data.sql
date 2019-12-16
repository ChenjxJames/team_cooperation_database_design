USE team_cooperation;

INSERT INTO `role`(`role_id`, `role_name`) 
VALUES ("0", "site_admin"),
("1", "organization_creater"),
("2", "kanban_creater"),
("3", "kanban_admin"),
("4", "kanban_member");

INSERT INTO `permission`(`permission_id`, `slug`)
VALUES("0", "manage site")
("1", "manage team admin")
("2", "manage team member")
("3", "delete team")
("4", "create team kanban");