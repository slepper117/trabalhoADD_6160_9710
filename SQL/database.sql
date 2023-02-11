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



--- Comando para criar uma database nova:
--- CREATE DATABASE tp_6160_9745;


--- Comando para criar um schema novo:
--- CREATE SCHEMA tpratico;



-----------------------------------------
--- Apaga os objetos já criados
-----------------------------------------
DROP TABLE IF EXISTS tpratico.produto CASCADE;
DROP TABLE IF EXISTS tpratico.hardware CASCADE;
DROP TABLE IF EXISTS tpratico.fornecedor CASCADE;
DROP TABLE IF EXISTS tpratico.software CASCADE;
DROP TABLE IF EXISTS tpratico.ticket_distribuidor CASCADE;
DROP TABLE IF EXISTS tpratico.distribuidor CASCADE;
DROP TABLE IF EXISTS tpratico.venda CASCADE;
DROP TABLE IF EXISTS tpratico.mensagens_cliente CASCADE;
DROP TABLE IF EXISTS tpratico.cliente CASCADE;
DROP TABLE IF EXISTS tpratico.ticket_estado CASCADE;
DROP TABLE IF EXISTS tpratico.ticket CASCADE;
DROP TABLE IF EXISTS tpratico.utilizador CASCADE;
DROP TABLE IF EXISTS tpratico.tipo_utilizador CASCADE;
DROP TABLE IF EXISTS tpratico.ticket_utilizador CASCADE;
DROP TABLE IF EXISTS tpratico.mensagens_empresa CASCADE;
DROP TABLE IF EXISTS tpratico.mensagens_distribuidor CASCADE;
DROP TYPE IF EXISTS tpratico.tipo_prod CASCADE;

-----------------------------------------
--- CRIA UM ENUMERADO
-----------------------------------------
CREATE TYPE tpratico.tipo_prod AS ENUM ('SOFTWARE', 'HARDWARE');


-----------------------------------------
--- CRIA AS TABELAS
-----------------------------------------
CREATE TABLE tpratico.produto (
	cod_produto 	SERIAL 								NOT NULL,
	tipo_produto 	tpratico.tipo_prod 		NOT NULL,
	nome_produto 	VARCHAR(25) 					NOT NULL,
	CONSTRAINT produto_pk PRIMARY KEY (cod_produto)
);


CREATE TABLE tpratico.software (
	cod_software 	INT 	NOT NULL,
	CONSTRAINT software_pk PRIMARY KEY (cod_software)
);


CREATE TABLE tpratico.hardware (
	cod_hardware 		INT 	NOT NULL,
	cod_fornecedor 	INT 	NOT NULL 	DEFAULT 1,
	cod_software 		INT 	NOT NULL 	DEFAULT 1,
	CONSTRAINT hardware_pk PRIMARY KEY (cod_hardware)
);


CREATE TABLE tpratico.fornecedor (
	cod_fornecedor 		INT 					NOT NULL 	CHECK(cod_fornecedor > 0),
	nome_fornecedor 	VARCHAR(25) 	NOT NULL,
	CONSTRAINT fornecedor_pk PRIMARY KEY (cod_fornecedor)
);


CREATE TABLE tpratico.ticket_distribuidor (
	cod_tk_dist 					INT 						NOT NULL 	CHECK(cod_tk_dist > 0),
	cod_produto 					INT 						NOT NULL,
	cod_cliente 					INT 						NOT NULL,
	cod_distribuidor 			INT 						NOT NULL,
	cod_tk_estado 				INT 						NOT NULL 	DEFAULT 1,
	assunto_tk_dist 			VARCHAR(250),
	descricao_tk_dist 		TEXT,
	lic_tk_dist						VARCHAR(250)		NOT NULL,
	dt_tk_dist 						TIMESTAMP 			NOT NULL 	DEFAULT NOW(),
	CONSTRAINT tk_PRIMARY PRIMARY KEY (cod_tk_dist)
);


CREATE TABLE tpratico.distribuidor (
	cod_distribuidor 		INT 					NOT NULL 	CHECK(cod_distribuidor > 0),
	nome_distribuidor 	VARCHAR(250) 	NOT NULL,
	CONSTRAINT dist_pk PRIMARY KEY (cod_distribuidor)
);


