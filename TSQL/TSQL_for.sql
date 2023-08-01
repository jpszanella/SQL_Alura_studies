10. Controle de fluxo - FOR (variável variando de um número a outro número)
- não existe no TSQL -> fazer uma simulação através do WHILE
FOR i = 1 TO 100 <comandoS>  
  NEXT
OU
SET i = 1; -- variável que começa em i = 1 e limita=se a 100
WHILE i <= 100 -- mesma estrutura de FOR
BEGIN   
  <comandos>
  SET i = i + 1
END;
- 10.1: Simulando FOR com WHILE
-- variar i de 1 a 100
DECLARE @i INT;
SET @i = 1;
WHILE @i <= 100
BEGIN
  PRINT @i;
  SET @i = @i + 1
END
