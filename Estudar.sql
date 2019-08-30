drop database clinica;
create database clinica;

use clinica;

create table tbl_ambulatorio(
nroa int primary key, 
andar numeric(3) not null, 
capacidade smallint
);

create table tbl_medicos(
codm int primary key, 
nome varchar(40) not null, 
idade smallint not null, 
especialidade char(20), 
CPF numeric(11) unique, 
cidade varchar(30),
nroa int 
references tbl_ambulatorio(nroa)
);  

create table tbl_pacientes(
codp int primary key, 
nome varchar(40) not null, 
idade smallint not null,
cidade char(30), 
CPF numeric(11) unique, 
doenca varchar(40) not null
);

create table tbl_funcionarios(
codf int primary key, 
nome varchar(40) not null, 
idade smallint,
CPF numeric(11) unique, 
cidade varchar(30), 
salario numeric(10),
cargo varchar(20)
);

create table tbl_consultas(
coda int primary key,
codm int references tbl_medicos(codm), 
codp int references tlb_pacientes(codp), 
dataConsulta date, 
hora time
);

alter table tbl_funcionarios add nroa int references tbl_ambulatorio(nroa);
alter table tbl_funcionarios drop column cargo;
alter table tbl_funcionarios drop column nroa;

insert into tbl_ambulatorio values (1, 1, 30),
							       (2, 1, 50),
                                   (3, 2, 40),
                                   (4, 2, 25),
                                   (5, 1, 55);

insert into tbl_medicos values  (1, "Joao", 40, "ortopedia", 10000100000, "Florianopolis", 1),
							    (2, "Maria", 42, "traumatologia", 10000110000, "Blumenau", 2),
                                (3, "Pedro", 51, "pediatria", 11000100000, "São José", 2),
                                (5, "Marcia", 33, "neurologia", 11000111000, "Biguacu", 3);
                              
insert into tbl_medicos (codm, nome,idade, especialidade, CPF, cidade) values(4, "Carlos", 28, "ortopedia", 11000110000, "Joinville");

insert into tbl_pacientes values (1, "Ana", 40, "Florianopolis",20000200000, "gripe"),
							     (2, "Paulo", 42, "Palhoca",20000220000, "fratura"),
                                 (3, "Lucia", 51, "Biguacu",22000200000, "tendinite"),
							     (4, "Carlos", 33, "Joinville",11000110000, "sarampo");


insert into tbl_funcionarios(codf,nome,idade,cidade,salario,CPF) values(1,'Rita',32,'Sao Jose',1200,20000100000);
insert into tbl_funcionarios(codf,nome,idade,cidade,salario,CPF) values(2,'Maria',55,'Palhoca',1220,30000110000);
insert into tbl_funcionarios(codf,nome,idade,cidade,salario,CPF) values(3,'Caio',45,'Florianopolis',1100,41000100000);
insert into tbl_funcionarios(codf,nome,idade,cidade,salario,CPF) values(4,'Carlos',44,'Florianopolis',1200,51000110000);
insert into tbl_funcionarios(codf,nome,idade,cidade,salario,CPF) values(5,'Paula',33,'SFlorianopolis',2500,61000111000);


insert into tbl_consultas values(1,1,1,'2006-06-12','14:00');
insert into tbl_consultas values(2,1,4,'2006-06-13','10:00');
insert into tbl_consultas values(3,2,1,'2006-06-13','9:00');
insert into tbl_consultas values(4,2,2,'2006-06-13','11:00');
insert into tbl_consultas values(5,2,3,'2006-06-14','14:00');
insert into tbl_consultas values(6,2,4,'2006-06-14','17:00');
insert into tbl_consultas values(7,3,1,'2006-06-19','18:00');
insert into tbl_consultas values(8,3,3,'2006-06-12','10:00');
insert into tbl_consultas values(9,3,4,'2006-06-19','13:00');
insert into tbl_consultas values(10,4,4,'2006-06-20','13:00');
insert into tbl_consultas values(11,4,4,'2006-06-22','19:30');

update tbl_pacientes 
set cidade = "Ilhota" 
where codp = 2;

update tbl_consultas
set dataConsulta = "2006-06-04", 
hora = "12:00"
where coda = 2;

update tbl_pacientes
set doenca = "Cancer"
where codp = 1;




select * from tbl_consultas;