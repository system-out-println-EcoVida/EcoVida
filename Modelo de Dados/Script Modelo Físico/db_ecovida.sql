CREATE DATABASE IF NOT EXISTS db_ecovida
CHARSET utf8mb4 COLLATE utf8mb4_general_ci;

USE db_ecovida;

CREATE TABLE IF NOT EXISTS tb_usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    dt_nascimento DATE NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    nome_usuario VARCHAR(50) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL
    );

-- Trigger para validar data de nascimento.
DELIMITER //
CREATE TRIGGER validar_dt_nascimento
BEFORE INSERT ON tb_usuario
FOR EACH ROW
BEGIN
    IF NEW.dt_nascimento >= CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data de Nascimento não pode ser futura';
    END IF;
END //
DELIMITER ;


