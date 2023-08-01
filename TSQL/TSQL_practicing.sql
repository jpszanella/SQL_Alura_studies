- Montar um relatório com NOME, CPF e VALOR TOTAL ($), em um determinado mês
- Necessária utilização de tabelas temporárias na realização da atividade 
-- declarando as variáveis para minha tabela temporária
DECLARE @CPF VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_CLIENTES INT;
DECLARE @I INT;
DECLARE @MES INT, @ANO INT;
DECLARE @TOTAL_VENDAS FLOAT;

SET @MES = 1;
SET @ANO = 2015;
SELECT @NUMERO_CLIENTES = COUNT(*) FROM [TABELA DE CLIENTES];
SET @I = 1;
WHILE @I <= @NUMERO_CLIENTES
BEGIN
        SELECT @CPF = X.CPF, @NOME = X.NOME
        FROM ( SELECT Row_Number() Over (Order By CPF) as RowNum, * FROM [TABELA DE CLIENTES]) X
        WHERE X.RowNum = @I;

                SELECT 
                @TOTAL_VENDAS = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PREÇO])
                FROM [NOTAS FISCAIS] 
                INNER JOIN [ITENS NOTAS FISCAIS] -- consulta de quantidade total vendida
                ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
                WHERE [NOTAS FISCAIS].CPF = @CPF
                AND YEAR([NOTAS FISCAIS].DATA) = @ANO AND MONTH([NOTAS FISCAIS].DATA) = @MES;

        PRINT 'Vendas para ' + @CPF + ' - ' + @NOME + ' NO MÊS ' + CONVERT(VARCHAR(2), @MES) + ' E ANO ' + CONVERT(VARCHAR(4),@ANO) + ' FOI DE ' TRIM(STR(@TOTAL_VENDAS, 15, 2));
        SET @I = @I + 1;
END;
