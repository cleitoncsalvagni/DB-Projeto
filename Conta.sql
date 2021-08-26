/* drop schema if exists teste cascade;
create schema teste;
drop table if exists teste.conta;
create table teste.conta(
  id integer primary key,
  cliente varchar(255) not null,
  saldo numeric(15,2) default 0
);

insert into teste.conta(id,cliente,saldo)
values(1,'JOAO',1000),
(2,'PEDRO',15000),
(3,'MARIO',450),
(4,'JOAQUIM',40000); */

select * from teste.conta where id = 1

begin;
update teste.conta set saldo = 120 where id=1;
rollback;

select * from teste.conta where id = 1



begin;
update teste.conta set saldo = 120 where id=1;
savepoint savepoint_1;
update teste.conta set saldo = saldo - 1000 where id=2;
select * from teste.conta where id = 2;
rollback to savepoint_1;
select * from teste.conta where id = 2;
commit;

select * from teste.conta where id = 1;

  /* Exemplo de Dirty Read */
  
-- TRANSAÇÃO A
begin;
update teste.conta set cliente = 'JOAO II' where id = 1;
select * from teste.conta where id = 1;
rollback;

-- TRANSAÇÃO B
begin;
update teste.conta set saldo = 380 where cliente = 'JOAO';
commit;


  /* Exemplo de Nonrepeatable Read */
  
-- TRANSAÇÃO A
begin;
update teste.conta set cliente = 'JOAO II' where id = 1;
commit

-- TRANSAÇÃO B
begin;
update teste.conta set saldo = 350 where cliente = 'JOAO II'
commit

  /* Exemplo de Phantom Read */
  
-- TRANSAÇÃO A
begin
insert into teste.conta(id,cliente,saldo) values (5,'NOVO CLIENTE',503)
commit

-- TRANSAÇÃO B
begin
select * from teste.conta
commit

  /* Exemplo de Isolamento */
  
-- TRANSAÇÃO A
begin
update teste.conta set saldo = 120 where id = 1
commit

-- TRANSAÇÃO B
BEGIN
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
SELECT * FROM teste.conta WHERE ID = 1
commit