set names utf8;
insert into roles(role_name) values('userManager'),( 'ereaManager'), ('user');
insert into users(user_code, user_name, user_password, user_description) values('C0001', 'admin', md5('123'), 'superadmin auto create');
insert into user_role(user_id, role_id) select a.id, b.id from users a, roles b where a.user_name = 'admin' and b.role_name in ('userManager', 'ereaManager');