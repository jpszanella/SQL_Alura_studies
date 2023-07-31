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

  6.1. Modificação com UPDATE:
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
