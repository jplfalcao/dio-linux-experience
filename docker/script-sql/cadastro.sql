USE dio_me;

CREATE TABLE cadastro (
	aluno_id int auto_increment,
	nome varchar(50),
	sobrenome varchar(50),
	criador varchar(50),    
	nacionalidade varchar(50),
	primary key(aluno_id)
);

INSERT INTO cadastro (nome, sobrenome, criador, nacionalidade)
VALUES
('Dennis' , 'Ritchie', 'Linguagem B-C e UNIX', 'Estados Unidos'), 
('Linus' , 'Torvalds', 'Kernel Linux', 'Finlandia'),
('Richard' , 'Stallman', 'Projeto GNU', 'Estados Unidos'),
('Guido' , 'van Rossum', 'Linguagem Python', 'Holanda'),
('Ian' , 'Murdock', 'Projeto Debian', 'Alemanha');
