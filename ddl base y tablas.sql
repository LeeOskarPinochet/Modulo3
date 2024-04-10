-- para la base de datos
CREATE DATABASE `alke_wallet` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;


-- tabla de usuario
CREATE TABLE `alke_wallet`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `correo` VARCHAR(100) NULL,
  `contrasena` VARCHAR(100) NULL,
  `saldo` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`usuario_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;

-- tabla de moneda

CREATE TABLE `alke_wallet`.`monedas` (
  `moneda_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_moneda` VARCHAR(45) NULL,
  `simbolo_moneda` VARCHAR(45) NULL,
  PRIMARY KEY (`moneda_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;


-- tabla de transaccion se agrega FK moneda para la integridad
CREATE TABLE `alke_wallet`.`transacciones` (
  `transaccion_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_enviador_id` INT NULL,
  `usuario_receptor_id` INT NULL,
  `importe` INT NULL,
  `fecha_transaccion` DATE NULL,
  `moneda_id` INT NULL,
  PRIMARY KEY (`transaccion_id`),
  INDEX `idx_usuario_enviador` (`usuario_enviador_id` ASC) INVISIBLE,
  INDEX `idx_usuario_receptor` (`usuario_receptor_id` ASC) VISIBLE,
  INDEX `fk_usuario_moneda_idx` (`moneda_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_receptor`
    FOREIGN KEY (`usuario_receptor_id`)
    REFERENCES `alke_wallet`.`usuario` (`usuario_id`),  
  CONSTRAINT `fk_usuario_enviador`
    FOREIGN KEY (`usuario_enviador_id`)
    REFERENCES `alke_wallet`.`usuario` (`usuario_id`),
  CONSTRAINT `fk_moneda`
    FOREIGN KEY (`moneda_id`)
    REFERENCES `alke_wallet`.`monedas` (`moneda_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;
