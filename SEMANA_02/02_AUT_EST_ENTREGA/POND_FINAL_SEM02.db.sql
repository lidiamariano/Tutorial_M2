BEGIN TRANSACTION;
DROP TABLE IF EXISTS "pessoa";
CREATE TABLE IF NOT EXISTS "pessoa" (
	"Nome"	INTEGER NOT NULL,
	"Cargo"	INTEGER NOT NULL,
	"id_pessoa"	INTEGER NOT NULL,
	PRIMARY KEY("id_pessoa")
);
DROP TABLE IF EXISTS "experiencia";
CREATE TABLE IF NOT EXISTS "experiencia" (
	"cargo"	INTEGER NOT NULL,
	"empresa"	INTEGER NOT NULL,
	"descricao_do_cargo"	INTEGER NOT NULL,
	"id_experiencia"	INTEGER NOT NULL,
	"id_pessoa"	INTEGER,
	PRIMARY KEY("id_experiencia"),
	FOREIGN KEY("id_pessoa") REFERENCES "pessoa"("id_pessoa")
);
DROP TABLE IF EXISTS "habilidades";
CREATE TABLE IF NOT EXISTS "habilidades" (
	"descricao_da_habilidade"	INTEGER NOT NULL,
	"id_habilidade"	INTEGER NOT NULL,
	"id_pessoa"	INTEGER,
	PRIMARY KEY("id_habilidade"),
	FOREIGN KEY("id_pessoa") REFERENCES "pessoa"("id_pessoa")
);
DROP TABLE IF EXISTS "idiomas";
CREATE TABLE IF NOT EXISTS "idiomas" (
	"qual_idioma"	NUMERIC NOT NULL,
	"niviel_no_idioma"	INTEGER NOT NULL,
	"id_idioma"	INTEGER NOT NULL,
	"id_pessoa"	INTEGER,
	PRIMARY KEY("id_idioma"),
	FOREIGN KEY("id_pessoa") REFERENCES "pessoa"("id_pessoa")
);
DROP TABLE IF EXISTS "educacao";
CREATE TABLE IF NOT EXISTS "educacao" (
	"cidade,pais"	INTEGER NOT NULL,
	"data_inicio_data_fim"	INTEGER NOT NULL,
	"curso"	INTEGER NOT NULL,
	"instituto"	INTEGER NOT NULL,
	"descricao_de_atividades"	INTEGER NOT NULL,
	"id_educacao"	INTEGER NOT NULL,
	"id_pessoa"	INTEGER,
	PRIMARY KEY("id_educacao"),
	FOREIGN KEY("id_pessoa") REFERENCES "pessoa"("id_pessoa")
);
DROP TABLE IF EXISTS "sobre mim";
CREATE TABLE IF NOT EXISTS "sobre mim" (
	"telefone"	INTEGER NOT NULL,
	"email"	INTEGER NOT NULL,
	"objetivo"	INTEGER NOT NULL,
	"data_de_nascimento"	INTEGER NOT NULL,
	"nacionalidade"	INTEGER NOT NULL,
	"id_sobre_mim"	INTEGER NOT NULL,
	"id_pessoa"	INTEGER,
	"endereco"	INTEGER NOT NULL,
	PRIMARY KEY("id_sobre_mim"),
	FOREIGN KEY("id_pessoa") REFERENCES "pessoa"("id_pessoa")
);
INSERT INTO "pessoa" ("Nome","Cargo","id_pessoa") VALUES ('Lídia Cruz Mariano','Estudante de Engenharia da Computação',1);
INSERT INTO "experiencia" ("cargo","empresa","descrição_do_cargo","id_experiencia","id_pessoa") VALUES ('Educadora ','Iniciativa Feynman','Produção de aulas, exercícios e apostilas sobre toda a química do Ensino Médio.',1,1),
 ('Educadora','Belaestudada','Produção de 15 aulas e 30 materiais sobre as matérias de matemática e física mais persistentes para o Exame Nacional do Ensino Médio.
',2,1),
 ('Designer','CoEduca - Brasil','Atuação na área de marketing e planejamento interno e criação de posts para o instagram.

',3,1);
INSERT INTO "habilidades" ("descricao_da_habilidade","id_habilidade","id_pessoa") VALUES ('Programação em linguagem Python',1,1);
INSERT INTO "idiomas" ("qual_idioma","niviel_no_idioma","id_idioma","id_pessoa") VALUES ('Inglês','Intermediário',1,1);
INSERT INTO "educacao" ("cidade,pais","data_inicio_data_fim","curso","instituto","descricao_de_atividades","id_educacao","id_pessoa") VALUES ('São Paulo, Brasil','2023 - Atualmente','Graduação em Engenharia da Computação','Instituto de Tecnologia e Liderança','Atuação no projeto em grupo para a empresa Cia de Talentos,na plataforma GODOT para jogo sobre desenvolvimento de soft skills.

',1,1);
INSERT INTO "sobre mim" ("telefone","email","objetivo","data_de_nascimento","nacionalidade","id_sobre_mim","id_pessoa","endereco") VALUES ('(85) 98524-0007','lidia.mariano@sou.inteli.edu.br','Estagiária na área de Engenharia da Computação','2004-01-22



','Brasileira',1,1,'Butantã, São Paulo - SP');
COMMIT;
