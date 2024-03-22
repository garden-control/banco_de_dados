CREATE DATABASE clima_care;
use clima_care;

CREATE TABLE usuario (
    id int PRIMARY KEY,
    nome varchar(30) NOT NULL,
    senha varchar(30) NOT NULL
);

CREATE TABLE estacao (
    id int PRIMARY KEY,
    localizacao varchar(30)
);

CREATE TABLE leitura (
    id int AUTO_INCREMENT,
    id_estacao int REFERENCES estacao(id),
    PRIMARY KEY (id, id_estacao),
    
    umidade_ar float,
    temperatura float,
    umidade_solo float,
    pluv_indice float,
    
    horario DATETIME
);

CREATE TABLE controlador (
    id int AUTO_INCREMENT,
    id_estacao int REFERENCES estacao(id),
    PRIMARY KEY (id, id_estacao),

    bomba TINYINT,
    reserv TINYINT,

    horario DATETIME
);