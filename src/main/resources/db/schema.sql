set names utf8;
CREATE TABLE areas
(
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  area_code VARCHAR(255) NOT NULL,
  area_name VARCHAR(255) NOT NULL,
  area_parking_capacity TINYINT DEFAULT 0 NOT NULL,
  area_description VARCHAR(255),
  area_manager_id INT DEFAULT 0 NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) ;
CREATE INDEX idx_area_code ON areas (area_code);
CREATE INDEX idx_area_name ON areas (area_name);

CREATE TABLE users
(
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_code VARCHAR(255) NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  user_password VARCHAR(255),
  user_sex enum ('male','famale') not null default 'male',
  user_description VARCHAR(255),
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) ;
CREATE INDEX idx_user_code ON users (user_code);
CREATE INDEX idx_user_name ON users (user_name);

CREATE TABLE user_role
(
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  role_id smallint UNSIGNED NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) ;

CREATE TABLE roles
(
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(255) unique NOT NULL ,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) ;

CREATE TABLE fees
(
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  area_id INT UNSIGNED NOT NULL,
  user_code VARCHAR(255) NOT NULL,
  fee_num FLOAT NOT NULL default 0.00,
  fee_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
) ;
