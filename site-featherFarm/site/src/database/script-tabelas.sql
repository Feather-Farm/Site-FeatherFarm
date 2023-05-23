CREATE DATABASE featherFarm;
USE featherFarm;

CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY auto_increment,
    razaoSocial VARCHAR(100) NOT NULL,
	nomeFantasia VARCHAR(100) NOT NULL,
    cnpj CHAR(18) NOT NULL,
    cep CHAR(9) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero CHAR(14) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    data_cadastro DATETIME DEFAULT NOW()
);

CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY auto_increment,
    nome VARCHAR(50),
	sobrenome VARCHAR(60),
	email VARCHAR(100),
	email2 VARCHAR(100),
    telefone VARCHAR(15),
    telefone2 VARCHAR(15),
    senha VARCHAR(30),
    tipo VARCHAR(11),
    CONSTRAINT chkTipo CHECK (tipo IN('admin', 'funcionário'))
);

CREATE TABLE galpao(
	idGalpao INT PRIMARY KEY auto_increment,
    localizacaoGalp VARCHAR(100),
    area DOUBLE(10,2),
    qtdSensores INT,
    fkEmpresa INT, FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE sensor (
  idSensor INT PRIMARY KEY auto_increment,
  modelo VARCHAR(50),
  fabricante VARCHAR(50),
  data_instalacao DATE,
  localizacao VARCHAR(100),
  estado VARCHAR(10), CONSTRAINT chkEstado CHECK (estado in('off', 'ligado', 'manutenção')),
  fkGalpao INT, FOREIGN KEY (fkGalpao) REFERENCES galpao(idGalpao)
);

create table medida(
	idMedida INT PRIMARY KEY auto_increment,
    temperatura FLOAT,
    umidade FLOAT,
    data_hora DATETIME,
    fksensor INT,
    FOREIGN KEY (fksensor) REFERENCES sensor (idSensor)
);
































-- CREATE DATABASE featherFarm;
-- USE featherFarm;

-- CREATE TABLE empresa(
-- 	idEmpresa INT PRIMARY KEY auto_increment,
--     razaoSocial VARCHAR(100) NOT NULL,
-- 	nomeFantasia VARCHAR(100) NOT NULL,
--     cnpj CHAR(14) NOT NULL,
--     cep CHAR(8) NOT NULL,
--     logradouro VARCHAR(100) NOT NULL,
--     numero VARCHAR(5) NOT NULL,
--     bairro VARCHAR(50) NOT NULL,
--     uf CHAR(2) NOT NULL,
--     cidade VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE usuario(
-- 	idUsuario INT PRIMARY KEY auto_increment,
-- 	nome VARCHAR(50) NOT NULL,
-- 	sobrenome VARCHAR(50) NOT NULL
--     email VARCHAR(100) NOT NULL,
--     email2 VARCHAR(100),
--     telefone1 VARCHAR(15) NOT NULL,
--     telefone2 VARCHAR(15)
--     senha VARCHAR(10),
--     fkEmp INT, FOREIGN KEY (fkEmp) REFERENCES empresa(idEmpresa)
-- );

-- CREATE TABLE galpao(
-- 	idGalpao INT PRIMARY KEY auto_increment,
--     localizacaoGalp VARCHAR(100),
--     area DOUBLE(10,2),
--     qtdSensores INT,
--     fkEmpresa INT, FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
-- );

-- CREATE TABLE sensor (
--   id_sensor INT PRIMARY KEY auto_increment,
--   modelo VARCHAR(50),
--   fabricante VARCHAR(50),
--   data_instalacao DATE,
--   localizacao VARCHAR(100),
--   estado VARCHAR(10), CONSTRAINT chkEstado CHECK (estado in('off', 'ligado', 'manutenção')),
--   fkGalpao INT, FOREIGN KEY (fkGalpao) REFERENCES galpao(idGalpao)
-- );

-- CREATE TABLE dados_sensor (
--   data_hora DATETIME PRIMARY KEY,
--   temperatura DECIMAL(4,2),
--   umidade DECIMAL(4,2), 
--   fkSensor INT,FOREIGN KEY (fkSensor) REFERENCES sensor(id_sensor)
-- );

-- SHOW TABLES;
-- INSERT INTO empresa VALUES(null, 'Sadia LTDA', ' 7665419400016', '08567200', 'Rua imperatriz leopoldina', '1490', 'Poá', 'São paulo',
-- 'SP', 'empresa@saida.com', 'financeiro@sadia.com', '11994432998', null, 'sadia.com.br');
-- INSERT INTO empresa VALUES(null, 'Seara LTDA', '9867512300018', '01310904', 'Avenida Paulista', '460', 'Bela vista', 'São paulo',
-- 'SP', 'empresa@seara.com', 'financeiro@seara.com', '11995590112', '28197612', 'seara.com.br');

-- INSERT INTO login VALUES('admSadia', 'empresa@sadia.com', '123@sadia', 1), 
-- ('sadia2', 'empresa@sadia.com', 'sadia@321', 1);
-- INSERT INTO login VALUES('seara', 'empresa@seara.com', 'seara@123', 2),
-- ('admSeara', 'financeiro@seara.com', '12seara@', 2);

-- INSERT INTO galpao VALUES(null, 'Avenida afonso leopoldo 1088 - 0775000 - Vila união - CAJAMAR - SP', 100.0, 10, 1),
-- (null, 'Avenida antonio candido machado 97 - 1775000 - Jardim Penteado - CAJAMAR - SP', 120.0, 12, 1);
-- INSERT INTO galpao VALUES(null, 'Rua doutor eloy chaves 178 - 13218040 - São Joao - Judiai - SP', 200.0, 20, 2),
-- (null, 'Rua doutor eloy chaves 178 - 13218040 - São Joao - Judiai - SP', 210.0, 21, 2);

-- INSERT INTO sensor VALUES(null, 'DHT11', 'robocore', '2023-04-28', 10.0, 'ligado', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 20.0, 'ligado', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 30.0, 'ligado', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 40.0, 'off', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 50.0, 'ligado', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 60.0, 'ligado', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 70.0, 'ligado', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 80.0, 'ligado', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 90.0, 'ligado', 1),
-- (null, 'DHT11', 'robocore', '2023-04-28', 100.0, 'ligado', 1);


-- INSERT INTO sensor VALUES(null, 'DHT11', 'robocore', '2023-04-30', 10.0, 'ligado', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 20.0, 'ligado', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 30.0, 'ligado', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 40.0, 'off', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 50.0, 'ligado', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 60.0, 'ligado', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 70.0, 'ligado', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 80.0, 'manutenção', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 90.0, 'ligado', 2),
-- (null, 'DHT11', 'robocore', '2023-04-30', 100.0, 'ligado', 2);

-- INSERT INTO sensor VALUES(null, 'DHT11', 'eletrogate', '2023-04-30', 10.0, 'ligado', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 20.0, 'ligado', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 30.0, 'ligado', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 40.0, 'ligado', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 50.0, 'Manutenção', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 60.0, 'ligado', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 70.0, 'off', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 80.0, 'ligado', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 90.0, 'ligado', 4),
-- (null, 'DHT11', 'eletrogate', '2023-04-29', 100.0, 'ligado', 4);


-- INSERT INTO dados_sensor VALUES('2023-05-01 12:00', 22.1, 57.0, 1),
-- ('2023-05-01 12:10', 23.2, 63.0, 1), ('2023-05-01 12:20', 22.8, 61.0, 1),('2023-05-01 12:30', 21.1, 62.0, 1),
-- ('2023-05-01 12:40', 20.6, 57.0, 1), ('2023-05-01 12:50', 20.1, 61.0, 1), ('2023-05-01 13:00', 20.4, 63.0, 1);

-- INSERT INTO dados_sensor VALUES('2023-05-01 12:01', 20.1, 60.0, 2), ('2023-05-01 12:11', 20.9, 61.0, 2),
-- ('2023-05-01 12:21', 21.1, 63.0, 2), ('2023-05-01 12:31', 22.3, 61.0, 2), ('2023-05-01 12:41', 23.1, 67.0, 2),
-- ('2023-05-01 12:51', 22.8, 65.0, 2), ('2023-05-01 13:01', 22.3, 66.0, 2);

-- INSERT INTO dados_sensor VALUES('2023-05-01 14:01', 20.1, 63.0, 11), ('2023-05-01 14:11', 19.8, 61.0, 11),
-- ('2023-05-01 14:21', 19.5, 63.0, 11), ('2023-05-01 14:31', 19.9, 67.0, 11), ('2023-05-01 14:41', 20.6, 71.0, 11),
-- ('2023-05-01 14:51', 21.8, 72.0, 11), ('2023-05-01 15:01', 22.1, 73.0, 11);

-- INSERT INTO dados_sensor VALUES('2023-05-01 18:01', 20.1, 63.0, 26), ('2023-05-01 18:11', 19.8, 61.0, 26),
-- ('2023-05-01 18:21', 19.5, 63.0, 26), ('2023-05-01 18:31', 19.9, 67.0, 26), ('2023-05-01 18:41', 20.6, 71.0, 26),
-- ('2023-05-01 18:51', 21.8, 72.0, 26), ('2023-05-01 19:01', 22.1, 73.0, 26);

-- ALTER TABLE empresa RENAME COLUMN site to siteEmpresa;

-- SELECT * FROM empresa;
-- SELECT * FROM login;
-- SELECT * FROM galpao;
-- SELECT * FROM sensor;
-- SELECT * FROM dados_sensor;

-- SELECT nomeEmpresa, idGalpao, qtdSensores FROM empresa JOIN galpao ON fkEmpresa = idEmpresa
-- 	JOIN sensor ON fkGalpao = idGalpao;

-- SELECT SUM(qtdSensores) as 'Sensores instalados' FROM galpao;

-- -- Media da temperatura
-- SELECT SUM(temperatura) / count(temperatura) as 'Média' FROM dados_sensor WHERE fkSensor = 26;

-- SELECT nomeEmpresa, idGalpao, modelo ,data_hora, temperatura, umidade FROM empresa JOIN galpao ON fkEmpresa = idEMpresa
-- 	JOIN sensor ON fkGalpao = idGalpao JOIN dados_sensor ON fkSensor = id_sensor
--     WHERE temperatura < 20 or temperatura > 23 or umidade < 60 or umidade > 70; 

-- SELECT nomeEmpresa, idGalpao, modelo ,data_hora, temperatura, umidade FROM empresa JOIN galpao ON fkEmpresa = idEMpresa
-- 	JOIN sensor ON fkGalpao = idGalpao JOIN dados_sensor ON fkSensor = id_sensor
--     WHERE temperatura < 20 or temperatura > 23 or umidade < 60 or umidade > 70 and nomeEmpresa = 'Saida LTDA'; 
    
-- SELECT nomeEmpresa, idGalpao, localizacaoGalp as 'Endereço', localizacao, estado FROM empresa JOIN galpao ON fkEmpresa = idEmpresa
-- 	JOIN sensor ON fkGalpao = idGalpao WHERE estado != 'ligado';
    
-- SELECT nomeEmpresa, idGalpao, localizacaoGalp as 'Endereço', localizacao, estado FROM empresa JOIN galpao ON fkEmpresa = idEmpresa
-- 	JOIN sensor ON fkGalpao = idGalpao WHERE estado != 'ligado' and nomeEmpresa = 'Sadia LTDA';
    
-- SELECT nomeEmpresa, idGalpao, localizacaoGalp as 'Endereço', localizacao, estado FROM empresa JOIN galpao ON fkEmpresa = idEmpresa
-- 	JOIN sensor ON fkGalpao = idGalpao WHERE estado != 'ligado' and nomeEmpresa = 'Seara LTDA';