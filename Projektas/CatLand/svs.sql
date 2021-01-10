USE svs_development;

DROP TABLE IF EXISTS darbas;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(20) NOT NULL,
  fullname VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (id)
)ENGINE = INNODB, CHARACTER SET utf8, COLLATE utf8_general_ci;

CREATE TABLE darbas (
  id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) NOT NULL,
  priv VARCHAR(1) NOT NULL,
  tipas INT(11) NOT NULL,
  kaina FLOAT NOT NULL,
  aprasas TEXT DEFAULT NULL,
  faktura TINYINT NOT NULL,
  data DATETIME DEFAULT NOW(), 
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users (id)
)ENGINE = INNODB, CHARACTER SET utf8, COLLATE utf8_general_ci;

INSERT INTO users (name,fullname) VALUES ('Yuri','Jurij Takun'),('Tomas',NULL);

INSERT INTO darbas (user_id,priv,tipas,kaina,aprasas,faktura) VALUES 
  (1,'B',1,20,'Some Text',0),
  (2,'C',3,5,'Dulkiu valymas',0),
  (1,'B',5,100,'Energetikos ir aplinkosaugos sektorinio profesinio komiteto sprendimas aprobuoti ventiliacijos, oro kondicionavimo sistemu gamintoj o ir montuotojo moduline profesinio mokymo programa.',1);



#SELECT (SELECT COALESCE(fullname,name) FROM users WHERE id = user_id) AS name,
#priv,tipas,kaina,aprasas,faktura,
#DATE_FORMAT(data,'%Y/%m/%d'),DATE_FORMAT(data,'%H:%i:%s')
#FROM darbas LIMIT 0,100;

