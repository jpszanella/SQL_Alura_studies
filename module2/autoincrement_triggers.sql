	7. Autoincremento, padrões e Triggers.
		Ø Autoincremento -> incrementa, de forma automática um sequencial numérico, em determinado campo (deve ser um campo inteiro, portanto)
			- INSERT INTO TABELA (DESCRITOR) VALUES ('X') -> um campo de autoincremento, com tabela vazia, grava os registros de maneira decrescente (1 - X, 2 - Y, 3 - Z, ...); sem necessidade de especificar o valor do campo autoincremento.
			- Sequência numérica que cresce, à medida que novas linhas entram -> mesmo com exclusão de elementos
			- IDENTITY [(INÍCIO, INCREMENTO)] -> especificando o valor inicial e o incremento sendo (início + incremento)
			
			Ø CREATE TABLE TAB_IDENTITY (
			ID INT IDENTITY (1,1) NOT NULL,
			DESCRITOR VARCHAR (20) NULL
			);
			
			SELECT * FROM TAB_IDENTITY	
			
			INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE X')
			-- valor do ID = 1 foi colocado de forma automática
			INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE Y')
			INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE Z')
			INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE W')
			INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE A')
			
			DELETE FROM TAB_IDENTITY WHERE ID = 1
			
			INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE B')
			-- como o incremento só aumenta, mesmo deletendo o um valor, o valor de ID será sempre maior
		Ø Trigger: tipo especial de procedimento que fica armazenado num banco de dados e é executado automaticamente quando um determinado
			- Supondo duas tabelas diferentes e que haja uma trilha entre as tabelas -> qualquer alteração na tabela da direita, manifesta uma nova alteração na tabela da esquerda
			Ø CREATE TRIGGER <nome da trigger> -- trilha executada 
			ON <nome da tabela> [FOR/AFTER/INSTEAD OF] [INSERT/UPDATE/DELETE] -- momento de execução
			AS
			<corpo da trigger> 
			- FOR: executa ao mesmo tempo que o comando 
			- AFTER: executa após o comando
			- INSTEAD OF: substitui o comando
			CREATE TABLE TAB_FATURAMENTO (
			DATA_VENDA DATE NULL,
			TOTAL_VENDA FLOAT
			); -- baseada nas tabelas de vendas e itens vendidos
