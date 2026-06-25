CREATE DATABASE IF NOT EXISTS VendaIngressosDB;
USE VendaIngressosDB;
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    perfil ENUM('admin', 'financeiro', 'vendedor', 'cliente') NOT NULL
);

CREATE TABLE Eventos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento VARCHAR(150),
    artista VARCHAR(100),
    data_evento DATE,
    local VARCHAR(100)
);

CREATE TABLE Ingressos (
    id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT,
    tipo VARCHAR(50),
    preco DECIMAL(8,2),
    disponivel BOOLEAN,
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento)
);

CREATE TABLE Vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_ingresso INT,
    data_venda DATETIME,
    quantidade INT,
    total DECIMAL(10,2),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_ingresso) REFERENCES Ingressos(id_ingresso)
);
-- Usuários
INSERT INTO Usuarios (nome, email, perfil) VALUES
('Ana Silva', 'ana.silva@email.com', 'admin'),
('Carlos Souza', 'c.souza@email.com', 'vendedor'),
('Juliana Ramos', 'juliana.r@email.com', 'financeiro'),
('Diego Martins', 'diego@email.com', 'cliente'),
('Fernanda Torres', 'fernanda@email.com', 'cliente'),
('Lucas Prado', 'lucas@email.com', 'cliente'),
('Mariana Lopes', 'mariana@email.com', 'vendedor'),
('Bruno Rocha', 'bruno@email.com', 'cliente'),
('Paula Mendes', 'paula@email.com', 'financeiro'),
('Ricardo Lima', 'ricardo@email.com', 'cliente');

-- Eventos
INSERT INTO Eventos (nome_evento, artista, data_evento, local) VALUES
('Turnê The Eras Tour', 'Taylor Swift', '2025-08-15', 'Allianz Parque - SP'),
('World Tour 2025', 'Coldplay', '2025-09-20', 'Estádio do Morumbi'),
('Ao Vivo no Brasil', 'Ed Sheeran', '2025-10-10', 'Arena BRB Mané Garrincha'),
('Reunião de Banda', 'RBD', '2025-07-25', 'Mineirão - BH'),
('Festival Rock in Rio', 'Foo Fighters', '2025-09-01', 'Parque Olímpico - RJ'),
('Baile da Favorita', 'Ludmilla', '2025-06-22', 'Fundição Progresso'),
('Pagode Retrô', 'Sorriso Maroto', '2025-11-05', 'Espaço das Américas'),
('Clássicos Sertanejos', 'Jorge & Mateus', '2025-12-12', 'Villa Mix - GO'),
('Show do Século', 'Beyoncé', '2025-10-28', 'Estádio Beira-Rio - POA'),
('Carnaval Fora de Época', 'Ivete Sangalo', '2025-11-15', 'Avenida Paulista - SP');

-- Ingressos
INSERT INTO Ingressos (id_evento, tipo, preco, disponivel) VALUES
(1, 'Pista Premium', 850.00, TRUE),
(1, 'Cadeira Inferior', 500.00, TRUE),
(2, 'Pista', 650.00, TRUE),
(3, 'VIP', 1200.00, TRUE),
(4, 'Arquibancada', 300.00, TRUE),
(5, 'Pista Comum', 400.00, TRUE),
(6, 'Área Open Bar', 900.00, TRUE),
(7, 'Mesa para 4', 1600.00, TRUE),
(8, 'Pista', 450.00, TRUE),
(9, 'Camarote', 2000.00, TRUE);

-- Vendas
INSERT INTO Vendas (id_usuario, id_ingresso, data_venda, quantidade, total) VALUES
(4, 1, '2025-04-01 14:30:00', 2, 1700.00),
(5, 3, '2025-04-02 10:00:00', 1, 650.00),
(6, 6, '2025-04-03 16:45:00', 2, 800.00),
(8, 9, '2025-04-04 18:20:00', 1, 2000.00),
(10, 2, '2025-04-05 12:10:00', 1, 500.00),
(4, 5, '2025-04-06 11:00:00', 3, 1200.00),
(7, 7, '2025-04-06 13:15:00', 1, 1600.00),
(6, 8, '2025-04-07 15:00:00', 2, 900.00),
(9, 4, '2025-04-07 17:50:00', 1, 1200.00),
(5, 10, '2025-04-08 09:45:00', 2, 4000.00);
