create database concessionaria;
use concessionaria;

CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    data_nascimento DATE
);

CREATE TABLE vendedores (
    vendedor_id INT PRIMARY KEY,
    nome VARCHAR(100),
    departamento_id INT
);

CREATE TABLE hierarquia_departamentos (
    departamento_id INT PRIMARY KEY,
    nome VARCHAR(100),
    departamento_pai_id INT NULL
);

CREATE TABLE veiculos (
    veiculo_id INT PRIMARY KEY,
    modelo VARCHAR(100),
    marca VARCHAR(50),
    ano INT,
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE vendas (
    venda_id INT PRIMARY KEY,
    cliente_id INT,
    vendedor_id INT,
    veiculo_id INT,
    data_venda DATE,
    valor_total DECIMAL(10,2),
    FOREIGN KEY(cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY(vendedor_id) REFERENCES vendedores(vendedor_id),
    FOREIGN KEY(veiculo_id) REFERENCES veiculos(veiculo_id)
);

CREATE TABLE pagamentos (
    pagamento_id INT PRIMARY KEY,
    venda_id INT,
    forma_pagamento VARCHAR(50),
    parcelas INT,
    pago BOOLEAN,
    FOREIGN KEY(venda_id) REFERENCES vendas(venda_id)
);

CREATE TABLE avaliacoes (
    avaliacao_id INT PRIMARY KEY,
    cliente_id INT,
    venda_id INT,
    nota INT,
    comentario TEXT,
    FOREIGN KEY(cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY(venda_id) REFERENCES vendas(venda_id)
);

CREATE TABLE servicos (
    servico_id INT PRIMARY KEY,
    veiculo_id INT,
    tipo_servico VARCHAR(100),
    data_servico DATE,
    custo DECIMAL(10,2)
);

CREATE TABLE pecas (
    peca_id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

CREATE TABLE servicos_pecas (
    servico_id INT,
    peca_id INT,
    quantidade INT,
    PRIMARY KEY(servico_id, peca_id),
    FOREIGN KEY(servico_id) REFERENCES servicos(servico_id),
    FOREIGN KEY(peca_id) REFERENCES pecas(peca_id)
);
INSERT INTO clientes (cliente_id, nome, email, telefone, data_nascimento) VALUES 
(754, 'Ana Sophia Araújo', 'levicunha@ig.com.br', '+55 51 8196 0013', '1970-01-24'),
(214, 'Maria Araújo', 'cdas-neves@almeida.com', '(011) 5423-5116', '1960-10-24'),
(125, 'Dr. Otávio Ferreira', 'hteixeira@cardoso.org', '0900-593-1034', '1959-08-31'),
(859, 'Caio Nascimento', 'kmoreira@yahoo.com.br', '11 3419 2832', '1985-09-09'),
(381, 'Emanuelly das Neves', 'diasbernardo@yahoo.com.br', '71 4139 5376', '1997-12-24'),
(350, 'Bianca Ferreira', 'pietrateixeira@pereira.br', '21 3287 1012', '1996-12-06'),
(328, 'Rodrigo Pereira', 'mnascimento@souza.org', '81 0184-5146', '1964-12-30'),
(242, 'Agatha Ferreira', 'jesusluiza@da.com', '0300-570-1543', '1958-03-05'),
(854, 'Miguel Cardoso', 'wcampos@costela.com', '+55 71 8963-8346', '1999-12-10'),
(204, 'Isadora Pires', 'fariaslevi@gmail.com', '(081) 0983 9301', '2002-05-27');

INSERT INTO vendedores (vendedor_id, nome, departamento_id) VALUES 
(892, 'Ana Carolina Dias', 2),
(958, 'Arthur Melo', 5),
(758, 'Luiz Gustavo Duarte', 5),
(289, 'Raul Rodrigues', 1),
(804, 'Marcelo Costela', 5),
(632, 'Dra. Maria Julia Ribeiro', 2),
(232, 'Yuri Ribeiro', 5),
(230, 'Caroline Castro', 4),
(295, 'Rafael Pinto', 2),
(423, 'Dr. Juan Rezende', 4);

INSERT INTO hierarquia_departamentos (departamento_id, nome, departamento_pai_id) VALUES 
(1, 'Vendas', NULL),
(2, 'Financeiro', NULL),
(3, 'Serviços', NULL),
(4, 'Pós-Venda', 1),
(5, 'Cobrança', 2);

INSERT INTO veiculos (veiculo_id, modelo, marca, ano, preco, estoque) VALUES
 (903, 'Corolla', 'Fiat', 2017, 93462.22, 6),
 (584, 'Kicks', 'Jeep', 2016, 143513.79, 9),
 (306, 'Corolla', 'Fiat', 2017, 119525.49, 10),
 (463, 'Tracker', 'Hyundai', 2017, 51186.29, 4),
 (732, 'Compass', 'Toyota', 2019, 161975.3, 7),
 (648, 'Compass', 'Nissan', 2021, 66958.3, 6),
 (459, 'HB20', 'Jeep', 2017, 127232.69, 3),
 (520, 'Creta', 'Hyundai', 2018, 107405.13, 5),
 (644, 'Creta', 'Hyundai', 2021, 158785.01, 1),
 (404, 'HB20', 'Honda', 2021, 99157.25, 2);

INSERT INTO vendas (venda_id, cliente_id, vendedor_id, veiculo_id, data_venda, valor_total) VALUES 
(616, 859, 295, 644, '2025-01-25', 76274.16),
(980, 204, 232, 404, '2024-10-13', 89940.05),
(722, 859, 758, 644, '2023-05-08', 99351.58),
(617, 754, 958, 306, '2024-08-31', 112744.6),
(911, 328, 423, 584, '2024-08-15', 88476.73),
(805, 204, 230, 644, '2024-08-09', 75141.41),
(869, 854, 892, 584, '2023-06-11', 118171.04),
(546, 854, 804, 648, '2023-05-13', 61155.22),
(671, 328, 758, 520, '2024-02-02', 50324.53),
(542, 381, 295, 306, '2024-10-12', 100768.17);

INSERT INTO pagamentos (pagamento_id, venda_id, forma_pagamento, parcelas, pago) VALUES 
(554, 616, 'Financiamento', 3, '1'),
(945, 980, 'Financiamento', 12, '1'),
(820, 722, 'Cartão de Crédito', 6, '0'),
(652, 617, 'Boleto', 1, '1'),
(930, 911, 'Cartão de Crédito', 1, '0'),
(827, 805, 'Cartão de Crédito', 24, '1'),
(759, 869, 'Boleto', 36, '0'),
(811, 546, 'Boleto', 6, '0'),
(601, 671, 'Boleto', 24, '1'),
(578, 542, 'Financiamento', 12, '0');

INSERT INTO avaliacoes (avaliacao_id, cliente_id, venda_id, nota, comentario) VALUES 
(824, 859, 616, 5, 'Reiciendis autem deleniti modi consequuntur delectus iure soluta asperiores repellat.'),
(864, 204, 980, 2, 'Atque officiis molestiae accusamus at quidem dolores illo laboriosam sint temporibus cum a.'),
(831, 859, 722, 5, 'Eaque quos iste in vero voluptatum nam quaerat culpa error.'),
(661, 754, 617, 2, 'Neque molestiae quibusdam animi nesciunt magnam.'),
(726, 328, 911, 1, 'Culpa vero aspernatur delectus nisi perferendis doloremque blanditiis tempora doloribus nisi nulla.'),
(715, 204, 805, 1, 'Omnis natus et ea pariatur et eaque consectetur officia itaque ut.'),
(632, 854, 869, 1, 'Ab numquam natus aut modi magni.'),
(773, 854, 546, 2, 'Ut sunt sunt fuga culpa rerum provident.'),
(610, 328, 671, 1, 'Voluptates rem minus pariatur mollitia ut aut soluta eaque suscipit quia culpa eligendi.'),
(901, 381, 542, 1, 'Quaerat dignissimos odio eaque laborum temporibus sapiente at.');

INSERT INTO servicos (servico_id, veiculo_id, tipo_servico, data_servico, custo) VALUES 
(869, 404, 'Alinhamento', '2024-09-06', 599.54),
(736, 520, 'Alinhamento', '2025-02-11', 502.26),
(963, 584, 'Alinhamento', '2024-07-11', 805.45),
(821, 459, 'Alinhamento', '2024-04-12', 1748.1),
(842, 903, 'Revisão', '2024-03-27', 262.13),
(948, 648, 'Revisão', '2024-08-02', 610.01),
(809, 463, 'Substituição de pastilhas', '2025-01-19', 979.94),
(976, 459, 'Troca de óleo', '2024-05-15', 665.31),
(767, 463, 'Revisão', '2024-11-28', 969.79),
(992, 644, 'Revisão', '2024-07-05', 243.59);

INSERT INTO pecas (peca_id, nome, preco) VALUES
 (938, 'Filtro de óleo', 1310.51),
 (803, 'Pastilha de freio', 1363.42),
 (823, 'Amortecedor', 330.49),
 (992, 'Correia dentada', 103.02),
 (860, 'Velas de ignição', 646.59),
 (842, 'Bateria', 1397.13),
 (904, 'Sensor de oxigênio', 1199.18),
 (924, 'Disco de freio', 499.35),
 (923, 'Pneu', 1075.23),
 (854, 'Radiador', 1122.71);

INSERT INTO servicos_pecas (servico_id, peca_id, quantidade) VALUES 
(767, 924, 2),
(821, 860, 2),
(869, 854, 1),
(948, 938, 1),
(992, 924, 2),
(869, 923, 1),
(963, 803, 1),
(821, 904, 1),
(992, 992, 1),
(992, 803, 4);