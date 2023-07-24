	5. Alteração de dados existentes em uma tabela
		Ø UPDATE <nome da tabela> SET <nome do campo> = <valor>, ..., <nome do campo> = <valor> WHERE <condição> 
			§ Importante inserir a cláusula WHERE por alterar apenas um grupo seleto de dados -> restrição de alteração
			
		Ø -- dar um update em um preço do suco '104010'
		UPDATE PRODUTOS SET PRECO_LISTA = 5
		WHERE CODIGO = '1040107'
		-- apenas uma linha será afetada por conta do WHERE (novo preço de lista)
		
		SELECT * FROM PRODUTOS -- selecionando produtos com nome 'Manga'
		WHERE SABOR = 'Manga'
		
		UPDATE PRODUTOS SET PRECO_LISTA = PRECO_LISTA * 1.10
		WHERE SABOR = 'Manga' -- alteração de múltiplas linhas 
		
		-- alteração de mais de um campo (alteração do tamanho e descritor)
		SELECT DESCRITOR, replace(DESCRITOR, '350ml', '550ml') FROM PRODUTOS 
		WHERE TAMANHO = '350ml'; --replace (variável, valor atual, novo valor)
		
		UPDATE PRODUTOS SET DESCRITOR = replace(DESCRITOR, '350ml', '550ml'),
		TAMANHO = '550ml' -- valores alterados, somente, onde o tamannho for de 350 ml
		WHERE TAMANHO = '350ml';
		- Utilizando UPDATE com FROM -> sincronizar a nossa tabela, com uma tabela de outro banco de dados.
		Ø -- alteração na SUCOS_FRUTAS
		UPDATE SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS SET PRECO_DE_LISTA = PRECO_DE_LISTA *1.20
		-- valor que está em outra base de dados, será transeferido para a atual base
		-- INNER JOIN que mostre o código e o preço de lista de duas tabelas
		SELECT 
		A.CODIGO AS CODIGO_MINHA_TABELA, A.PRECO_LISTA AS PRECO_MINHA_TABELA,
		B.CODIGO_DO_PRODUTO AS CODIGO_TABELA_APOIO,
		B.PRECO_DE_LISTA AS PRECO_TABELA_APOIO
		FROM PRODUTOS A
		INNER JOIN SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS B ON 
		A.CODIGO = B.CODIGO_DO_PRODUTO

	II)	Ø UPDATE A SET A.PRECO_LISTA = B.PRECO_DE_LISTA-- alteração da tabela produtos
		FROM PRODUTOS A
		INNER JOIN SUCOS_FRUTAS.DBO.TABELA_DE_PRODUTOS B ON 
		A.CODIGO = B.CODIGO_DO_PRODUTO -- igualando os dois preços de A e B

III) Ø Utilizando MERGE
			§ MERGE <tabela que gostaria de se alterar> USING <tabela de referência> 
			ON <clausula de referência> = <clausula de referência> 
			WHEN MATCHED THEN -- quando valores forem iguais
			UPDATE SET <clausula de referência 2> = <clausula de referência 2> 
			
		Ø Excluindo dados de uma tabela -> apenas quando não há uma referência de primary  ou foreign key
			§ DELETE FROM <nome da tabela> WHERE (<condição>)

