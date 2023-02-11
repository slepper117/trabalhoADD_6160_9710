-----------------------------------------
-----------------------------------------
--- Trabalho Prático
--- Armazenamento e Acesso de Dados
--- Engenharia de Sistemas Informáticos
--- 2º Ano, 1º Semestre
---
--- Renato Dantas, 6160
--- Fábio Mota, 9745
---
--- Testado em: 
--- PostgreSQL 12
--- Ubuntu 20.04 (server edition)
--- pgAdmin 4 6.3
-----------------------------------------
-----------------------------------------



-----------------------------------------
--- INSERE DADOS DE TESTE
-----------------------------------------

--- TABELA: tpratico.fornecedor
--- INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (INT*, VARCHAR(25)*);
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (1, 'Empresa-Mãe');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (2, 'Fornecedor 1');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (3, 'Fornecedor 2');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (4, 'Fornecedor 3');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (5, 'Fornecedor 4');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (6, 'Fornecedor 5');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (7, 'Fornecedor 6');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (8, 'Fornecedor 7');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (9, 'Fornecedor 8');
INSERT INTO tpratico.fornecedor(cod_fornecedor, nome_fornecedor) VALUES (10, 'Fornecedor 9');


--- TABELA: tpratico.ticket_estado
--- INSERT INTO tpratico.ticket_estado(cod_tk_estado, nome_tk_estado) VALUES (INT*, VARCHAR(10)*);
INSERT INTO tpratico.ticket_estado(cod_tk_estado, nome_tk_estado) VALUES (1, 'Aberto');
INSERT INTO tpratico.ticket_estado(cod_tk_estado, nome_tk_estado) VALUES (2, 'Pendente');
INSERT INTO tpratico.ticket_estado(cod_tk_estado, nome_tk_estado) VALUES (3, 'Fechado');


--- TABELA: tpratico.tipo_utilizador
--- INSERT INTO tpratico.tipo_utilizador(cod_tipo_utilizador, nome_tipo_utilizador) VALUES (INT*, VARCHAR(10)*);
INSERT INTO tpratico.tipo_utilizador(cod_tipo_utilizador, nome_tipo_utilizador) VALUES (1, 'Hardware');
INSERT INTO tpratico.tipo_utilizador(cod_tipo_utilizador, nome_tipo_utilizador) VALUES (2, 'Software');


--- TABELA: tpratico.cliente
--- INSERT INTO tpratico.(cod_cliente, nome_cliente) VALUES (INT*, VARCHAR(250)*);
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (1, 'Cliente 1');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (2, 'Cliente 2');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (3, 'Cliente 3');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (4, 'Cliente 4');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (5, 'Cliente 5');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (6, 'Cliente 6');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (7, 'Cliente 7');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (8, 'Cliente 8');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (9, 'Cliente 9');
INSERT INTO tpratico.cliente(cod_cliente, nome_cliente) VALUES (10, 'Cliente 10');


--- TABELA: tpratico.distribuidor
--- INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (INT*, VARCHAR(250)*);
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (1, 'Distribuidor 1');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (2, 'Distribuidor 2');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (3, 'Distribuidor 3');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (4, 'Distribuidor 4');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (5, 'Distribuidor 5');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (6, 'Distribuidor 6');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (7, 'Distribuidor 7');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (8, 'Distribuidor 8');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (9, 'Distribuidor 9');
INSERT INTO tpratico.distribuidor(cod_distribuidor, nome_distribuidor) VALUES (10, 'Distribuidor 10');


--- TABELA: tpratico.utilizador
--- INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (INT*, INT*, VARCHAR(250)*);
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (1, 1, 'Utilizador 1');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (2, 2, 'Utilizador 2');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (3, 1, 'Utilizador 3');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (4, 2, 'Utilizador 4');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (5, 1, 'Utilizador 5');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (6, 2, 'Utilizador 6');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (7, 1, 'Utilizador 7');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (8, 2, 'Utilizador 8');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (9, 1, 'Utilizador 9');
INSERT INTO tpratico.utilizador(cod_utilizador, cod_tipo_utilizador, nome_utilizador) VALUES (10, 2, 'Utilizador 10');



