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
--- Algumas Querys de Exemplo
-----------------------------------------

--- Lista a quantidade de utilizadores por tipo hardware ou software
SELECT nome_tipo_utilizador tipo, count(nome_utilizador) nome
FROM tpratico.utilizador
INNER JOIN tpratico.tipo_utilizador USING(cod_tipo_utilizador)
GROUP BY tipo;


--- Lista os utilizadores da empresa e respetivo tipo hardware ou software
SELECT nome_utilizador nome, nome_tipo_utilizador tipo
FROM tpratico.utilizador
INNER JOIN tpratico.tipo_utilizador USING(cod_tipo_utilizador)
GROUP BY nome, tipo
ORDER BY tipo;


--- Lista quantidade de tickets por estado (Aberto, Pendente, Fechado)
SELECT nome_tk_estado nome, count(cod_tk)
FROM tpratico.ticket
INNER JOIN tpratico.ticket_estado USING(cod_tk_estado)
GROUP BY nome;


--- Lista quantidade de tickets por distribuidor
SELECT nome_distribuidor distribuidor, count(tk.cod_tk_dist)
FROM tpratico.distribuidor
INNER JOIN tpratico.ticket_distribuidor tk USING (cod_distribuidor)
GROUP BY distribuidor;


--- Lista a quantidade de produtos que tiveram em tickets por distribuidor
SELECT nome_distribuidor distribuidor, COUNT(cod_hardware) qtd_hardware, COUNT(cod_software) qtd_software
FROM tpratico.produto prod
INNER JOIN tpratico.hardware hardware ON prod.cod_produto = hardware.cod_hardware
INNER JOIN tpratico.software software USING (cod_software)
INNER JOIN tpratico.venda venda USING (cod_produto)
INNER JOIN tpratico.distribuidor USING (cod_distribuidor)
INNER JOIN tpratico.ticket_distribuidor USING (cod_distribuidor)
INNER JOIN tpratico.ticket USING (cod_tk_dist)
GROUP BY distribuidor;


--- Verifica quantos produtos hardware vendidos, entraram em ticket no distribuidor e mostra resultados por distribuidor
SELECT nome_distribuidor distribuidor, count(prod.cod_produto)
FROM tpratico.produto prod
INNER JOIN tpratico.hardware hardware ON prod.cod_produto = hardware.cod_hardware
INNER JOIN tpratico.software software USING (cod_software)
INNER JOIN tpratico.venda venda USING (cod_produto)
INNER JOIN tpratico.distribuidor USING (cod_distribuidor)
INNER JOIN tpratico.ticket_distribuidor tk_dist USING (cod_distribuidor)
INNER JOIN tpratico.ticket USING (cod_tk_dist)
WHERE prod.cod_produto = hardware.cod_hardware AND prod.cod_produto = tk_dist.cod_produto
GROUP BY distribuidor;


--- Assim verificamos que dos tickets da alinea anterior nenhum passou a ticket na empresa
SELECT nome_distribuidor distribuidor, count(prod.cod_produto)
FROM tpratico.produto prod
INNER JOIN tpratico.hardware hardware ON prod.cod_produto = hardware.cod_hardware
INNER JOIN tpratico.software software USING (cod_software)
INNER JOIN tpratico.venda venda USING (cod_produto)
INNER JOIN tpratico.distribuidor USING (cod_distribuidor)
INNER JOIN tpratico.ticket_distribuidor tk_dist USING (cod_distribuidor)
INNER JOIN tpratico.ticket USING (cod_tk_dist)
WHERE prod.cod_produto = hardware.cod_hardware AND prod.cod_produto = ticket.cod_tk_dist
GROUP BY distribuidor;


--- Lista todos produtos que entraram em ticket na empresa e quantas vezes
SELECT tk_dist.cod_tk_dist ticket_distribuidor, p.nome_produto produto, p.cod_produto, t.cod_tk ticket_empresa, count(cod_tk) qtd_tickets
FROM tpratico.ticket t
INNER JOIN tpratico.ticket_distribuidor tk_dist USING(cod_tk_dist)
INNER JOIN tpratico.produto p USING (cod_produto)
GROUP BY nome_produto, p.cod_produto, ticket_distribuidor, ticket_empresa;


--- Query experimental para verificar o tempo de resposta entre duas mensagens no distribuidor
INSERT INTO tpratico.mensagens_distribuidor(cod_msg_dist, cod_utilizador, cod_tk, txt_msg_dist, dt_msg_dist) VALUES (4, 2, 4, 'O problema encontra-se resolvido', '2021-04-15 11:32:41');

SELECT 
DISTINCT ON (cod_tk) cod_tk, dt_msg_dist - LAG(dt_msg_dist, 1) OVER (PARTITION BY cod_tk ORDER BY cod_msg_dist ASC) as dt_diff
FROM tpratico.mensagens_distribuidor
ORDER BY cod_tk, dt_msg_dist DESC;
