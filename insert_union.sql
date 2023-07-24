	- INSERT --> inserir uma nova coluna/dado dentro de uma tabela			
	- UNION - Unindo consultas - pegar consultar e sobrepor uma consulta por outras (número de linhas da primeira consulta e depois o número de linhas da secunda consulta...) --> respeitam o nome das colunas da primeira consulta. 
		- aplica o DISTINCT como resultado a união entre diferentes tabelas (quando existem valores repetidos)
		- UNION ALL --> não aplica o DISTINCT sobre o resultado esperado, unindo todas as linhas
		- número de campos selecionados de A tem que ser igual ao número de campos de B
		- tipo de campo deve ser equivalente
		Ø SELECT CLIENTE, CIDADE, ESTADO
			FROM CLIENTE
			UNION
		  SELECT FORNECEDOR, CIDADE, ESTADO
		  	FROM FORNECEDOR
	- utiliza-se uma sub query a partir do "FROM", com novas indicações com "SELECT"
	- quando a sub query é utilizada para muitas outras consultas --> VIEW; quando se quer armazenar uma "tabela virtual" em uma função.
		Ø  CREATE VIEW MEDIA_EMBALAGENS AS 
			SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO 
			FROM TABELA_DE_PRODUTOS 
			GROUP BY EMABALAGEM
			-- cria uma nova exibição como se a consulta feita, virasse uma tabela de verdade.
