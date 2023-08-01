 9. Consultas para inserir registros em uma tabela
- Notas fiscais - dados do cabeçalho da nota fiscal -> NUMERO (incremento de 1 em 1)
- numero inteiro qualquer (n) é um numero de nota fiscal? -> tabela de resultado (percorrendo valores e uma outra tabela)
-- criação da tabela de resultados da consulta
-- programa será rodado várias vezes -> caso a tabela já exista
IF OBJECT_ID('TABELA DE NUMEROS', 'U') IS NOT NULL 
DROP TABLE [TABELA DE NUMEROS];
CREATE TABLE [TABELA DE NUMEROS] (
[NUMERO] INT,
[STATUS] VARCHAR(20)
);
-- determinar numero inicial e final da minha sequência
DECLARE @NUMERO_INICIAL INT;
DECLARE @NUMERO_FINAL INT;
-- saber se um valor de nota fiscal está no intervalo máximo ou mínimo
DECLARE @TESTE_NOTA_FISCAL INT; 

SET @NUMERO_INICIAL = 1;
SET @NUMERO_FINAL = 200;
-- while enquanto o valor não super o valor final
WHILE @NUMERO_INICIAL <= @NUMERO_FINAL
BEGIN
	-- teste inicial para ver se o numero inicial EXISTE na tabela de NOTAS FISCAIS
	 SELECT @TESTE_NOTA_FISCAL = COUNT(*) FROM [NOTAS FISCAIS] WHERE NUMERO = @NUMERO_INICIAL
		IF @TESTE_NOTA_FISCAL = 1
			INSERT INTO [TABELA DE NUMEROS]([NUMERO], [STATUS]) 
			VALUES (@NUMERO_INICIAL, 'É NOTA FISCAL')
		ELSE
			INSERT INTO [TABELA DE NUMEROS]([NUMERO], [STATUS]) 
			VALUES (@NUMERO_INICIAL, 'NÃO É NOTA FISCAL')
		SET @NUMERO_INICIAL = @NUMERO_INICIAL + 1 -- incremento
END;
