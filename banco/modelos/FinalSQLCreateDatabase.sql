create database bancoPI_schema;
use bancoPI_schema;
CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Profissao` (
  `id_profissao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_profissao`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Pais` (
  `id_pais` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `populacao` INT NOT NULL,
  PRIMARY KEY (`id_pais`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Jornada` (
  `id_jornada` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `periodo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_jornada`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Tipo_Contrato` (
  `id_tipo_contrato` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_contrato`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Empresa` (
  `id_empresa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Estado` (
  `id_estado` INT NOT NULL,
  `populacao` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `id_pais` INT NOT NULL,
  PRIMARY KEY (`id_estado`),
  INDEX `id_pais_idx` (`id_pais` ASC),
  CONSTRAINT `id_pais`
    FOREIGN KEY (`id_pais`)
    REFERENCES `bancoPI_schema`.`Pais` (`id_pais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Cidade` (
  `id_cidade` INT NOT NULL AUTO_INCREMENT,
  `id_estado` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `populacao` INT NULL,
  PRIMARY KEY (`id_cidade`),
  INDEX `id_estado_idx` (`id_estado` ASC),
  CONSTRAINT `id_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `bancoPI_schema`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Grau_Escolaridade` (
  `id_grau_escolaridade` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_grau_escolaridade`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`Vaga` (
  `id_vaga` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_contrato` INT NOT NULL,
  `id_grau_escolaridade` INT NOT NULL,
  `id_jornada` INT NOT NULL,
  `id_empresa` INT NOT NULL,
  `id_profissao` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `salario` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_vaga`),
  INDEX `id_tipo_contrato_idx` (`id_tipo_contrato` ASC),
  INDEX `id_tipo_jornada_idx` (`id_jornada` ASC),
  INDEX `id_grau_escolaridade_idx` (`id_grau_escolaridade` ASC),
  INDEX `id_empresa_idx` (`id_empresa` ASC),
  INDEX `id_empresa_idx1` (`id_profissao` ASC),
  CONSTRAINT `id_tipo_contrato`
    FOREIGN KEY (`id_tipo_contrato`)
    REFERENCES `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_grau_escolaridade`
    FOREIGN KEY (`id_grau_escolaridade`)
    REFERENCES `bancoPI_schema`.`Grau_Escolaridade` (`id_grau_escolaridade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_tipo_jornada`
    FOREIGN KEY (`id_jornada`)
    REFERENCES `bancoPI_schema`.`Jornada` (`id_jornada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `bancoPI_schema`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_profissao`
    FOREIGN KEY (`id_profissao`)
    REFERENCES `bancoPI_schema`.`Profissao` (`id_profissao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`vaga_cidade` (
  `id_vaga_cidade` INT NOT NULL AUTO_INCREMENT,
  `id_vaga` INT NOT NULL,
  `id_cidade` INT NOT NULL,
  PRIMARY KEY (`id_vaga_cidade`),
  INDEX `id_vaga_idx` (`id_vaga` ASC),
  INDEX `id_cidade_idx` (`id_cidade` ASC),
  CONSTRAINT `id_vaga`
    FOREIGN KEY (`id_vaga`)
    REFERENCES `bancoPI_schema`.`Vaga` (`id_vaga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_cidade`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `bancoPI_schema`.`Cidade` (`id_cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `bancoPI_schema`.`cidade_empresa` (
  `id_cidade_empresa` INT NOT NULL AUTO_INCREMENT,
  `id_cidade` INT NOT NULL,
  `id_empresa` INT NOT NULL,
  PRIMARY KEY (`id_cidade_empresa`),
  INDEX `id_empresa_idx` (`id_empresa` ASC),
  INDEX `id_cidade_idx` (`id_cidade` ASC),
  CONSTRAINT `fid_cidade`
    FOREIGN KEY (`id_cidade`)
    REFERENCES `bancoPI_schema`.`Cidade` (`id_cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fid_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `bancoPI_schema`.`Empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB



