	6. Outro problema apresentado:
		- Usuário quer ver as vendas anuais com sucos de frutas, por sabor
		- Apresentar o relatório de maior e menor venda 
		- QUANTIDADE, DATA_VENDA, SABOR (procurar esses 3 campos em 3 tabelas diferentes.
	I) Realizar um INNER JOIN entre 3 tabelas:
		SELECT 
			TP.SABOR
			,NF.DATA_VENDA
			,INF.QUANTIDADE
			FROM TABELA_DE_PRODUTOS TP
			INNER JOIN ITENS_NOTAS_FISCAIS INF
			ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
			INNER JOIN NOTAS_FISCAIS NF
ON INF.NUMERO = NF.NUMERO
	II) Filtrar a venda específica por cada ano:
		SELECT 
			TP.SABOR
			,YEAR(NF.DATA_VENDA) AS ANO
			,SUM(INF.QUANTIDADE) AS VENDA_ANO
			FROM TABELA_DE_PRODUTOS TP
			INNER JOIN ITENS_NOTAS_FISCAIS INF
			ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
			INNER JOIN NOTAS_FISCAIS NF
			ON INF.NUMERO = NF.NUMERO
			WHERE YEAR(NF.DATA_VENDA) = 2015
			GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
			ORDER BY SUM(INF.QUANTIDADE) DESC
    -- o resultado será o de 'vendas parciais'
	III) Necessidade de inserir um percentual da venda atual, com a venda anual:
		Ø Calcular o total: selecionar a quantidade da tabela INF e a DATA_VENDA
		SELECT 
			YEAR(NF.DATA_VENDA) AS ANO
			, SUM(INF.QUANTIDADE) VENDA_TOTAL_ANO
			FROM NOTAS_FISCAIS NF
			INNER JOIN ITENS_NOTAS_FISCAIS INF
			ON NF.NUMERO = INF.NUMERO
			WHERE YEAR(NF.DATA_VENDA) = 2015
GROUP BY YEAR(NF.DATA_VENDA
    -- resultado será o de vendas totais
	IV) Pegar as quantidade de vendas, por sabor e inserir em uma mesma tabela o VALOR_TOTAL_ANO
			
		Ø SELECT 
			VS.SABOR
			, VS.ANO
			, VS.VENDA_ANO
			, VA.VENDA_TOTAL_ANO
			FROM
			(SELECT -- subquery referente as quanbtidades individuais somadas, de cada produto
			TP.SABOR
			,YEAR(NF.DATA_VENDA) AS ANO
			,SUM(INF.QUANTIDADE) AS VENDA_ANO
			FROM TABELA_DE_PRODUTOS TP
			INNER JOIN ITENS_NOTAS_FISCAIS INF
			ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
			INNER JOIN NOTAS_FISCAIS NF
			ON INF.NUMERO = NF.NUMERO
			WHERE YEAR(NF.DATA_VENDA) = 2015
			GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
			) VS
			INNER JOIN 
			(SELECT -- subquery referente as vendas totais, em função de uma mesma/única tabela
			YEAR(NF.DATA_VENDA) AS ANO
			, SUM(INF.QUANTIDADE) VENDA_TOTAL_ANO
			FROM NOTAS_FISCAIS NF
			INNER JOIN ITENS_NOTAS_FISCAIS INF
			ON NF.NUMERO = INF.NUMERO
			WHERE YEAR(NF.DATA_VENDA) = 2015
			GROUP BY YEAR(NF.DATA_VENDA)
			) VA
			ON VS.ANO = VA.ANO
ORDER BY VS.VENDA_ANO DESC; -- ordenar a query principal em caráter descrescente
	V) Organizando o valor de forma percentual (VP/VT) * 100:
		Ø SELECT 
			VS.SABOR
			, VS.ANO
			, VS.VENDA_ANO
			, VA.VENDA_TOTAL_ANO
			, (VS.VENDA_ANO / VA.VENDA_TOTAL_ANO) * 100 AS PERCENTUAL -- não da certo
			, ROUND (CONVERT(FLOAT, VS.VENDA_ANO) / (CONVERT(FLOAT, VA.VENDA_TOTAL)) * 100, 2) -- valores criados com números inteiros (int/int < 1) -> valores = 0 
			FROM -- retorna o percentual exato, arredondado, com valores de venda total e parcial
			(SELECT 
			TP.SABOR
			,YEAR(NF.DATA_VENDA) AS ANO
			,SUM(INF.QUANTIDADE) AS VENDA_ANO
			FROM TABELA_DE_PRODUTOS TP
			INNER JOIN ITENS_NOTAS_FISCAIS INF
			ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
			INNER JOIN NOTAS_FISCAIS NF
			ON INF.NUMERO = NF.NUMERO
			WHERE YEAR(NF.DATA_VENDA) = 2015
			GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
			) VS
			INNER JOIN 
			(SELECT 
			YEAR(NF.DATA_VENDA) AS ANO
			, SUM(INF.QUANTIDADE) VENDA_TOTAL_ANO
			FROM NOTAS_FISCAIS NF
			INNER JOIN ITENS_NOTAS_FISCAIS INF
			ON NF.NUMERO = INF.NUMERO
			WHERE YEAR(NF.DATA_VENDA) = 2015
			GROUP BY YEAR(NF.DATA_VENDA)
			) VA
			ON VS.ANO = VA.ANO
ORDER BY VS.VENDA_ANO DESC
