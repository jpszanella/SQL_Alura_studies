	- Apresentação do problema a ser resolvido:
		○ Para cada itens nota fiscal, há uma relação entre notas fiscais e quantidade
		○ Cliente relaciona-se com o numero 
		○ Volume de compra = quantidade de produtos comprados, sem limite de compras dos clientes
		○ A ideia é encontrar quais clientes compraram mais do que o volume de compras delimitado por eles? 
	I) Calcular o volume de venda, por clientes (selecionar a data da venda e a quantidade vendida e o CPF)
		Ø SELECT NF.CPF, NF.DATA_VENDA, INF.QUANTIDADEE
			FROM NOTAS_FISCAIS NF 
			INNER JOIN ITENS_NOTAS_FICAIS INF ON NF.NUMERO.NUMERO = INF.NUMERO
		-- quantidade por cada CPF, por data.
	II) Escrever a data com 7 caracteres, somente:
		Ø SELECT 
			NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO, INF.QUANTIDADE
			FROM NOTAS_FISCAIS NF 
			INNER JOIN ITENS_NOTAS_FICAIS INF ON NF.NUMERO.NUMERO = INF.NUMERO
	III) Quantidade total deve ser agrupado, para ter o controle do volume total
		Ø SELECT
			NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO, 
			SUM (INF.QUANTIDADE) AS QUANTIDFADE_TOTAL
			FROM NOTAS_FISCAIS NF 
			INNER JOIN ITENS_NOTAS_FICAIS INF ON NF.NUMERO.NUMERO = INF.NUMERO
			GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO
	IV) Passamos a olhar a tabela de clientes agora e comparar o CPF com um NOME e o VOLUME DE COMPRA
		Ø SELECT CPF, NOME, VOLUME_DE_COMPRA 
			FROM TABELA_DE_CLEINTES
	V) Utilização de subqueries que consigam englobar esses valores:
		Ø SELECT
			TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL
			FROM TABELA_DE_CLIENTES 
			INNER JOIN (
				SELECT 
				NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO, 
				SUM (INF.QUANTIDADE) AS QUANTIDFADE_TOTAL
				FROM NOTAS_FISCAIS NF 
				INNER JOIN ITENS_NOTAS_FICAIS INF ON NF.NUMERO.NUMERO = INF.NUMERO
				GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
				) AS TV
			ON TV.CPF = TC.CPF
	VI) Utilizaremos, agora, um parâmetro de classificação para buscar os limites de quantidade total comprada, em função do cpf dos indivíduos e o volume de compra limite
		SELECT 
			TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA, TV.MES_ANO, TV.QUANTIDADE_TOTAL,
			(CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL  THEN 'VENDAS VÁLIDAS'
			ELSE 'VENDAS INVÁLIDAS'
			END) AS RESULTADO
			FROM TABELA_DE_CLIENTES TC 
			INNER JOIN
				(
				SELECT
				NF.CPF
				,CONVERT(VARCHAR(7), NF.DATA_VENDA,120) AS MES_ANO
				,SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
				FROM NOTAS_FISCAIS NF
				INNER JOIN ITENS_NOTAS_FISCAIS INF
				ON NF.NUMERO = INF.NUMERO
				GROUP BY 
				NF.CPF
				, CONVERT(VARCHAR(7), NF.DATA_VENDA,120)
				) TV
			ON TV.CPF = TC.CPF;
			WHERE TV.MES_ANO = '2015-01' 

