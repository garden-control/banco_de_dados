CREATE DATABASE clima_care;
use clima_care;

CREATE TABLE usuario (
    id int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    senha varchar(30) NOT NULL
);

CREATE TABLE estacao (
    id char(8) PRIMARY KEY,
    localizacao varchar(30)
);

CREATE TABLE estacao_usuario (
    id_usuario INT REFERENCES usuario(id),
    id_estacao char(8) REFERENCES estacao(id),
    PRIMARY KEY (id_usuario, id_estacao),

    nome varchar(30)
);

CREATE TABLE cli_entrada (
    id int AUTO_INCREMENT,
    id_estacao char(8) REFERENCES estacao(id),
    id_usuario int REFERENCES usuario(id),
    PRIMARY KEY (id, id_estacao, id_usuario),

    msg varchar(1024)
);

CREATE TABLE cli_saida (
    id int AUTO_INCREMENT,
    id_estacao char(8) REFERENCES estacao(id),
    id_usuario int REFERENCES usuario(id),
    PRIMARY KEY (id, id_estacao, id_usuario),
    
    msg varchar(1024)
);

CREATE TABLE leitura (
    id int AUTO_INCREMENT,
    id_estacao char(8) REFERENCES estacao(id),
    PRIMARY KEY (id, id_estacao),
    
    umidade_ar float,
    temperatura float,
    umidade_solo float,
    pluv_indice float,
    
    horario DATETIME
);

CREATE TABLE controlador (
    id int AUTO_INCREMENT,
    id_estacao char(8) REFERENCES estacao(id),
    PRIMARY KEY (id, id_estacao),

    bomba TINYINT,
    reserv TINYINT,

    horario DATETIME
);