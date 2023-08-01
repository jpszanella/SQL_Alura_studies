11. Tabelas temporárias:
- tabelas que existem de forma temporária {#, ##, @} 
  - # -> tabela vale apenas para a conexão trabalhada (consulta única)
  - ## -> aparecem em todas as conexões (em qualquer consulta, antes de encerrar a conexão)
  - @ -> vale durante um conjunto de comandos TSQL (existe durante uma execução)
  - são criadas em memória 
- 11.1: Tabela temporárias como variáveis
  - utilizando um scrips antigo:
-- determinar numero inicial e final da minha sequência
DECLARE @NUMERO_INICIAL INT;
DECLARE @NUMERO_FINAL INT;
-- saber se um valor de nota fiscal está no intervalo máximo ou mínimo
DECLARE @TESTE_NOTA_FISCAL INT; 
DECLARE @TABELA_DE_NUMEROS TABLE ([NUMERO] INT,
[STATUS] VARCHAR(20)) -- declarar uma variável do tipo TABLE requer a utilização de seus parâmetros/campos
CREATE TABLE #TABELA_DE_NUMEROS ( -- criação da segunda tabela temporária
([NUMERO] INT,
[STATUS] VARCHAR(20));
SET @NUMERO_INICIAL = 1;
SET @NUMERO_FINAL = 200;
-- while enquanto o valor não super o valor final
WHILE @NUMERO_INICIAL <= @NUMERO_FINAL
BEGIN
	-- teste inicial para ver se o numero inicial EXISTE na tabela de NOTAS FISCAIS
	 SELECT @TESTE_NOTA_FISCAL = COUNT(*) FROM [NOTAS FISCAIS] WHERE NUMERO = @NUMERO_INICIAL
		IF @TESTE_NOTA_FISCAL = 1
      BEGIN
			  INSERT INTO @TABELA_DE_NUMEROS ([NUMERO], [STATUS]) -- inserir valores na tabela temporária
			  VALUES (@NUMERO_INICIAL, 'É NOTA FISCAL')
        INSERT INTO #TABELA_DE_NUMEROS ([NUMERO], [STATUS]) -- insert duplicado (inserir dados na outra tabela temp)
			  VALUES (@NUMERO_INICIAL, 'É NOTA FISCAL')
      END;
		ELSE
      BEGIN
			  INSERT INTO @TABELA_DE_NUMEROS ([NUMERO], [STATUS]) -- inserir valores na tabela temporária
			  VALUES (@NUMERO_INICIAL, 'NÃO É NOTA FISCAL')
        INSERT INTO #TABELA_DE_NUMEROS ([NUMERO], [STATUS]) -- insert duplicado (inserir dados na outra tabela temp)
			  VALUES (@NUMERO_INICIAL, 'NÃO É NOTA FISCAL'
      END;
		    SET @NUMERO_INICIAL = @NUMERO_INICIAL + 1 -- incremento
END;
SELECT * FROM #TABELA_DE_NUMEROS; -- processo só roda uma vez (somente com o script)
