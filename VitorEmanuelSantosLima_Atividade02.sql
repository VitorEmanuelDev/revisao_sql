#CREATE SCHEMA empresateste_at02_sql;
USE empresateste_at02_sql;


CREATE TABLE funcionario (
    cod_funcionario integer NOT NULL auto_increment,
    nome_funcionario character varying(100),
   	num_dependentes integer NOT NULL,
   	salario float NOT NULL,
	cod_cargo integer NOT NULL,
	cod_departamento integer NOT NULL,
	CONSTRAINT funcionario_pkey PRIMARY KEY (cod_funcionario)
);

CREATE TABLE cargo (
	cod_cargo integer NOT NULL auto_increment,
	nome_cargo character varying(50),
    CONSTRAINT cargo_pkey PRIMARY KEY (cod_cargo)
);


CREATE TABLE departamento (
	cod_departamento integer NOT NULL,
	nome_departamento character varying(50),
    CONSTRAINT departamento_pkey PRIMARY KEY (cod_departamento)
);


CREATE TABLE dependente (
    cod_dependente integer NOT NULL AUTO_INCREMENT,
    nome_dependente character varying(50),
    cod_funcionario integer NOT NULL,
    CONSTRAINT dependente_pkey PRIMARY KEY (cod_dependente)
);




INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento) VALUES (1, 'Édi Tavares Faria', 0, 5273, 1, 1);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento) VALUES (2, 'Alexandru Pegado Abranches', 0, 13085, 3, 2);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (3, 'Valentine Freixo Beltrão', 0, 5274, 1, 3);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (4, 'Amélia Belchior Fonseca', 0, 4696, 1, 4);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (5, 'Johnny Cardoso Rabelo', 0, 14517, 4, 1);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (6, 'Ticiane Quaresma Quina', 0, 12128, 3, 2);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (7, 'Antonio Chaves Tigre', 1, 5650, 1, 3);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (8, 'Elzira Jorge Casado', 2, 5469, 1, 4);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (9, 'Sérgio Antas Covinha', 0, 8318, 2, 1);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (10, 'Rossana Lima Casqueira', 0, 4648, 1, 2);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (11, 'Vasile Baião Saraiva', 0, 7548, 2, 3);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (12, 'Mariama Nazário Rufino', 0, 7548, 2, 4);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (13, 'Manelina Nazário Rufino', 0, 7548, 2, 2);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (14, 'Mario Costa Santos', 0, 13057, 5, 3);
INSERT INTO funcionario (cod_funcionario, nome_funcionario, num_dependentes, salario, cod_cargo, cod_departamento)  VALUES (15, 'Direma Santos Lima', 0, 7448, 3, 2);

INSERT INTO cargo (cod_cargo, nome_cargo) VALUES (1, 'Analista Júnior');
INSERT INTO cargo (cod_cargo, nome_cargo) VALUES (2, 'Analista Pleno');
INSERT INTO cargo (cod_cargo, nome_cargo) VALUES (3, 'Analista Sênior');
INSERT INTO cargo (cod_cargo, nome_cargo) VALUES (4, 'Especialista');
INSERT INTO cargo (cod_cargo, nome_cargo) VALUES (5, 'Gerente');

INSERT INTO departamento (cod_departamento, nome_departamento) VALUES (1, 'Financeiro');
INSERT INTO departamento (cod_departamento, nome_departamento) VALUES (2, 'Engenharia');
INSERT INTO departamento (cod_departamento, nome_departamento) VALUES (3, 'Pessoas');
INSERT INTO departamento (cod_departamento, nome_departamento) VALUES (4, 'Comercial');


INSERT INTO dependente (cod_dependente, nome_dependente, cod_funcionario) VALUES (1, 'Ana', 7);
INSERT INTO dependente (cod_dependente, nome_dependente, cod_funcionario) VALUES (2, 'Beto', 8);
INSERT INTO dependente (cod_dependente, nome_dependente, cod_funcionario) VALUES (3, 'Carlos', 8);



#questao a
CREATE VIEW maior_departamento AS
SELECT departamento.nome_departamento, count(funcionario.cod_departamento) as quantidade_funcionarios
FROM departamento
JOIN funcionario ON departamento.cod_departamento = funcionario.cod_departamento 
GROUP BY nome_departamento ORDER BY quantidade_funcionarios DESC LIMIT 1;

#questao b
CREATE VIEW departamento_funcionarios_sem_dependentes AS
SELECT departamento.nome_departamento, count(funcionario.cod_departamento) as funcionarios_sem_dependentes
FROM departamento
JOIN funcionario ON departamento.cod_departamento = funcionario.cod_departamento 
WHERE funcionario.num_dependentes = 0 GROUP BY nome_departamento ORDER BY funcionarios_sem_dependentes ASC LIMIT 1;

#questao c
CREATE VIEW funcionarios_com_iniocio_de_nome_dir AS
SELECT departamento.nome_departamento, funcionario.nome_funcionario FROM departamento
JOIN funcionario ON funcionario.cod_departamento = departamento.cod_departamento 
WHERE nome_funcionario LIKE "Dir%";


#questao d
CREATE VIEW funcionario_com_maior_salario AS
SELECT funcionario.nome_funcionario, funcionario.salario, departamento.nome_departamento
FROM funcionario 
JOIN departamento ON departamento.cod_departamento = funcionario.cod_departamento 
ORDER BY salario DESC LIMIT 1;

#questao e
CREATE VIEW funcionarios_com_titulo_gerente AS
SELECT funcionario.nome_funcionario, departamento.nome_departamento, cargo.nome_cargo 
FROM funcionario 
JOIN departamento ON departamento.cod_departamento = funcionario.cod_departamento 
JOIN cargo ON cargo.cod_cargo = funcionario.cod_cargo 
WHERE cargo.nome_cargo LIKE "Gerente";

#questao a
CREATE USER funcionario@localhost IDENTIFIED BY '9876543210';
GRANT SELECT ON *.* TO funcionario@localhost ;

#questao b
CREATE USER gerente@localhost IDENTIFIED BY '0123456789';
GRANT ALL PRIVILEGES ON *.* TO gerente@localhost ;


