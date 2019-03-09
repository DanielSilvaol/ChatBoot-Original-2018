drop  database if  exists chat;
CREATE SCHEMA IF NOT EXISTS chat  ;
USE chat ;

-- -----------------------------------------------------
-- Table `chat`.`atendente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atendente (
  idAtendente INT(11) NOT NULL AUTO_INCREMENT,
  Nome_Atendente VARCHAR(50) NULL DEFAULT NULL,
  Email_Atendente VARCHAR(45) NOT NULL,
  CPF_Atendente CHAR(11) NOT NULL,
  RG_Atendente CHAR(11) NOT NULL,
  Telefone_Atendente VARCHAR(45) NOT NULL,
  Status_Atendente VARCHAR(45) NOT NULL,
  Senha_Atendente VARCHAR(45) NOT NULL,
  PRIMARY KEY (idAtendente))
;


-- -----------------------------------------------------
-- Table `chat`.`atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atendimento (
  ID_Atendimento INT(11) NOT NULL AUTO_INCREMENT,
  Status_Atendimento VARCHAR(100) NOT NULL,
  ID_Cliente INT(11) NOT NULL,
  ID_Atendente INT(11) NOT NULL,
  dt_inicio TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  dt_fim TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID_Atendimento),
  INDEX fk_Atendimento_Cliente_idx (ID_Cliente ASC),
  INDEX fk_Atendimento_Atendente1_idx (ID_Atendente ASC));


-- -----------------------------------------------------
-- Table `chat`.`atendimento_conversa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS atendimento_conversa (
  idatendimento_ac INT(11) NOT NULL,
  IDconversa_ac INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (idatendimento_ac, IDconversa_ac),
  INDEX fk_atendimento_conversa_conversa1 (IDconversa_ac ASC));


-- -----------------------------------------------------
-- Table `chat`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cliente (
  ID_Cliente INT(11) NOT NULL AUTO_INCREMENT,
  Nome_Cliente VARCHAR(100) NULL DEFAULT NULL,
  Email_Cliente VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (ID_Cliente))
;


-- -----------------------------------------------------
-- Table `chat`.`conversa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS conversa (
  ID_conversa INT(11) NOT NULL AUTO_INCREMENT,
  Pergunta VARCHAR(1000) NOT NULL,
  respostas VARCHAR(1000) NOT NULL,
  PRIMARY KEY (ID_conversa))
;


-- -----------------------------------------------------
-- Table `chat`.`palavrachave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS palavrachave (
  ID_PalavraChave INT(11) NOT NULL AUTO_INCREMENT,
  PalavraChave VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID_PalavraChave))
;


-- -----------------------------------------------------
-- Table `chat`.`respostaatendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS respostaatendimento (
  ID_Respostas INT(11) NOT NULL AUTO_INCREMENT,
  id_atendimento INT(11) NOT NULL,
  INDEX ID_Respostas (ID_Respostas ASC),
  INDEX id_atendimento (id_atendimento ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `chat`.`respostapalavrachave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS respostapalavrachave (
  pontuacao_Resposta INT(11) NULL DEFAULT NULL,
  ID_Respostas INT(11) NOT NULL,
  ID_PalavraChave INT(11) NOT NULL,
  INDEX fk_RespostaPalavraChave_PalavraChave1_idx (ID_PalavraChave ASC),
  INDEX fk_RespostaPalavraChave_Respostas1 (ID_Respostas ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `chat`.`respostas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS respostas (
  ID_Respostas INT(11) NOT NULL AUTO_INCREMENT,
  Respostas VARCHAR(1000) NOT NULL,
  PRIMARY KEY (ID_Respostas));

 
-- -----------------------------------------------------
-- Table `chat`.`tentativas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tentativas (
  id_tentativa INT(11) NOT NULL AUTO_INCREMENT,
  primeira_tentativa INT(11) NULL DEFAULT NULL,
  segunda_tentativa INT(11) NULL DEFAULT NULL,
  terceira_tentativa INT(11) NULL DEFAULT NULL,
  atendimento_humano INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (id_tentativa));


-- -----------------------------------------------------
-- Table `chat`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  username VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  PRIMARY KEY (username))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

