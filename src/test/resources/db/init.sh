#!/bin/sh

for i in {1..100};do (mysql -uroot parkingadmin -e "insert into fees(area_id, user_code, fee_num, fee_date) values (round(rand() * 1000)%3 + 1, concat('C900', round(rand() * 1000)%4 + 1), rand() * 100, now() - interval round(rand() * 1000) hour);");done