CREATE TABLE tpratico.venda (
	cod_produto 			INT 				NOT NULL,
	cod_distribuidor 	INT 				NOT NULL,
	dt_venda 					TIMESTAMP 	NOT NULL	DEFAULT NOW(),
	CONSTRAINT vendas_pk PRIMARY KEY (cod_produto, cod_distribuidor)
);


CREATE TABLE tpratico.mensagens_cliente (
	cod_msg_cl 		INT 				NOT NULL  	CHECK(cod_msg_cl > 0),
	cod_tk_dist 	INT 				NOT NULL,
	txt_msg_cl 		TEXT 				NOT NULL,
	dt_msg_cl 		TIMESTAMP 	NOT NULL 		DEFAULT NOW(),
	CONSTRAINT msg_cl_pk PRIMARY KEY (cod_msg_cl)
);


CREATE TABLE tpratico.cliente (
	cod_cliente 	INT 					NOT NULL 	  	CHECK(cod_cliente > 0),
	nome_cliente 	VARCHAR(250) 	NOT NULL,
	CONSTRAINT cliente_pk PRIMARY KEY (cod_cliente)
);


CREATE TABLE tpratico.ticket_estado (
	cod_tk_estado 	INT 					NOT NULL 	CHECK(cod_tk_estado > 0),
	nome_tk_estado 	VARCHAR(10),
	CONSTRAINT tk_estado_pk PRIMARY KEY (cod_tk_estado)
);


CREATE TABLE tpratico.ticket (
	cod_tk 								INT 						NOT NULL 	CHECK(cod_tk > 0),
	cod_tk_dist 					INT 						NOT NULL,
	cod_tk_estado 				INT 						NOT NULL 	DEFAULT 1,
	cod_utilizador_resp 	INT,
	assunto_tk 						VARCHAR(250),
	descricao_tk 					TEXT,
	dt_tk 								TIMESTAMP 			NOT NULL 	DEFAULT NOW(),
	CONSTRAINT tk_pk PRIMARY KEY (cod_tk)
);


CREATE TABLE tpratico.utilizador (
	cod_utilizador 				INT 					NOT NULL 	CHECK(cod_utilizador > 0),
	cod_tipo_utilizador 	INT 					NOT NULL,
	nome_utilizador 			VARCHAR(250) 	NOT NULL,
	CONSTRAINT utilizador_pk PRIMARY KEY (cod_utilizador)
);


CREATE TABLE tpratico.tipo_utilizador (
	cod_tipo_utilizador 	INT 						NOT NULL CHECK(cod_tipo_utilizador > 0),
	nome_tipo_utilizador 	VARCHAR(10),
	CONSTRAINT tp_utilizador_pk PRIMARY KEY (cod_tipo_utilizador)
);


CREATE TABLE tpratico.ticket_utilizador (
	cod_utilizador 	INT 	NOT NULL,
	cod_tk 					INT 	NOT NULL,
	CONSTRAINT ticket_utilizador_pk PRIMARY KEY (cod_utilizador, cod_tk)
);


CREATE TABLE tpratico.mensagens_empresa (
	cod_msg_emp			INT					NOT NULL 	CHECK(cod_msg_emp > 0),
	cod_utilizador 	INT 				NOT NULL,
	cod_tk 					INT 				NOT NULL,
	txt_msg_emp 		TEXT 				NOT NULL,
	dt_msg_emp 			TIMESTAMP 	NOT NULL	DEFAULT NOW(),
	CONSTRAINT msg_emp_pk PRIMARY KEY (cod_msg_emp)
);


CREATE TABLE tpratico.mensagens_distribuidor (
	cod_msg_dist		INT					NOT NULL 	CHECK(cod_msg_dist > 0),
	cod_utilizador 	INT 				NOT NULL,
	cod_tk 					INT 				NOT NULL,
	txt_msg_dist 		TEXT 				NOT NULL,
	dt_msg_dist 		TIMESTAMP 	NOT NULL 	DEFAULT NOW(),
	CONSTRAINT msg_dist_pk PRIMARY KEY (cod_msg_dist)
);




-----------------------------------------
--- CRIA AS RELAÇÕES
-----------------------------------------
--- fornecedores -> hardware 
ALTER TABLE tpratico.hardware 
ADD CONSTRAINT fornecedor_fk 
FOREIGN KEY (cod_fornecedor)
REFERENCES tpratico.fornecedor (cod_fornecedor);

