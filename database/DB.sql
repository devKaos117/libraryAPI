CREATE TABLE Livros (
  id char(8) PRIMARY KEY,
  isbn13 char(13) UNIQUE NOT NULL,
  Editoras_id char(4) NOT NULL,
  titulo varchar(255) NOT NULL,
  subtitulo varchar(255),
  lingua varchar(255) NOT NULL,
  lancamento date NOT NULL,
  descricao text
);

CREATE TABLE Caracteristicas_fisicas (
  Livros_id char(8) PRIMARY KEY,
  altura varchar(255),
  largura varchar(255),
  comprimento varchar(255),
  paginas varchar(255) NOT NULL,
  capa_dura tinyint NOT NULL
);

CREATE TABLE Tag (
  Generos_id char(3) NOT NULL,
  Livros_id char(8) NOT NULL
);

CREATE TABLE Generos (
  id char(3) PRIMARY KEY,
  nome varchar(255) UNIQUE NOT NULL,
  descricao varchar(255) NOT NULL
);

CREATE TABLE Autoria (
  Livros_id char(8) NOT NULL,
  Autores_id char(5) NOT NULL
);

CREATE TABLE Autores (
  id char(5) PRIMARY KEY,
  cpf char(11) NOT NULL,
  nome varchar(255) NOT NULL,
  apelido varchar(255),
  email varchar(255)
);

CREATE TABLE Editoras (
  id char(4) PRIMARY KEY,
  cnpj char(14) UNIQUE NOT NULL,
  razao_social varchar(255) UNIQUE NOT NULL,
  nome_fantasia varchar(255) NOT NULL,
  nome varchar(255) NOT NULL
);

CREATE TABLE Editoras_enderecos (
  id char(6) PRIMARY KEY,
  Editoras_id char(4) NOT NULL,
  cep char(8) NOT NULL,
  logradouro varchar(255) NOT NULL,
  numero varchar(255) NOT NULL,
  complemento varchar(255) NOT NULL,
  bairro varchar(255) NOT NULL,
  cidade varchar(255) NOT NULL,
  estado varchar(255) NOT NULL
);

CREATE TABLE Editoras_contatos (
  Enderecos_id char(6) PRIMARY KEY,
  nome varchar(255) NOT NULL,
  ddd char(2) NOT NULL,
  numero varchar(9) NOT NULL,
  email varchar(255)
);

ALTER TABLE Livros ADD FOREIGN KEY (id) REFERENCES Caracteristicas_fisicas (Livros_id);
ALTER TABLE Tag ADD FOREIGN KEY (Livros_id) REFERENCES Livros (id);
ALTER TABLE Tag ADD FOREIGN KEY (Generos_id) REFERENCES Generos (id);
ALTER TABLE Livros ADD FOREIGN KEY (Editoras_id) REFERENCES Editoras (id);
ALTER TABLE Autoria ADD FOREIGN KEY (Livros_id) REFERENCES Livros (id);
ALTER TABLE Autoria ADD FOREIGN KEY (Autores_id) REFERENCES Autores (id);
ALTER TABLE Editoras_enderecos ADD FOREIGN KEY (Editoras_id) REFERENCES Editoras (id);
ALTER TABLE Editoras_contatos ADD FOREIGN KEY (Enderecos_id) REFERENCES Editoras_enderecos (id);