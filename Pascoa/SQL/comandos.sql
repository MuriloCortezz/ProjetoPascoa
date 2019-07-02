-- SQL
	-- linguagem de consulta estruturada
-- comando de DDL
-- linguagem de defini√ß√£o de dados
create database pedidos_pascoa ;
use pedidos_pascoa;
create table pascoa(
-- chave primaria
-- c√≥digo unico dentro da tabela
cod            int primary key auto_increment,
nome_completo  varchar(100),
email          varchar(50),
telefone       varchar(20),
endereco       varchar(200),
cep            varchar(100),
valor 		   varchar(100),
ovos		   varchar(200),
entregue	   varchar(3),
data	       varchar(16)

);
--DML(Linguagem de manipulaÁ„o de dados)
-- insert - update - delete
insert into pascoa(
nome_completo,
email        ,
telefone     ,
endereco     ,
cep          ,
valor 		 ,
ovos		 ,
entregue	 ,
data	     )
/*value('Murilo', 'murilocortez@aceoco.ao', '35629902', 'taguatinga norte', '72155418');*/
-- consulta no banco de dados
select * from Pascoa;