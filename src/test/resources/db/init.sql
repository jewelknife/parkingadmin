insert into areas(area_code, area_name, area_parking_capacity, area_manager_id) values
  ('A01', 'A01', 40, 2), ('A02', 'A02', 30, 3), ('A03', 'A03', 40, 3);

insert into fees(area_id, user_code, fee_num, fee_date) values
  (1, 'C9001', 25, now() - interval 465 hour);

insert into users(user_code, user_name, user_password) values
  ('C9001', 'PA001', md5('123'));