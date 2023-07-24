	2. Implementação de um novo modelo: criação de uma nova tabela
		Ø CREATE TABLE PRODUTOS -- criação de uma tabela do 0, com especificações dos tipos de data
		(
		CODIGO VARCHAR (10) NOT NULL, -- NOT NULL quando um campo não aceita estar sem valor
		DESCRITOR VARCHAR (100) NULL,
		SABOR VARCHAR (50) NULL,
		TAMANHO VARCHAR (50) NULL, 
		EMBALAGEM VARCHAR (50) NULL,
		PRECO_LISTA FLOAT NULL,
		PRIMARY KEY (CODIGO) -- definida a chave primária de uma tabela
		)
		CREATE TABLE VENDEDORES
		(
		MATRICULA VARCHAR (5) NOT NULL,
		NOME VARCHAR (100) NULL,
		BAIRRO VARCHAR (50) NULL,
		COMISSAO FLOAT NULL, 
		DATA_ADMISSAO DATE NULL, -- data qualquer de admissão dos vendedores
		FERIAS BIT NULL, -- campo categórico (0, para não e 1 para sim)
		PRIMARY KEY (MATRICULA)
		);
		
		Ø -- informações dos processos de manipulação de dados 
		-- FK como identificador de uma outra coluna com informações que já existam em outra tabela
		
		CREATE TABLE TABELA_DE_VENDAS
		(
		NUMERO VARCHAR (5) NOT NULL, 
		DATA_VENDA DATE NULL,
		CPF VARCHAR (11) NOT NULL, -- foreign keys não aceitam valores nulos, também
		MATRICULA VARCHAR (11) NOT NULL,
		IMPOSTO FLOAT NULL,
		PRIMARY KEY (NUMERO)
		);
		
		ALTER TABLE TABELA_DE_VENDAS -- criãção das foreign keys que interligam valores de uma tabela, com a outra
		-- uma nota fiscal só pode estar associada a um cliente
		ADD CONSTRAINT FK_CLIENTES -- restrição de dados (previamente cadastrados em outra tabela)
		FOREIGN KEY (CPF) REFERENCES CLIENTE (CPF); -- relaciona o campo da "tabela de produtos" com a tabela de "clientes"
		
		-- criação de uma nova chave estrangeira
		
		ALTER TABLE TABELA_DE_VENDAS
		ADD CONSTRAINT FK_VENDEDORES
		FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES (MATRICULA);
		
		ALTER TABLE TABELA_DE_VENDAS
		ALTER COLUMN MATRICULA VARCHAR(5) NOT NULL;--modificar as propriedades de uma coluna previamente criada
		-- caso já existisse uma foreign key, não seria capaz de modificar a coluna
