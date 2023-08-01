5. Controle de fluxo -> extensão da linguagem; com mais features do que ANSI
  - série de comandos de controle de fluxo
  - IF <expresão lógica> -- primeira sentença condicional
       <sentença SQL ou controle de bloco>
    ELSE -- resultado caso não se cumpra o IF
       <sentença SQL ou controle de bloco> 
  - expressão lógica que retorna TRUE ou FALSE -> qualquer sentrnaça que instrução venha do SQL
  - Controle de bloco: conjunto de instruções com BEGIN e END
  - -- IF evita que o script tenha erro
IF OBJECT_ID ('TABELA_TEST', 'U') IS NOT NULL
-- caso a função volte != nulo = tabela existe
DROP TABLE TABELA_TEST;
CREATE TABLE TABELA_TEST (
ID VARCHAR (10)
);
-- rodar de novo a query, dá erro 
DROP TABLE TEBELA_TEST
-- entender se a tabela existe ou não, se foi dropada manualmente ou não:
-- testa um objeto ou uma tabela -> (NOME DO OBJETO, TIPO DO OBJETO)
IF OBJECT_ID ('TABELA_TEST', 'U') IS NOT NULL;

6. IF incorporando valores de variáveis:
  
SELECT GETDATE()
SELECT DATENAME(WEEKDAY, GETDATE())
-- dia da semana, a partir de uma data a frente:
SELECT GETDATE(), DATEADD(DAY, 5, GETDATE())
-- nome do dia da semana, 5 dias a frente
SELECT DATENAME(WEEKDAY,  DATEADD(DAY, 5, GETDATE()))

-- script que se inicia uma variável numérica -> se o dia [semana] ou [fds]
DECLARE @DIA_SEMANA VARCHAR(20);
DECLARE @NUMERO_DIAS INT;

-- iniciar o número de dias como sendo t0:
SET @NUMERO_DIAS = 9;
SET @DIA_SEMANA = DATENAME(WEEKDAY,  DATEADD(DAY, @NUMERO_DIAS, GETDATE()));
PRINT @DIA_SEMANA;
-- descobrir se o dia em NUMERO_DIAS é um final de semana, ou dia de semana
IF @DIA_SEMANA = 'Domingo' or @DIA_SEMANA = 'Sábado'
	PRINT 'Este dia é fim de semana'
ELSE
	PRINT 'Este dia é dia de semana'

- 6.1. Modificação com UPDATE:
DECLARE @CPF VARCHAR(15);
DECLARE @IDADE_TABELA INT;
DECLARE @DATA_NASCIMENTO DATE;
DECLARE @IDADE INT;

SET @CPF = '1471156710';
SELECT @DATA_NASCIMENTO = [DATA DE NASCIMENTO], @IDADE_TABELA = IDADE FROM [TABELA DE CLIENTES] WHERE CPF = @CPF;
SET @IDADE = DATEDIFF(YEAR, @DATA_NASCIMENTO, GETDATE());
IF @IDADE_TABELA <> @IDADE UPDATE [TABELA DE CLIENTES] SET IDADE = @IDADE WHERE CPF = @CPF;

7. Controle de fluxos com SELECT -> a partir de um problema na TEBAL_DE_CLIENTE
- limite máximo de créito de um cliente
-- fazer os limites de crédito de cada bairro
SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] 
GROUP BY BAIRRO;
-- inicializar duas variáveis: nome do bairro e número de limite de crédito maximo e,
-- se o limite de créfito supera o limite de crédito máximo:
DECLARE @LIMITE_MAXIMO FLOAT;
DECLARE @LIMITE_ATUAL FLOAT;
DECLARE @BAIRRO VARCHAR(20);
-- inicializar as variáveis
SET @LIMITE_MAXIMO = 50000;
SET @BAIRRO = 'Água Santa';
SELECT @LIMITE_ATUAL = SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] 
WHERE BAIRRO = @BAIRRO
IF @LIMITE_MAXIMO >= @LIMITE_ATUAL  -- valor de Água Santa é 50.000 e valor max é 10.000
	PRINT 'VALOR ESTOUROU';
ELSE
	PRINT 'VALOR NÃO ESTOUROU';

8. WHILE: caso a condição seja verdadeira, segue o bloco de comandos
WHILE <expressão lógica> 
	<sentença SQL ou controle de bloco ou BREAK ou CONTINUE> 
- BREAK provoca uma saída do loop e CONTINUE faz com que o loop seja reiniciado (desde o princípio)
DECLARE @LIMITE_MINIMO INT;
DECLARE @LIMITE_MAXIMO INT;
DECLARE @NUM_LINHAS_MAX INT;
DECLARE @NUM_LINHAS_ESCRITAS INT;
-- inicializando as variáveis
SET @LIMITE_MINIMO = 3;
SET @LIMITE_MAXIMO = 30;
SET @NUM_LINHAS_MAX = 10; -- delimita o número de linhas em 10
SET @NUM_LINHAS_ESCRITAS = 0; -- sem linhas escritas, inicialmente
	PRINT 'Entrei no looping'
-- criação de um loop até ultrapassar o limite máximo
-- criar um BREAK em que o limite de linhas nçao ultrapasse 10:
WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO -- caso o numero de linhas não ultrapasse 10, ele retorna para essa posição
BEGIN
	PRINT @LIMITE_MINIMO;
	SET @NUM_LINHAS_ESCRITAS = @NUM_LINHAS_ESCRITAS + 1;
	IF @NUM_LINHAS_ESCRITAS = @NUM_LINHAS_MAX --- caso o limite chegue a 10
		BEGIN
			PRINT 'SAINDO DO LOOPING POR CAUSA DO BREAK';
			BREAK
		END
	SET @LIMITE_MINIMO = @LIMITE_MINIMO + 1;
END;
	PRINT 'Saí do looping';

- 8.1. -- declara as 3 variáveis
DECLARE @DATA_INICIAL DATE;
DECLARE @DATA_FINAL DATE;
DECLARE @NUMNOTAS INT -- número de notas=NUMERO em tabela de notas

SET @DATA_INICIAL = '20170101';
SET @DATA_FINAL = '20170110';
WHILE @DATA_INICIAL <= @DATA_FINAL
BEGIN
	SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS]
	WHERE DATA = @DATA_INICIAL
	PRINT CONVERT(VARCHAR(10), @DATA_INICIAL) + '-->'
	+ CONVERT(VARCHAR(10), @NUMNOTAS)
	SELECT @DATA_INICIAL = DATEADD(DAY, 1, @DATA_INICIAL)
END




