-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema teste_eng_soft
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema teste_eng_soft
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `teste_eng_soft` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `teste_eng_soft` ;

-- -----------------------------------------------------
-- Table `teste_eng_soft`.`campanha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`campanha` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dt_inicio` DATE NOT NULL,
  `dt_fim` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NOT NULL,
  `cnpj` CHAR(18) NOT NULL,
  `endereco` VARCHAR(255) NULL DEFAULT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  `pessoa_contato` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`embalagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`embalagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tamanho` INT NOT NULL,
  `material` VARCHAR(255) NOT NULL,
  `custo` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`regiao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`regiao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`equipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `idregiao` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idregiao` (`idregiao` ASC) VISIBLE,
  CONSTRAINT `equipe_ibfk_1`
    FOREIGN KEY (`idregiao`)
    REFERENCES `teste_eng_soft`.`regiao` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`fabrica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`fabrica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `cnpj` CHAR(14) NOT NULL,
  `area_construcao` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`gerente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`gerente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dt_admissao` DATE NOT NULL,
  `nr_carteira_trabalho` VARCHAR(255) NOT NULL,
  `cpf` CHAR(14) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`historico_gerencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`historico_gerencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idgerente` INT NULL DEFAULT NULL,
  `idequipe` INT NULL DEFAULT NULL,
  `data_inicio` DATE NOT NULL,
  `data_fim` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idgerente` (`idgerente` ASC) VISIBLE,
  INDEX `idequipe` (`idequipe` ASC) VISIBLE,
  CONSTRAINT `historico_gerencia_ibfk_1`
    FOREIGN KEY (`idgerente`)
    REFERENCES `teste_eng_soft`.`gerente` (`id`),
  CONSTRAINT `historico_gerencia_ibfk_2`
    FOREIGN KEY (`idequipe`)
    REFERENCES `teste_eng_soft`.`equipe` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`vendedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `dt_admissao` DATE NOT NULL,
  `nr_carteira_trabalho` VARCHAR(255) NULL DEFAULT NULL,
  `cpf` CHAR(14) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nr_carteira_trabalho` (`nr_carteira_trabalho` ASC, `cpf` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`historico_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`historico_vendedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idequipe` INT NULL DEFAULT NULL,
  `idvendedor` INT NULL DEFAULT NULL,
  `data_inicio` INT NOT NULL,
  `data_fim` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idequipe` (`idequipe` ASC) VISIBLE,
  INDEX `idvendedor` (`idvendedor` ASC) VISIBLE,
  CONSTRAINT `historico_vendedor_ibfk_1`
    FOREIGN KEY (`idequipe`)
    REFERENCES `teste_eng_soft`.`equipe` (`id`),
  CONSTRAINT `historico_vendedor_ibfk_2`
    FOREIGN KEY (`idvendedor`)
    REFERENCES `teste_eng_soft`.`vendedor` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `quantidade` INT NOT NULL,
  `comissao` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`produto_campanha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`produto_campanha` (
  `idproduto` INT NULL DEFAULT NULL,
  `idcampanha` INT NULL DEFAULT NULL,
  `preco_campanha` DECIMAL(8,2) NOT NULL,
  `garoto_propaganda` VARCHAR(255) NOT NULL,
  INDEX `idproduto` (`idproduto` ASC) VISIBLE,
  INDEX `idcampanha` (`idcampanha` ASC) VISIBLE,
  CONSTRAINT `produto_campanha_ibfk_1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `teste_eng_soft`.`produto` (`id`),
  CONSTRAINT `produto_campanha_ibfk_2`
    FOREIGN KEY (`idcampanha`)
    REFERENCES `teste_eng_soft`.`campanha` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`produto_embalagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`produto_embalagem` (
  `idproduto` INT NULL DEFAULT NULL,
  `idembalagem` INT NULL DEFAULT NULL,
  INDEX `idproduto` (`idproduto` ASC) VISIBLE,
  INDEX `idembalagem` (`idembalagem` ASC) VISIBLE,
  CONSTRAINT `produto_embalagem_ibfk_1`
    FOREIGN KEY (`idproduto`)
    REFERENCES `teste_eng_soft`.`produto` (`id`),
  CONSTRAINT `produto_embalagem_ibfk_2`
    FOREIGN KEY (`idembalagem`)
    REFERENCES `teste_eng_soft`.`embalagem` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`produto_fabrica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`produto_fabrica` (
  `idfabrica` INT NULL DEFAULT NULL,
  `idproduto` INT NULL DEFAULT NULL,
  INDEX `idfabrica` (`idfabrica` ASC) VISIBLE,
  INDEX `idproduto` (`idproduto` ASC) VISIBLE,
  CONSTRAINT `produto_fabrica_ibfk_1`
    FOREIGN KEY (`idfabrica`)
    REFERENCES `teste_eng_soft`.`fabrica` (`id`),
  CONSTRAINT `produto_fabrica_ibfk_2`
    FOREIGN KEY (`idproduto`)
    REFERENCES `teste_eng_soft`.`produto` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`venda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idvendedor` INT NULL DEFAULT NULL,
  `idcliente` INT NULL DEFAULT NULL,
  `nr_pedido` INT NOT NULL,
  `dt_emissao` DATE NOT NULL,
  `valor_total` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nr_pedido` (`nr_pedido` ASC) VISIBLE,
  INDEX `idvendedor` (`idvendedor` ASC) VISIBLE,
  INDEX `idcliente` (`idcliente` ASC) VISIBLE,
  CONSTRAINT `venda_ibfk_1`
    FOREIGN KEY (`idvendedor`)
    REFERENCES `teste_eng_soft`.`vendedor` (`id`),
  CONSTRAINT `venda_ibfk_2`
    FOREIGN KEY (`idcliente`)
    REFERENCES `teste_eng_soft`.`cliente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teste_eng_soft`.`produto_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teste_eng_soft`.`produto_venda` (
  `idvenda` INT NULL DEFAULT NULL,
  `idproduto` INT NULL DEFAULT NULL,
  `quantidade` INT NOT NULL,
  INDEX `idvenda` (`idvenda` ASC) VISIBLE,
  INDEX `idproduto` (`idproduto` ASC) VISIBLE,
  CONSTRAINT `produto_venda_ibfk_1`
    FOREIGN KEY (`idvenda`)
    REFERENCES `teste_eng_soft`.`venda` (`id`),
  CONSTRAINT `produto_venda_ibfk_2`
    FOREIGN KEY (`idproduto`)
    REFERENCES `teste_eng_soft`.`produto` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
