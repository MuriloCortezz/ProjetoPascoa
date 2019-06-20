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
email          varchar(20),
telefone       varchar(20),
endereco       varchar(5),
cep            varchar(5)

);
--DML(Linguagem de manipulaÁ„o de dados)
-- insert - update - delete
insert into pascoa(
nome_completo,
email        ,
telefone     ,
endereco     ,
cep          )
value('Murilo', 'murilocortez@aceoco.ao', '35629902', 'taguatinga norte', '72155418');
-- consulta no banco de dados
select * from Pascoa;