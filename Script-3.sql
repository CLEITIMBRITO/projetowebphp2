select * from tbmoveis
where descricao like '%MESA%'

select * from tbsalas
where descricao like '%LAB%'

-- TODOS OS MÓVEIS QUE ESTÃO EM CADA SALA
select *
from tbmovelsala MS, tbmoveis M
where MS.idsala = 3
and MS.codigomovel = M.codigo


SELECT COUNT(*) as total FROM tbsalas
where descricao like '%lab%'

select * 
from tbsalas S , tbmovelsala MS
where S.id = MS.idsala
and S.descricao like '%MESA%'

create table tbusuarios(
id int not null primary key auto_increment,
nomeusuario varchar(20) not null,
senha varchar(20) not null,
status varchar(15) default 'Ativo'
)

insert into tbusuarios
(nomeusuario,senha)
values
('Luciene','123'),
('Teste','321')

select * from tbusuarios
where nomeusuario = 'luciene'
and senha='123'
