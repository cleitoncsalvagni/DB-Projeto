create table cidade(
 idCidade int not null,
 nome varchar,
constraint pk_cidade primary key(idCidade)
);
create table fornecedor(
 cnpj varchar not null,
 razaoSocial varchar,
 endereco varchar,
 idCidade int,
constraint pk_fornecedor primary key(cnpj),
constraint fk_fornecedor_cidade foreign key
 (idCidade) references cidade (idCidade)
); 
create table cliente(
 codigo int not null,
 nome varchar,
 endereco varchar,
 idCidade int,
constraint pk_cliente primary key(codigo),
constraint fk_cliente_cidade foreign key
 (idCidade) references cidade (idCidade)
);
create table produto(
 codigo int not null,
 descricao varchar,
 estoque int,
 valor real,
 cnpjFornecedor varchar,
constraint pk_produto primary key(codigo),
constraint fk_produto_forncedor foreign key(cnpjFornecedor)
references fornecedor(cnpj)
);
create table nota(
 numero int not null,
 data date,
 tipo_pagamento varchar,
 codigoCliente int,
constraint pk_nota primary key(numero),
constraint fk_nota_cliente foreign key(codigoCliente)
references cliente(codigo)
);
create table item(
 numero_nota int,
 codigo_produto int,
 qtde int,
constraint pk_item primary key(numero_nota,codigo_produto),
constraint fk_item_nota foreign key(numero_nota)
references nota(numero),
constraint fk_item_produto foreign key(codigo_produto)
references produto(codigo)
);
--inserindo no banco
insert into cidade values(1,'marilia');
insert into cidade values(2,'bauru');
insert into fornecedor values('17624092000185','Alpha Soluções em Informática','Rua 9 de
Julho, 738',1);
insert into fornecedor values('47132482000176','MicroSystem Informática','Av. da
Saudade, 98',2);
insert into fornecedor values('56021482000112','J.W. Sistemas','Rua Paes Leme, 172',1);
insert into fornecedor values('27385372000136','ADABAS S/A','Rua 9 de Julho, 829',1);
insert into Cliente values(1,'Francisco Santos','Rua XV de Novembro, 16',null);
insert into Cliente values(2,'Claudete Pereira','Av. da Saudade, 98',null);
insert into Cliente values(3,'José Souza','Rua das Bromélias, 871',null);
insert into Cliente values(4,'Sônia Santos Oliveira ','Rua 9 de Julho, 829',2);
insert into produto values(100,'Micro Pentium IV',14,850.00,'56021482000112');
insert into produto values(200,'Impressora EPSON', 8,280.00,'27385372000136');
insert into produto values(300,'Scanner Genius', 9,190.00,null);
insert into produto values(400,'Disquete 3M', 30,10.00,'17624092000185');
insert into nota values(1001,'18-05-2002','a vista',2);
insert into nota values(2002,'18-05-2002','a vista', null);
insert into nota values(3003,'19-05-2002','a prazo', 4);
insert into nota values(4004,'20-05-2002','a vista', 3);