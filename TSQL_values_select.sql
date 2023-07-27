3. Atribuição de valores de variáveis através do SELECT 
DECLARE @CPF VARCHAR (50);
DECLARE @NOME VARCHAR (100);
DECLARE @DATA_NASCIMENTO DATE;
DECLARE @IDADE INT;
DECLARE @SAIDA VARCHAR(100); 

SET @SAIDA = 'O primeiro nome do cliente' + @NOME ', cujo CFP é' + @CPF + ', corresponde a ' + SUBSTRING(@NOME, 1, CHARINDEX(' ', @NOME) -1)

SET @CPF = '19290992743'
  
SELECT @NOME = NOME, @DATA_NASCIMENTO = [DATA DE NASCIMENTO], @IDADE = IDADE 
FROM [TABELA DE CLIENTES] WHERE CPF = @CPF
  
PRINT 'O primeiro nome do cliente' + @NOME ', cujo CFP é' + @CPF + ', corresponde a ' + SUBSTRING(@NOME, 1, CHARINDEX(' ', @NOME) -1)
PRINT @DATA_NASCIMENTO; -- utilização da variável, envés do campo
PRINT @IDADE;

SELECT * FROM [TABELA DE CLIENTES] WHERE CPF = '19290992743'
-- substituir o valor do nome pelo valor da variável:
SELECT * FROM [TABELA DE CLIENTES] WHERE CPF = @CPF -- iguala ao campo que é VARCHAR
-- para realocar os valores das tabelas às variáveis declaradas:
SELECT @NOME = NOME, @DATA_NASCIMENTO = [DATA DE NASCIMENTO], @IDADE = IDADE 
FROM [TABELA DE CLIENTES] WHERE CPF = @CPF
PRINT @NOME;
PRINT @DATA_NASCIMENTO;
PRINT @IDADE;

 -- a mudança de cpf, em @CPF, altera os valores do print
'1471156710' 
'19290992743'
'2600586709'

4. Criação de uma função que englobe os valores declarados, e novos parâmetros:
CHARINDEX('caracter', coluna) = procura um determinado caracter/conjunto e retorna a posição do caracter
sempre retorna um valor inteiro -> em função da ordem das letras [1, 2, 3... n]
SUBSTRING(coluna, posição inicial,  = retira parte de um texto, de um texto maior
SELECT NOME, CHARINDEX(' ', NOME), SUBSTRING(NOME, 1, CHARINDEX(' ', NOME) -1)
-- (-1) retorna o até o valor antes do espaço entre nomes 
FROM [TABELA DE CLIENTES]


  3.1. Exercício -> encontrar o total de notas do dia '01/01/2017'
DECLARE @NUMNOTAS INT;
SET @NUMNOTAS = 01/01/2017

SELECT @NUMNOTAS = COUNT(*) FROM [NOTAS FISCAIS]
WHERE DATA = '20170101'
PRINT @NUMNOTAS
'74'
