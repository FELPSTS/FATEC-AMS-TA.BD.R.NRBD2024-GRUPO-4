CREATE TABLE funcionario ( 
cod INT auto_increment PRIMARY KEY, 
nome VARCHAR(50),
sexo CHAR(1) CHECK (UPPER(sexo) = 'M' OR UPPER(sexo) = 'F'),
salario DECIMAL(18,2), 
data_admis DATE,
depto INT 
);
drop table funcionario;

CREATE TABLE aluno ( 
cod INT auto_increment PRIMARY KEY,
nome VARCHAR(50), 
sexo CHAR(1) CHECK (UPPER(sexo) = 'M' OR UPPER(sexo) = 'F')
);

CREATE TABLE departamento( 
cod_dep int AUTO_INCREMENT PRIMARY key,
 cod_func int,
 nome_func varchar(50),
 nome_dep varchar(50),
 FOREIGN key (cod_func) REFERENCES funcionario (id)
 );
 
 drop table departamento;
 
 SELECT * FROM departamento;
 INSERT INTO departamento(cod_func,nome_func,nome_dep)VALUES 
 (2,"jordan","compras"),
 (4,"gregore","atendimento"),
 (1,"jetulio","estoque"),
 (8,"renaudo","contabilidade");
 
 INSERT INTO funcionario(nome,sexo,salario,data_admis,depto)VALUES
 ("Getulio","M",20000.00,"1957/09/21",1),
 ("Marta","F",498756.00,"1957/09/21",1), 
 ("jerico","f",28932839.00,"1957/09/21",2), 
 ("getario","M",983623900.00,"1957/09/21",5), 
 ("cleitinhi","M",999999999999.00,"1957/09/21",1), 
 ("freati","M",34267462742222.00,"1957/09/21",2), 
 ("joel","M",1999.00,"1957/09/21",3);
 
 SELECT * FROM funcionario;
 
 drop table funcionario;
 
 INSERT INTO aluno (nome,sexo)VALUES
 ("Getulio","M"),
 ("Marta","F"),
 ("ana","f"),
 ("lucas","M");
 
 drop table aluno;
 
 SELECT * FROM funcionario;
 /*---------------Selecão 01 e 02 ----------------*/
 SELECT * FROM funcionario WHERE sexo = 'F'; SELECT * FROM funcionario WHERE salario > 1000;
 /*---------------projeção 03----------------*/ 
 SELECT nome, salario, sexo FROM funcionario;
 /*---------------projeção e seleção 04----------------*/
 SELECT nome, salario FROM funcionario WHERE salario > 2000;
 /*---------------união 05----------------*/
 SELECT cod,nome,sexo,data_admis,salario,depto FROM funcionario UNION SELECT cod,nome,sexo, NULL AS data_admis, NULL AS salario, NULL AS depto FROM aluno;
 /*---------------interseccão 06----------------*/
 SELECT funcionario.nome, funcionario.sexo FROM funcionario JOIN aluno ON funcionario.nome = aluno.nome; 
 /*----------------Diferença 07-----------------------*/
 SELECT funcionario.nome, funcionario.sexo FROM funcionario LEFT JOIN aluno ON funcionario.nome = aluno.nome WHERE aluno.nome IS NULL;
 /*----------------Plano cartesiano 08-----------------------*/ 
 SELECT f.nome AS Funcionário, f.sexo, f.data_admis, d.nome_dep AS Departamento FROM funcionario f LEFT JOIN departamento d ON f.depto = d.cod_dep; 
 /*----------------junção 9-----------------------*/
 SELECT funcionario.nome, funcionario.sexo, funcionario.data_admis, departamento.nome_dep FROM funcionario LEFT JOIN departamento ON funcionario.nome = departamento.nome_dep WHERE departamento.nome_dep is null;