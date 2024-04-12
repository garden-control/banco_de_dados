CREATE DATABASE clima_care;
use clima_care;

CREATE TABLE usuario (
    id int PRIMARY KEY AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    senha varchar(30) NOT NULL
);

CREATE TABLE estacao (
    id char(8) PRIMARY KEY,
    localizacao varchar(30),
    nome varchar(30)
);

CREATE TABLE estacao_usuario (
    id_usuario INT REFERENCES usuario(id),
    id_estacao char(8) REFERENCES estacao(id),
    PRIMARY KEY (id_usuario, id_estacao),

    /*
    00000000b => direito de leitura
    00000001b => direito de alterar nome e localização da estação
    00000010b => direito de alterar direitos
    00010000b => direito de enviar comandos (cli)
    */
    direitos BINARY(1) DEFAULT 0
);

CREATE TABLE cli_entrada (
    id int AUTO_INCREMENT,
    id_estacao char(8) REFERENCES estacao(id),
    id_usuario int REFERENCES usuario(id),
    PRIMARY KEY (id, id_estacao, id_usuario),

    msg varchar(1024)
);

CREATE TABLE cli_log (
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
    
    umidade_ar float NOT NULL,
    temperatura float NOT NULL,
    umidade_solo float NOT NULL,
    pluv_indice float NOT NULL,
    
    horario DATETIME NOT NULL
);

CREATE TABLE controlador (
    id int AUTO_INCREMENT,
    id_estacao char(8) REFERENCES estacao(id),
    PRIMARY KEY (id, id_estacao),

    bomba TINYINT,
    reserv TINYINT,

    horario DATETIME
);