--- software -> hardware
ALTER TABLE tpratico.hardware 
ADD CONSTRAINT software_fk 
FOREIGN KEY (cod_software)
REFERENCES tpratico.software (cod_software);

--- produto -> hardware
ALTER TABLE tpratico.hardware
ADD CONSTRAINT produto_fk 
FOREIGN KEY (cod_hardware)
REFERENCES tpratico.produto (cod_produto);

--- produto -> software
ALTER TABLE tpratico.software 
ADD CONSTRAINT produto_fk 
FOREIGN KEY (cod_software)
REFERENCES tpratico.produto (cod_produto);

--- produto -> ticket_distribuidor
ALTER TABLE tpratico.ticket_distribuidor 
ADD CONSTRAINT produto_fk 
FOREIGN KEY (cod_produto)
REFERENCES tpratico.produto (cod_produto);

--- produto (N,N) distribuidor :: Vendas
ALTER TABLE tpratico.venda
ADD CONSTRAINT produto_fk 
FOREIGN KEY (cod_produto)
REFERENCES tpratico.produto (cod_produto);

ALTER TABLE tpratico.venda 
ADD CONSTRAINT distribuidor_fk 
FOREIGN KEY (cod_distribuidor)
REFERENCES tpratico.distribuidor (cod_distribuidor);

--- distribuidor -> ticket_distribuidor
ALTER TABLE tpratico.ticket_distribuidor 
ADD CONSTRAINT distribuidor_fk 
FOREIGN KEY (cod_distribuidor)
REFERENCES tpratico.distribuidor (cod_distribuidor);

--- cliente -> ticket_distribuidor
ALTER TABLE tpratico.ticket_distribuidor 
ADD CONSTRAINT cliente_fk 
FOREIGN KEY (cod_cliente)
REFERENCES tpratico.cliente (cod_cliente);

--- ticket_distribuidor -> mensagens_cliente
ALTER TABLE tpratico.mensagens_cliente 
ADD CONSTRAINT ticket_distribuidor_fk 
FOREIGN KEY (cod_tk_dist)
REFERENCES tpratico.ticket_distribuidor (cod_tk_dist);

--- estado -> ticket_distribuidor
ALTER TABLE tpratico.ticket_distribuidor 
ADD CONSTRAINT ticket_estado_fk 
FOREIGN KEY (cod_tk_estado)
REFERENCES tpratico.ticket_estado (cod_tk_estado);

--- ticket_distribuidor -> ticket
ALTER TABLE tpratico.ticket 
ADD CONSTRAINT ticket_distribuidor_fk 
FOREIGN KEY (cod_tk_dist)
REFERENCES tpratico.ticket_distribuidor (cod_tk_dist);

--- estado -> ticket
ALTER TABLE tpratico.ticket 
ADD CONSTRAINT ticket_estado_fk 
FOREIGN KEY (cod_tk_estado)
REFERENCES tpratico.ticket_estado (cod_tk_estado);

--- utilizador -> ticket :: É responsável
ALTER TABLE tpratico.ticket 
ADD CONSTRAINT utilizador_fk 
FOREIGN KEY (cod_utilizador_resp)
REFERENCES tpratico.utilizador (cod_utilizador);

--- utilizador (N,N) ticket :: Pertence
ALTER TABLE tpratico.ticket_utilizador
ADD CONSTRAINT utilizador_fk 
FOREIGN KEY (cod_utilizador)
REFERENCES tpratico.utilizador (cod_utilizador);

ALTER TABLE tpratico.ticket_utilizador 
ADD CONSTRAINT ticket_fk 
FOREIGN KEY (cod_tk)
REFERENCES tpratico.ticket (cod_tk);

--- tipo -> utilizador
ALTER TABLE tpratico.utilizador 
ADD CONSTRAINT tipo_utilizador_fk 
FOREIGN KEY (cod_tipo_utilizador)
REFERENCES tpratico.tipo_utilizador (cod_tipo_utilizador);

--- ticket -> mensagens_empresa <- utilizador
ALTER TABLE tpratico.mensagens_empresa 
ADD CONSTRAINT ticket_fk 
FOREIGN KEY (cod_tk)
REFERENCES tpratico.ticket (cod_tk);

