USE catland_development;

CREATE TABLE users (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL,
  pass VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)ENGINE = INNODB,CHARACTER SET utf8mb4,COLLATE utf8mb4_unicode_ci;
ALTER TABLE users ADD UNIQUE INDEX name(name);

CREATE TABLE user_contacts (
  user_id INT(11) UNSIGNED NOT NULL,
  fname VARCHAR(32) NOT NULL,
  lname VARCHAR(32) NOT NULL,
  email VARCHAR(32) NOT NULL,
  phone VARCHAR(32) NOT NULL,
  PRIMARY KEY (user_id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = INNODB,CHARACTER SET utf8mb4,COLLATE utf8mb4_unicode_ci;

CREATE TABLE rezervuotis (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  user_id INT(11) UNSIGNED NOT NULL,
  name VARCHAR(32) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  sterilization TINYINT NOT NULL,
  room INT(11) NOT NULL,
  nuo DATETIME NOT NULL,
  iki DATETIME NOT NULL,
  ivykdyta INT(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE = INNODB,CHARACTER SET utf8mb4,COLLATE utf8mb4_unicode_ci;

INSERT INTO users (id,name,pass) VALUES 
(1,'User','7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

INSERT INTO user_contacts (user_id,fname,lname,email,phone) VALUES 
(1,'Anželika','Takun','at.admin@gmail.com','865551111');
