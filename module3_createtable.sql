MÓDULO 3 - Manipulação de bancos de dados - Criação de novas tabelas e importação de bancos de dados;
	- Técnicas para se transformar o mini mundo, no mundo real 
	- Criação de um banco de dados tem como requisitos: regras de negócio do processo operacional, efetuar atividades de entrevistas e reuniões e desenhar o modelo mais fiel à realidade.
	- Cardinalidades: adaptação de acordo com o mundo real
		○ 1:N --> quando um elemento está englobado em um só conjunto (cidade - estado)
		○ N:M --> quando elementos não possuem restrições; ou ligações diretas.
	- Forma normal de relacionamento -->  relacionamento entre diferentes tabelas, a partir da comunicação delas em foreign keys [entidades e atributos]
	- String --> identificador do tipo de texto dos dados (ver tamanho máximo, se aceita caracteres especiais, aceita campo vazio ou nulo, não ter valor nenhum...) // Valor, Datas, Lógico

	1. Criando um Banco de Dados
		• Criação local de uma no nova database - arquivos lineares e log (armazenamento de dados) [CREATE DATABASE]
		Ø CREATE DATABASE [VENDAS SUCOS 2] -- arquivo de dados
		ON (
		NAME = 'VENDAS_SUCOS_2_DAT',
		FILENAME = 'C:\Database\VENDAS_SUCOS_02.MDF', -- criação de um diretório diferente do padrão
		SIZE = 10, -- tamanho do arquivo
		MAXSIZE = 50, -- tamanho máximo do arquivo
		FILEGROWTH = 5 -- crescimento de 5 em 5 mega
		) -- finalização do arquivo de dados
				-- limitação do arquivo ao que está restrito ()
		LOG ON ( -- arquivo logístico
		NAME = 'VENDAS_SUCOS_2_LOG',
		FILENAME = 'C:\Database\VENDAS_SUCOS_02.LDF', -- criação de um diretório diferente do padrão
		SIZE = 10, -- tamanho do arquivo
		MAXSIZE = 50, -- tamanho máximo do arquivo
		FILEGROWTH = 5 
		);
