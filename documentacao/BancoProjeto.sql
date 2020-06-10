create database Projeto;
use Projeto;

create table empresa(
cnpj int primary key,
nomeEmpresa varchar (40),
telefone char (12),
email_empresa varchar (40),
rua varchar (50),
cep char (8),
cod_verificacao int
);

insert into empresa values
('12345678', 'BandTec', '11 41451090', 'bandtec@email.com', 'Hadock Lobo', '09895470', '123'),
('87654321', 'EcoLight', '11 42562181', 'ecolight@email.com', 'Sergio Trevisan', '09986581', '321'),
('32165487','Digital Building','11 43673292', 'digitalbuilding@email.com', 'Faria Lima','09887692','231');

select * from empresa;

create table usuario(
idUsuario int primary key auto_increment,
nomeUsuario varchar (40),
email_usuario varchar (40),
senha char (10),
fkEmpresa int,
foreign key (fkEmpresa) references empresa(cnpj)
) auto_increment = 1 ;

insert into usuario values
(null, 'José Silva', 'jose@email.com', 'jose123456', '12345678'),
(null, 'Maria Rodrigues', 'maria@email.com', 'maria12345', '32165487'),
(null, 'João Vitor', 'joao@email.com', 'joao123456', '87654321');

select * from usuario;

create table setor(
idSetor int primary key auto_increment,
limite_lux int,
fkEmpresa int,
foreign key (fkEmpresa) references empresa(cnpj)
) auto_increment = 10 ;

insert into setor values
(null, 750, '12345678'),
(null, 500, '12345678'),
(null, 600, '32165487'),
(null, 650, '32165487'),
(null, 700, '87654321'),
(null, 550, '87654321');

select * from setor;

create table sensor(
idSensor int primary key auto_increment,
fkSetor int,
foreign key (fkSetor) references setor(idSetor)
) auto_increment = 100 ;

insert into sensor values
(null, '10'),
(null, '11'),
(null, '12'),
(null, '13'),
(null, '14'),
(null, '15');

select * from sensor;

create table dados_sensor(
idDados int primary key auto_increment,
data_emissao date,
hora_emissao time,
lux int,
fkSensor int,
foreign key (fkSensor) references sensor(idSensor)
) auto_increment = 1000 ;

insert into dados_sensor values
(null, '2020-01-01', '12:00:05', 755, '100'),
(null, '2020-02-02', '13:05:55', 506, '101'),
(null, '2020-03-03', '17:30:43', 607, '102'),
(null, '2020-04-04', '22:55:10', 651, '103'),
(null, '2020-05-05', '08:20:00', 710, '104'),
(null, '2020-06-06', '10:15:38', 561, '105');

select * from dados_sensor;

select * from empresa as E, usuario as U where U.fkEmpresa = E.cnpj;
select * from empresa as E, setor as S where S.fkEmpresa = E.cnpj;
select * from setor as S, sensor as Sen where Sen.fkSetor = S.idSetor;
select * from sensor as S, dados_sensor as D where D.fkSensor = S.idSensor;