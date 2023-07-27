1. Declaração de variáveis: objetivo de atribuição de valores
  - DECLARE <nome da variável> <tipo da variável>; nome único dentro do programa
  - <nome da variável> deve se iniciar com um @ -> @<nome da variável>
  - tipo de uma variável pode ser, além de todos do SQL server, do tipo TABELA
  - atribuição de um valor através de SET ou através de um SELECT
  1.1. Praticando atribuição de valores:
    - DECLARE @MATRICULA VARCHAR (5); -- declaração como se fosse coluna da tabela
      DECLARE @NOME VARCHAR (100);
      DECLARE @PERCENTUAL FLOAT;
      DECLARE @DATA DATE;
      DECLARE @FERIAS BIT;
      DECLARE @BAIRRO VARCHAR(50);
      -- variáveis que podem ser usadas no script seguinte
      -- ';' não sendo obrigatório, mas recomendável
  1.2. Atribuindo valores a variáveis:
    - SET @MATRICULA = '00240';
      SET @NOME = 'Claúdia Rodrigues';
      SET @PERCENTUAL = 0.10;
      SET @DATA = '2012-03-12';
      SET @FERIAS = 1;
      SET @BAIRRO = 'Jardins';
  1.3. Visualizando variáveis: ajudar a se guiar no programa
    - PRINT @MATRICULA 
      PRINT @NOME
      PRINT @PERCENTUAL
      PRINT @DATA
      PRINT @FERIAS
      PRINT @BAIRRO
      -- exibe o valor da variável, no campo de mensagens

2. 1. Atribuição de valor para uma variável
DECLARE @MATRICULA VARCHAR (5); -- declaração como se fosse coluna da tabela
      DECLARE @NOME VARCHAR (100);
      DECLARE @PERCENTUAL FLOAT;
      DECLARE @DATA DATE;
      DECLARE @FERIAS BIT;
      DECLARE @BAIRRO VARCHAR(50);
 SET @MATRICULA = '00240';
      SET @NOME = 'Claúdia Rodrigues';
      SET @PERCENTUAL = 0.10;
      SET @DATA = '2012-03-12';
      SET @FERIAS = 1;
      SET @BAIRRO = 'Jardins'
PRINT @MATRICULA 
      PRINT @NOME
      PRINT @PERCENTUAL
      PRINT @DATA
      PRINT @FERIAS
      PRINT @BAIRRO
INSERT INTO [TABELA DE VENDEDORES] -- inserindo novos valores para os parâmetros declarados
(MATRICULA, NOME, [PERCENTUAL COMISSÃO], [DATA ADMISSÃO], [DE FERIAS], BAIRRO)
VALUES -- valores armazenados nos elementos declarados
(@MATRICULA, @NOME, @PERCENTUAL, @DATA, @FERIAS, @BAIRRO)
PRINT 'UM VENDEDOR INCLUÍDO'
SET @MATRICULA = '00244';
      SET @NOME = 'Roberta Araujo';
PRINT @MATRICULA 
      PRINT @NOME
      PRINT @PERCENTUAL
      PRINT @DATA
      PRINT @FERIAS
      PRINT @BAIRRO
INSERT INTO [TABELA DE VENDEDORES] -- repete-se o código por haver uma nova paramerização, com outro dado
(MATRICULA, NOME, [PERCENTUAL COMISSÃO], [DATA ADMISSÃO], [DE FERIAS], BAIRRO)
VALUES -- valores armazenados nos elementos declarados
(@MATRICULA, @NOME, @PERCENTUAL, @DATA, @FERIAS, @BAIRRO)
PRINT 'UM VENDEDOR INCLUÍDO'

SELECT * FROM [TABELA DE VENDEDORES]