--- TABELA: tpratico.produto
--- INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES (['SOFTWARE' | 'HARDWARE']*, VARCHAR(25)*);
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 1');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 2');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 3');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 4');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 5');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 6');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 7');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 8');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 9');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('SOFTWARE', 'Software 10');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 1');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 2');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 3');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 4');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 5');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 6');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 7');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 8');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 9');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 10');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 11');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 12');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 13');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 14');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 15');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 16');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 17');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 18');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 19');
INSERT INTO tpratico.produto(tipo_produto, nome_produto) VALUES ('HARDWARE', 'Hardware 20');


--- TABELA: tpratico.software
--- INSERT INTO tpratico.software(cod_software) VALUES (INT*);
INSERT INTO tpratico.software(cod_software) VALUES (1);
INSERT INTO tpratico.software(cod_software) VALUES (2);
INSERT INTO tpratico.software(cod_software) VALUES (3);
INSERT INTO tpratico.software(cod_software) VALUES (4);
INSERT INTO tpratico.software(cod_software) VALUES (5);
INSERT INTO tpratico.software(cod_software) VALUES (6);
INSERT INTO tpratico.software(cod_software) VALUES (7);
INSERT INTO tpratico.software(cod_software) VALUES (8);
INSERT INTO tpratico.software(cod_software) VALUES (9);
INSERT INTO tpratico.software(cod_software) VALUES (10);


--- TABELA: tpratico.hardware
--- INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (INT*, INT*, INT*);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (11, 1, 1);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (12, 2, 8);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (13, 6, 5);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (14, 9, 6);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (15, 9, 4);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (16, 2, 1);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (17, 4, 7);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (18, 8, 2);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (19, 1, 9);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (20, 5, 6);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (21, 3, 2);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (22, 7, 3);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (23, 8, 5);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (24, 7, 2);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (25, 7, 2);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (26, 7, 6);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (27, 9, 1);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (28, 2, 5);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (29, 1, 6);
INSERT INTO tpratico.hardware(cod_hardware, cod_fornecedor, cod_software) VALUES (30, 6, 9);


--- TABELA: tpratico.venda
--- INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (INT*, INT*, TIMESATAMP*);
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (7, 9, '2020-01-05 15:46:39');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (12, 7, '2020-01-08 15:33:53');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (21, 9, '2020-01-20 10:01:55');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (20, 6, '2020-01-20 11:17:10');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (10, 7, '2020-01-22 15:28:39');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (15, 6, '2020-01-26 15:11:29');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (2, 1, '2020-02-02 17:53:31');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (9, 6, '2020-02-25 13:47:56');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (4, 9, '2020-03-11 11:32:25');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (19, 6, '2020-03-11 16:51:31');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (27, 8, '2020-04-02 17:43:37');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (19, 2, '2020-04-16 10:17:46');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (15, 4, '2020-04-20 16:02:25');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (28, 5, '2020-04-25 14:17:22');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (25, 1, '2020-05-20 11:11:9');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (16, 7, '2020-06-10 14:48:12');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (11, 4, '2020-06-15 09:09:21');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (2, 3, '2020-06-17 09:16:25');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (19, 3, '2020-06-19 17:51:12');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (6, 6, '2020-07-21 14:11:36');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (26, 4, '2020-07-23 11:30:11');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (15, 2, '2020-07-24 09:22:38');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (1, 1, '2020-07-25 15:15:26');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (7, 2, '2020-08-17 15:29:06');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (5, 8, '2020-08-20 12:35:11');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (3, 5, '2020-08-22 13:51:15');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (19, 7, '2020-08-25 12:19:50');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (15, 1, '2020-09-05 15:21:44');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (23, 6, '2020-09-16 17:43:43');
INSERT INTO tpratico.venda(cod_produto, cod_distribuidor, dt_venda) VALUES (13, 3, '2020-10-07 13:48:35');


