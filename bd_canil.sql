-- Criando Banco de dados
create database db_canil;
use  db_canil;

-- Criando tabela animal (Comando Create (DDL))
create table tb_animal
(cd_animal int not null primary key, 
Raça char(15),
Cor char(15),
Porte char(15),
NomeAnimal char(30),
Temperamento char(30),
Dono char(50));

-- Exemplo de Drop (Comando Drop (DDL))
-- Adicionando teste_animal
alter table tb_animal
add teste_animal char(30);
-- dropando tabela
alter table tb_animal
drop column teste_animal;

-- Corrigindo nome dos dados levantados para o padrão houston (Comando Alter DDL)
alter table tb_animal
change column Raça raca char(30);
alter table tb_animal
change column Porte porte char(15),
change column NomeAnimal nome_animal char(30);
alter table tb_animal
change column Temperamento temperamento char(30),
change column Dono dono char(50);
alter table tb_animal
change column Cor cor char(30);

-- Visualizando tabela tb_animal (Comando Select (DQL))
select * from tb_animal;

-- Criando tabela Dono (Comando Create (DDL))
create table tb_dono
(CPF int not null primary key,
 Dono char(50),
 Telefone char(14),
 Email char(50),
 Endereço char(50)); 

-- Corrigindo nome dos dados levantados para o padrão houston (Comando Alter (DDL))
alter table tb_dono
change column CPF cpf char(11);
alter table tb_dono
change column Telefone telefone char(14);
alter table tb_dono
change column Email email char(50);
alter table tb_dono
change column Endereço endereco char(100);
alter table tb_dono
change column Dono dono char(50);

-- Visualizando tabela tb_dono (Comando Select (DQL))
select * from tb_dono;

-- Criando tabela Perdidos (Comando Create (DDL))
create table tb_perdidos
(cd_perdidos int not null primary key,
descricao_incidente char(200),
localizacao_perdido char(50),
data_incidente date,
horario_incidente datetime,
foto1_comprovante char(82),
foto2_comprovante char(82),
foto3_comprovante char(82));

-- Visualizando tabela tb_perdidos (Comando Select (DQL))
select * from tb_perdidos;

-- Criando tabela Achados (Comando Create (DDL))
create table tb_achados
(cd_achados int not null primary key,
localizacao_encontrado char(50),
data_encontrado date,
horario_encontrado datetime,
foto1_comprovante char(82),
foto2_comprovante char(82),
foto3_comprovante char(82));

-- Visualizando tabela tb_achados (Comando Select (DQL))
select * from tb_achados;

-- Populando tabela animal (Comando Insert (DML))
insert into tb_animal 
(cd_animal,raca,cor,porte,nome_animal,temperamento,dono)
values 
(1,'Doberman','Ferrugem','Grande','Yung Buda','Energético','Fernando Augusto'),
(2,'Pug','Damasco','Pequeno','Zoiudo','Arteiro','Gabriel Maciel'),
(3,'Pinsher','Fulvo Prateado','Mini','Guilbert','Raivoso','Leandro de Costas'),
(4,'São-bernardo','Vermelho e Branco','Grande','Joaquin','Tranquilo e de boa','Lazaro Ramos'),
(5,'Vira-lata','Caramelo','Médio','Totó','FOlgado','Tuppo');
-- Exemplo comando Delete (Comando Delete (DML))
delete from tb_animal
where cd_animal = 3;

-- Visualizando tabela tb_animal agora com valores (Comando Select (DQL))
select * from tb_animal;

-- Populando tabela dono (Comando Insert (DML))
insert into tb_dono
(cpf, dono, telefone, email, endereco)
values 
(036.874159-63, 'Fernando Augusto','61333011980','fernandinhoBeiraMar@gmail.com', 'Guara, Quadra 12, lote 5, casa 3'),
(014.785203-69, 'Gabriel Maciel','61888754369','emailgenerico@gmail.com', 'Aguas Claras, quadra 203, condomínio Portal das Andorinhas'),
(963.85201-47, 'Leandro de Costas','61996325874','leandrinbasictrip@gmail.com', 'Guara, Quadra 5, residencial valença, apartamento 504'),
(038.575431-60, 'Lazaro Ramos','61994875463','peludaodaglobo@gmail.com', 'Meio do mato');

-- alterando endereco (Comando Update (DML))
update tb_dono
set endereco = 'Asa Sul'
where cpf = 038.575431-60;
-- Visualizando tabela tb_dono agora com valores (Comando Select (DQL))
select * from tb_dono;

-- Criando as chaves estrangeiras 
-- Adicionando a chave estrangeira na tabela animal
alter table tb_animal
add cpf char(11);
-- criando a chave estrangeira na tabela animal (Comando Alter (DDL))
alter table tb_animal
add constraint fkcpfanimal foreign key (cpf)
references tb_dono (cpf);

-- Adicionando a chave estrangeira na tabela achados
alter table tb_achados
add cd_animal int;
-- criando a chave estrangeira na tabela achados (Comando Alter (DDL))
alter table tb_achados
add constraint fkanimal foreign key (cd_animal)
references tb_animal (cd_animal);

-- Adicionando a chave estrangeira na tabela perdidos
alter table tb_perdidos
add cd_animal int;
-- criando a chave estrangeira na tabela perdidos (Comando Alter (DDL))
alter table tb_perdidos
add constraint fkcdanimal foreign key (cd_animal)
references tb_animal (cd_animal);


