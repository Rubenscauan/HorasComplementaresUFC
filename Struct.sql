--script--

create table Aluno (
Nome varchar(30) not NULL,
Matricula char(7) NOT NULL primary key,
Curso varchar(30)NOT NULL,
Semestre int NOT NULL
horas_possuidas float, not NULL default 0
horas_necessarias double precision NOT NULL GENERATED ALWAYS AS (120) STORED;
)

create table celula(
Nome varchar(30)not null,
celulaid char(7) not null primary key,
quantidade_alunos int not null,
periodo varchar(50)
)

create table Responsavel (
Nome varchar(30) not null,
Matricula char(7)not null primary key,
Função varchar(10),
Idcelula char (5) not null,
foreign key (idcelula) references celula(celulaid)
)
create table horas_complementares(
Matricula_aluno char(7) not null ,
Matricula_responsavel char(7) not null,
Quantidade float not null,
dia int,
mes int,
ano int,
celula_id serial primary key,
foreign key(Matricula_aluno) references aluno(matricula),
foreign key(Matricula_responsavel) references responsavel(matricula)	
)