--- TABELA: tpratico.ticket_distribuidor
--- INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (INT*,INT*,INT*,INT*,INT*, VARCHAR(250), TEXT ,VARCHAR(250)*, TIMESATAMP);
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (1, 21, 7, 9, 3, 'Assunto 1', 'Descrição 1', 'H46968', '2020-07-01 12:58:07');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (2, 10, 1, 5, 3, 'Assunto 2', 'Descrição 2', 'H46589', '2020-07-19 14:47:01');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (3, 9, 8, 6, 3, 'Assunto 3', 'Descrição 3', 'S92286', '2020-09-04 15:41:41');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (4, 27, 3, 8, 1, 'Assunto 4', 'Descrição 4', 'H67570', '2020-10-12 12:56:38');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (5, 19, 7, 2, 2, 'Assunto 5', 'Descrição 5', 'H57945', '2020-10-24 10:30:42');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (6, 15, 1, 4, 1, 'Assunto 6', 'Descrição 6', 'H55390', '2020-11-01 15:47:40');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (7, 28, 7, 5, 3, 'Assunto 7', 'Descrição 7', 'H57150', '2020-12-03 13:14:10');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (8, 16, 5, 7, 3, 'Assunto 8', 'Descrição 8', 'H58211', '2020-12-03 15:17:05');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (9, 11, 2, 2, 1, 'Assunto 9', 'Descrição 9', 'H34523', '2021-02-01 13:04:54');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (10, 19, 1, 3, 3, 'Assunto 10', 'Descrição 10', 'H13769', '2021-02-06 10:15:58');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (11, 26, 4, 4, 3, 'Assunto 11', 'Descrição 11', 'H74420', '2021-02-15 09:17:11');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (12, 1, 7, 1, 1, 'Assunto 12', 'Descrição 12', 'S45672', '2021-02-23 12:36:36');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (13, 5, 4, 8, 1, 'Assunto 13', 'Descrição 13', 'S63586', '2021-03-06 13:19:18');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (14, 15, 4, 1, 2, 'Assunto 14', 'Descrição 14', 'H92967', '2021-03-16 09:41:57');
INSERT INTO tpratico.ticket_distribuidor(cod_tk_dist, cod_produto, cod_cliente, cod_distribuidor, cod_tk_estado, assunto_tk_dist, descricao_tk_dist, lic_tk_dist, dt_tk_dist) VALUES (15, 13, 4, 3, 3, 'Assunto 15', 'Descrição 15', 'H71682', '2021-04-02 09:11:26');


--- TABELA: tpratico.ticket
--- INSERT INTO tpratico.ticket(cod_tk, cod_tk_dist, cod_tk_estado, cod_utilizador_resp, assunto_tk, descricao_tk, dt_tk) VALUES (INT*, INT*, INT*, INT, VARCHAR(250), TEXT, TIMESTAMP);
INSERT INTO tpratico.ticket(cod_tk, cod_tk_dist, cod_tk_estado, cod_utilizador_resp, assunto_tk, descricao_tk, dt_tk) VALUES (1, 6, 3, 4, 'Assunto 1', 'Descrição 1', '2020-11-13 09:05:42');
INSERT INTO tpratico.ticket(cod_tk, cod_tk_dist, cod_tk_estado, cod_utilizador_resp, assunto_tk, descricao_tk, dt_tk) VALUES (2, 7, 2, 2, 'Assunto 2', 'Descrição 2', '2020-12-16 12:36:15');
INSERT INTO tpratico.ticket(cod_tk, cod_tk_dist, cod_tk_estado, cod_utilizador_resp, assunto_tk, descricao_tk, dt_tk) VALUES (3, 12, 3, 6, 'Assunto 3', 'Descrição 3', '2021-02-03 15:41:40');
INSERT INTO tpratico.ticket(cod_tk, cod_tk_dist, cod_tk_estado, cod_utilizador_resp, assunto_tk, descricao_tk, dt_tk) VALUES (4, 13, 3, 2, 'Assunto 4', 'Descrição 4', '2021-03-15 12:44:11');
INSERT INTO tpratico.ticket(cod_tk, cod_tk_dist, cod_tk_estado, assunto_tk, descricao_tk, dt_tk) VALUES (5, 15, 1, 'Assunto 5', 'Descrição 5', '2021-04-10 11:26:25');


--- TABELA: tpratico.ticket_utilizador
--- INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (INT*, INT*);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (4, 1);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (7, 1);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (2, 2);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (6, 3);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (1, 3);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (10, 3);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (8, 1);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (9, 3);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (2, 4);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (8, 4);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (3, 4);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (5, 4);
INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES (5, 2);


