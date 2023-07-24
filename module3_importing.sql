	3. Incluindo dados no nosso dataframe e nas tabelas criadas: leitura de .csv e arquivos externos
		• Sintaxe global para inserção de novos dados em uma tabela
		Ø INSERT INTO <nome da tabela> --deve haver uma correspondência entre nomes e valores
		(<campos da tabela, campo da tabela...) --quando não se escreve o nome dos campos, valores devem inseridos em ordem de criação
		VALUES
		(<valores, valores, valores...)
		
		Ø INSERT INTO PRODUTOS
		(CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
		VALUES --como CODIGO é primary key, só aceita valores únicos
		('1040107', 'Light - 350 ml - Melância', 'Melância', '350ml', 'Lata', 4.56),
		('10401nn', 'Light - 350 ml  - '-', '-', '350ml', 'Lata', 4.56)
		
	  -- Incluindo múltiplos registros - incluir um banco de dados, dentro do nosso dataframe:
		
		--partindo da recuperação de um arquivo de backup
		--"restaurar novo banco de dados" -> "dispositivo" -> "arquivo" -> "opções" -> "substituir banco de dados"
		
		SELECT * FROM SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS; --visualizar uma outra tebela de uma outra database
		--seleção na tabela da direita, com a tabela da esquerda -> obedecendo a correspondência de nomes e tipos
		
		--nome das colunas deve corresponder aos nomes das outras colunas, da outra tabela
		SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA
		AS PRECO_LISTA
		FROM SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS
		--mudança dos nomes das colunas
		
		INSERT INTO PRODUTOS 
		SELECT CODIGO_DO_PRODUTO AS CODIGO, NOME_DO_PRODUTO AS DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_DE_LISTA
		AS PRECO_LISTA
		FROM SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS
		WHERE CODIGO_DO_PRODUTO <> '1040107' --nesse caso, particular, havia uma correspondência de valores para
		--um determinado código de produto, portanto,  afirmando que esses valores são diferentes, o SQL aceita o
		--restanta da query editada. 
		
		Ø SELECT * FROM PRODUTOS;
		
		SELECT * FROM SUCOS_FRUTAS.DBO.TABELA_DE_CLIENTES
		
		SELECT * FROM CLIENTE;
		
		INSERT INTO CLIENTE
		SELECT CPF, NOME, ENDERECO_1 AS ENDERECO, BAIRRO, CIDADE, ESTADO, CEP, 
		DATA_DE_NASCIMENTO AS DATA_NASCIMENTO, IDADE, 
		GENERO, LIMITE_DE_CREDITO AS LIMITE_CREDITO, VOLUME_DE_COMPRA AS VOLUME_COMPRA, PRIMEIRA_COMPRA
		FROM SUCOS_FRUTAS.DBO.TABELA_DE_CLIENTES
		WHERE CPF <> '1471156710' AND CPF <> '19290992743' AND CPF <> '2600586709';
		
	• Sobre a tabela produtos -> script da tabela como -> INSERT para -> janela do editor de Nova Consulta
		- Aqui, a ideia é que o SQL já te forneça o código base para a inserção de uma nova base de dados mais extensa
		- Já caracteriza, inclusive todos os tipos das colunas, além de delimitá-las
