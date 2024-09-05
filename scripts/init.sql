-- Criar banco de dados troquei
CREATE DATABASE IF NOT EXISTS troquei;

-- Usar o banco de dados troquei
USE troquei;

-- Criar tabela user
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criar tabela CadastroVeiculo
CREATE TABLE IF NOT EXISTS CadastroVeiculo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    license_plate VARCHAR(255),
    fabricated_year VARCHAR(4),
    model VARCHAR(255),
    brand VARCHAR(255),
    color VARCHAR(255),
    category_id VARCHAR(255) DEFAULT '1',
    version VARCHAR(255),
    is_active VARCHAR(1) DEFAULT '1',
    car_accident VARCHAR(1) DEFAULT '0',
    auction VARCHAR(1) DEFAULT '1',
    damage VARCHAR(1) DEFAULT '0',
    mileage VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Criar tabela VeiculoFotos
CREATE TABLE IF NOT EXISTS VeiculoFotos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT,
    photo_link VARCHAR(255),
    FOREIGN KEY (veiculo_id) REFERENCES CadastroVeiculo(id)
);

-- Inserir um usuário na tabela user
INSERT INTO user (name, email) VALUES ('Nome do Usuário', 'email@exemplo.com');