--- TABELA: tpratico.mensagens_cliente
--- INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (INT*, INT*, TEXT*, TIMESTAMP);
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (1, 1, 'Problema Resolvido', '2020-07-02 11:23:17');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (2, 2, 'Problema Resolvido', '2020-07-22 15:36:41');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (3, 3, 'Problema Resolvido', '2020-09-05 13:44:19');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (4, 4, 'Problema Resolvido', '2020-10-13 16:33:31');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (5, 5, 'Problema Resolvido', '2020-10-25 09:38:14');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (6, 6, 'Problema Resolvido', '2020-11-02 17:44:10');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (7, 6, 'Não vamos conseguir resolver, vamos pedir suporte à empresa-mãe', '2020-11-07 10:26:40');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (8, 7, 'Problema Resolvido', '2020-12-05 16:17:36');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (9, 8, 'Problema Resolvido', '2020-12-06 15:27:37');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (10, 7, 'Não vamos conseguir resolver, vamos pedir suporte à empresa-mãe', '2020-12-10 11:23:07');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (11, 9, 'Problema Resolvido', '2021-02-04 15:19:02');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (12, 10, 'Problema Resolvido', '2021-02-07 15:01:12');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (13, 11, 'Problema Resolvido', '2021-02-16 17:24:58');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (14, 12, 'Problema Resolvido', '2021-02-25 15:32:26');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (15, 12, 'Não vamos conseguir resolver, vamos pedir suporte à empresa-mãe', '2021-02-28 12:36:42');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (16, 13, 'Problema Resolvido', '2021-03-08 10:35:08');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (17, 13, 'Não vamos conseguir resolver, vamos pedir suporte à empresa-mãe', '2021-03-14 09:39:48');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (18, 14, 'Problema Resolvido', '2021-03-17 11:57:13');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (19, 15, 'Problema Resolvido', '2021-04-04 11:46:19');
INSERT INTO tpratico.mensagens_cliente(cod_msg_cl, cod_tk_dist, txt_msg_cl, dt_msg_cl) VALUES (20, 15, 'Não vamos conseguir resolver, vamos pedir suporte à empresa-mãe', '2021-04-09 16:29:42');


--- TABELA: tpratico.mensagens_empresa
--- INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (INT*, INT*, INT*, TEXT*, TIMESTAMP);
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (1, 4, 1, 'Estamos a trabalhar nisso', '2020-11-15 16:38:48');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (2, 7, 1, 'Não estamos a tentar corrigir o problema', '2020-11-17 15:40:47');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (3, 2, 2, 'Não estou a conseguir solução', '2020-12-17 15:55:24');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (4, 1, 3, 'Resolvido informa o distribuidor', '2021-02-06 12:42:48');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (5, 9, 3, 'Estamos a trabalhar nisso', '2021-02-15 09:15:10');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (6, 8, 4, 'Não estamos a tentar corrigir o problema', '2021-03-18 10:56:15');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (7, 5, 2, 'Não estou a conseguir solução', '2021-03-20 12:45:20');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (8, 8, 1, 'Resolvido informa o distribuidor', '2021-04-01 10:29:54');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (9, 6, 3, 'Estamos a trabalhar nisso', '2021-04-05 10:46:52');
INSERT INTO tpratico.mensagens_empresa(cod_msg_emp, cod_utilizador, cod_tk, txt_msg_emp, dt_msg_emp) VALUES (10, 2, 4, 'Não estou a conseguir solução', '2021-04-07 11:32:41');


--- TABELA: tpratico.mensagens_distribuidor
--- INSERT INTO tpratico.mensagens_distribuidor(cod_msg_dist, cod_utilizador, cod_tk, txt_msg_dist, dt_msg_dist) VALUES (INT*, INT*, INT*, TEXT*, TIMESTAMP);
INSERT INTO tpratico.mensagens_distribuidor(cod_msg_dist, cod_utilizador, cod_tk, txt_msg_dist, dt_msg_dist) VALUES (1, 4, 1, 'O problema encontra-se resolvido', '2021-04-05 10:29:54');
INSERT INTO tpratico.mensagens_distribuidor(cod_msg_dist, cod_utilizador, cod_tk, txt_msg_dist, dt_msg_dist) VALUES (2, 6, 3, 'O problema encontra-se resolvido', '2021-04-07 10:46:52');
INSERT INTO tpratico.mensagens_distribuidor(cod_msg_dist, cod_utilizador, cod_tk, txt_msg_dist, dt_msg_dist) VALUES (3, 2, 4, 'O problema encontra-se resolvido', '2021-04-10 11:32:41');
