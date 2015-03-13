set names utf8;
CREATE TABLE areas
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  area_code VARCHAR(255) unique NOT NULL,
  area_name VARCHAR(255) CHARACTER SET utf8 NOT NULL,
  area_parking_capacity TINYINT DEFAULT 0 NOT NULL,
  area_description VARCHAR(255) CHARACTER SET utf8,
  area_manager_id INT DEFAULT 0 NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX idx_area_code(area_code),
  INDEX idx_area_name(area_name)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE users
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_code VARCHAR(255) unique NOT NULL,
  user_name VARCHAR(255) CHARACTER SET utf8 NOT NULL,
  user_password VARCHAR(255),
  user_sex enum ('male','female') not null default 'male',
  user_description VARCHAR(255) CHARACTER SET utf8 ,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX idx_user_code (user_code),
  INDEX idx_user_name (user_name)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE user_role
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT UNSIGNED NOT NULL,
  role_id smallint UNSIGNED NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE roles
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(255) CHARACTER SET utf8 NOT NULL ,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY role_name(role_name)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE fees
(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  area_id INT UNSIGNED NOT NULL,
  user_code VARCHAR(255) NOT NULL,
  fee_num FLOAT NOT NULL default 0.00,
  fee_date TIMESTAMP DEFAULT '0000-00-00 00:00:00' NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;