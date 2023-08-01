5. Funções: procedimento para passar parâmetros com um resultado da função.
	- SELECT F(CAMPO) FROM TABELA --> aplica em todos os valores do campo da função [strings, datas, matemáticas, conversão de dados]
	- FUNÇÕES STRINGS:
		- LOWER --> retorna apenas caracteres minúsculos
		- UPPER --> retorna apenas caracteres maiúsculos
		- CONCAT --> retorna cadeia de caracteres resultante da junção de dois ou mais outros valores caracteres (string1, string2, string3)
		- RIGHT --> retorna a parte direita da função (string, n); n sendo os n útlimos caracteres da frase
		- LEFT --> retorna parte esquerda da função, com n sendo os primeiros n caracteres
		- REPLICATE --> repetir o valor de caracteres da função, com n sendo o numero de vezes repetidas (string1, n) = (string1string1)
		- SUBSTRING --> (expressão, start, lenght)
		- LTRIM --> remove caracteres como espaços, do início do texto (do lado esquerdo)
		- RTRIM 
		- REPLACE --> substituir ocorrências pela de sua preferência (string, string padrão [espaços], '-')
		- LEN --> quantidade de caracteres 
		Ø  SELECT NOME, SUBSTRING(NOME, 1, CHARINDEX(' ', 	NOME, 1)) AS PRIMEIRO_NOME
			FROM TABELA_DE_CLIENTES 
			-- primeiro nome dos clientes
	- FUNÇÕES DATAS:
		- DATEADD --> adiciona um número inteiro a um datepart; DATEADD (datepart, +/- 30, '2022-01-01'), adiciona 30 dias a mais, a partir da data inserida
		- DATEDIFF --> retorna um número de contagem, da diferença entre duas datas; DATADIFF (datepart, startdate, enddate), portanto, a variação entre fim e início
		- DATEPART --> retorna uma parte específica de uma data; de forma numérica
		- GETDATE --> data e hora do seu computador
		- ISDATE --> retorna 0 se a data não for válida e 1 se for
		- DATATIMEFROMPARTS --> retorna uma data específica 
	- FUNÇÕES NUMÉRICAS:
		- ROUND --> aproximação (número, aproximação em número de casa decimais)
		- CEILING --> aproximação para o menor inteiro, maior
		- FLOOR --> maior inteiro, menor ou igual ao número
		- POWER --> potência de um valor; POWER (2, 10) = 2^10
		- EXP --> elevação de (e) ==> EXP(10) = e^10
		- SQRT --> raíz quadrada
		- % --> calcula o resto da divisão por um número
		- LOG, LOG10
		Ø SELECT YEAR(DATA_VENDA) AS ANO, FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
				FROM NOTAS_FISCAIS NF
				INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
				WHERE YEAR(DATA_VENDA) = 2016
				GROUP BY YEAR(DATA_VENDA);
	- FUNÇÕES DE CONVERSÃO:
		- CONVERT --> conversão de data para texto; de INT para STR, a partir de uma numeração 
			101 - mm/dd/aaaa
			102 - mm.dd.aaaa
		- CAST --> conversão de números para números; INT para FLOAT...
			- conversões explícitas: sem necessidade de atribuir o tipo de dado
			- conversões implícitas: com necesSidade de atribuir o tipo de dado
		Ø SELECT CONVERT(VARCHAR(50), GETDATE(), 121)
			-- especifica a data e hora a partir de uma limitação de VARCHAR
			• Procurar entender qual o tipo de data inserida.	
		Ø SELECT NOME_DO_PRODUTO, CONCAT('O preço de lista é: ', CAST(PRECO_DE_LISTA AS VARCHAR (10))) AS PRECO FROM TABELA_DE_PRODUTOS
			• Necessidade de especificar o tipo de informação de deve ser retirada
		Ø SELECT 'O cliente ' + TC.NOME + ' comprou R$ ' + 
		TRIM(STR(SUM(INF.QUANTIDADE * INF.PRECO) ,10,2)) + ' no ano de ' + DATENAME(YEAR, NF.DATA_VENDA)
		FROM NOTAS_FISCAIS NF
		INNER JOIN ITENS_NOTAS_FISCAIS INF ON NF.NUMERO = INF.NUMERO
		INNER JOIN TABELA_DE_CLIENTES TC ON NF.CPF = TC.CPF
		WHERE YEAR(NF.DATA_VENDA) = '2016'
		GROUP BY TC.NOME, NF.DATA_VENDA;
			• Nessa query, a ideia era que o resultado expressasse uma oração de juntasse o valor total de compras, portanto, (preço * quantidade) , apenas no ano de 2016
