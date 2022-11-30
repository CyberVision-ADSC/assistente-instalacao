drop database cybervision;
create database cybervision;
use cybervision;
CREATE TABLE computador (
  id_computador INT PRIMARY KEY AUTO_INCREMENT,
  identificador_computador VARCHAR(100),
  hostname VARCHAR(100) UNIQUE,
  processador VARCHAR(100),
  arquitetura INT,
  fabricante VARCHAR(100),
  ram LONG,
  disco LONG,
  problema_cpu BOOLEAN,
  problema_disco BOOLEAN,
  problema_memoria BOOLEAN,
  problema_fisico BOOLEAN,
  sistema_operacional VARCHAR(100),
  is_ativo BOOLEAN
);

CREATE TABLE relatorio (
  id_relatorio INT PRIMARY KEY AUTO_INCREMENT,
  uso_cpu DOUBLE,
  uso_disco LONG,
  uso_ram LONG,
  data_hora DATETIME,
  fk_computador INT,
  FOREIGN KEY (fk_computador)
  REFERENCES computador (id_computador)
);

CREATE TABLE processo (
id_processo INT PRIMARY KEY AUTO_INCREMENT,
pid INT,
nome VARCHAR(100),
uso_cpu DOUBLE,
uso_memoria DOUBLE,
data_hora_atualizado DATETIME,
fk_computador INT,
FOREIGN KEY (fk_computador)
REFERENCES computador (id_computador)
);

CREATE TABLE processo_matar (
id_requisicao INT PRIMARY KEY AUTO_INCREMENT,
pid_processo INT,
is_executado BOOLEAN,
data_hora_executado DATETIME,
fk_computador INT,
FOREIGN KEY (fk_computador)
REFERENCES computador (id_computador)
);

CREATE TABLE chamados (
id_chamado INT PRIMARY KEY AUTO_INCREMENT,
ra_aluno VARCHAR(50),
hostname VARCHAR(100),
descricao_ocorrido VARCHAR(500),
status_chamado CHAR(10), CHECK (status_chamado = 'Pendente' or status_chamado = 'Finalizado'),
data_hora_criacao DATETIME,
data_hora_conclusao DATETIME,
fk_computador INT,
FOREIGN KEY (fk_computador)
REFERENCES computador (id_computador)
);

CREATE TABLE notificar_aluno (
id_notificacao INT PRIMARY KEY AUTO_INCREMENT,
is_executado BOOLEAN,
data_hora_executado DATETIME,
fk_computador INT,
FOREIGN KEY (fk_computador)
REFERENCES computador (id_computador)
);