ALTER TABLE tpratico.mensagens_empresa 
ADD CONSTRAINT utilizador_fk 
FOREIGN KEY (cod_utilizador)
REFERENCES tpratico.utilizador (cod_utilizador);

--- ticket -> mensagens_distribuidor <- utilizador
ALTER TABLE tpratico.mensagens_distribuidor 
ADD CONSTRAINT ticket_fk 
FOREIGN KEY (cod_tk)
REFERENCES tpratico.ticket (cod_tk);

ALTER TABLE tpratico.mensagens_distribuidor
ADD CONSTRAINT utilizador_fk 
FOREIGN KEY (cod_utilizador)
REFERENCES tpratico.utilizador (cod_utilizador);




-----------------------------------------
--- CRIA OS INDEXES
-----------------------------------------
CREATE INDEX prd_cod_i ON tpratico.produto(cod_produto);  
CREATE INDEX sft_cod_i ON tpratico.software(cod_software);  
CREATE INDEX hdr_cod_i ON tpratico.hardware(cod_hardware); 
CREATE INDEX fnr_cod_i ON tpratico.fornecedor(cod_fornecedor); 
CREATE INDEX tkr_cod_i ON tpratico.ticket_distribuidor(cod_tk_dist); 
CREATE INDEX dst_cod_i ON tpratico.distribuidor(cod_distribuidor); 
CREATE INDEX vda_cod_i ON tpratico.venda(cod_produto, cod_distribuidor); 
CREATE INDEX msc_cod_i ON tpratico.mensagens_cliente(cod_msg_cl); 
CREATE INDEX clt_cod_i ON tpratico.cliente(cod_cliente); 
CREATE INDEX tke_cod_i ON tpratico.ticket_estado(cod_tk_estado); 
CREATE INDEX tck_cod_i ON tpratico.ticket(cod_tk); 
CREATE INDEX utl_cod_i ON tpratico.utilizador(cod_utilizador); 
CREATE INDEX tut_cod_i ON tpratico.tipo_utilizador(cod_tipo_utilizador); 
CREATE INDEX tku_cod_i ON tpratico.ticket_utilizador(cod_utilizador, cod_tk); 
CREATE INDEX mse_cod_i ON tpratico.mensagens_empresa(cod_utilizador, cod_tk); 
CREATE INDEX msd_cod_i ON tpratico.mensagens_distribuidor(cod_utilizador, cod_tk); 




-----------------------------------------
--- FUNÇÕES
-----------------------------------------

--- Esta função copia o código de um produto para a tabela correspondente
CREATE OR REPLACE FUNCTION tpratico.fun_cp_cod_produto() 
RETURNS TRIGGER AS $$
    BEGIN
        IF (NEW.tipo_produto = 'SOFTWARE'::tpratico.tipo_prod) THEN
            INSERT INTO tpratico.software(cod_software) VALUES (NEW.cod_produto);
        ELSIF (NEW.tipo_produto = 'HARDWARE'::tpratico.tipo_prod) THEN
            INSERT INTO tpratico.hardware(cod_hardware) VALUES (NEW.cod_produto);
        END IF;
        RETURN NULL;
    END;
$$ LANGUAGE plpgsql;


--- Esta função atualiza o estado do ticket e insere na tabela ticket_utilizador o responsável
CREATE OR REPLACE FUNCTION tpratico.fun_atualiza_tk() 
RETURNS TRIGGER AS $$
	BEGIN
    	INSERT INTO tpratico.ticket_utilizador(cod_utilizador, cod_tk) VALUES(OLD.cod_tk_dist, NEW.cod_utilizador_resp);
		UPDATE tpratico.ticket SET cod_tk_estado = 2;
    	RETURN NULL;
	END;
$$ LANGUAGE plpgsql;




-----------------------------------------
--- TRIGERS
-----------------------------------------

--- Trigger na tabela cp_cod_produto
CREATE TRIGGER cp_cod_produto
AFTER INSERT ON tpratico.produto
FOR EACH ROW
EXECUTE PROCEDURE tpratico.fun_cp_cod_produto();


--- Triger da função na tabela ticket
CREATE TRIGGER atualiza_tk
AFTER UPDATE OF cod_utilizador_resp ON tpratico.ticket
FOR EACH ROW
EXECUTE PROCEDURE tpratico.fun_atualiza_tk();
