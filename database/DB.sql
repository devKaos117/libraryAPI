CREATE DATABASE Library
USE Library

CREATE TABLE Livros (
  id char(8) PRIMARY KEY,
  isbn13 char(13) UNIQUE NOT NULL,
  Editoras_id char(4) NOT NULL,
  titulo varchar(255) NOT NULL,
  subtitulo varchar(255),
  lingua char(4) NOT NULL,
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
  cpf char(11),
  nome varchar(255) NOT NULL,
  apelido varchar(255),
  email varchar(255)
);

CREATE TABLE Editoras (
  id char(4) PRIMARY KEY,
  cnpj char(14),
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
  estado char(2) NOT NULL
);

CREATE TABLE Editoras_contatos (
  id char(7) PRIMARY KEY,
  Enderecos_id char(6) NOT NULL,
  nome varchar(255) NOT NULL,
  ddd char(2) NOT NULL,
  numero varchar(9) NOT NULL,
  email varchar(255)
);

ALTER TABLE Caracteristicas_fisicas ADD FOREIGN KEY (Livros_id) REFERENCES Livros (id);
ALTER TABLE Tag ADD FOREIGN KEY (Livros_id) REFERENCES Livros (id);
ALTER TABLE Tag ADD FOREIGN KEY (Generos_id) REFERENCES Generos (id);
ALTER TABLE Livros ADD FOREIGN KEY (Editoras_id) REFERENCES Editoras (id);
ALTER TABLE Autoria ADD FOREIGN KEY (Livros_id) REFERENCES Livros (id);
ALTER TABLE Autoria ADD FOREIGN KEY (Autores_id) REFERENCES Autores (id);
ALTER TABLE Editoras_enderecos ADD FOREIGN KEY (Editoras_id) REFERENCES Editoras (id);
ALTER TABLE Editoras_contatos ADD FOREIGN KEY (Enderecos_id) REFERENCES Editoras_enderecos (id);

-- cadastrando game of thrones
INSERT INTO Editoras (id, cnpj, razao_social, nome_fantasia, nome) VALUES ('0001', '08108543000643', 'EDITORA VERA CRUZ LTDA', 'LEYA', 'LeYa');
INSERT INTO Editoras_enderecos (id, Editoras_id, cep, logradouro, numero, complemento, bairro, cidade, estado) VALUES ('000001', '0001', '20030070', 'Avenida Calogeras', '06', 'Apt 701', 'Centro', 'Rio de Janeiro', 'RJ');
INSERT INTO Editoras_contatos (id, Enderecos_id, nome, ddd, numero, email) VALUES ('0000001', '000001', 'Contabilidade', '11', '38552109', 'contabilidade@escala.com.br');
INSERT INTO Editoras_contatos (id, Enderecos_id, nome, ddd, numero, email) VALUES ('0000002', '000001', 'SAC', '11', '31298737', 'sac@leyabrasil.com.br');

INSERT INTO Autores (id, nome, apelido, email) VALUES ('00001', 'George Raymond Richard Martin', 'George R. R. Martin', 'grrm@georgerrmartin.com');

INSERT INTO Livros (id, isbn13, Editoras_id, titulo, subtitulo, lingua, lancamento, descricao) VALUES ('00000001', '9788580446265', '0001', 'As Crônicas de Gelo e Fogo', 'A Guerra dos Tronos', 'ptBR', '2014-01-01', '<p>A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones.</p>');
INSERT INTO Caracteristicas_fisicas (Livros_id, altura, largura, comprimento, paginas, capa_dura) VALUES ('00000001', '17', '12', '3', '1072', '0');
INSERT INTO Autoria (Livros_id, Autores_id) VALUES ('00000001', '00001');

INSERT INTO Livros (id, isbn13, Editoras_id, titulo, subtitulo, lingua, lancamento, descricao) VALUES ('00000002', '9788580446272', '0001', 'As Crônicas de Gelo e Fogo', 'A Fúria dos Reis', 'ptBR', '2014-01-01', '<p>A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones.</p>');
INSERT INTO Caracteristicas_fisicas (Livros_id, altura, largura, comprimento, paginas, capa_dura) VALUES ('00000002', '17', '12', '3.5', '1200', '0');
INSERT INTO Autoria (Livros_id, Autores_id) VALUES ('00000002', '00001');

INSERT INTO Livros (id, isbn13, Editoras_id, titulo, subtitulo, lingua, lancamento, descricao) VALUES ('00000003', '9788580446289', '0001', 'As Crônicas de Gelo e Fogo', 'A Tormenta de Espadas', 'ptBR', '2014-01-01', '<p>A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones.</p>');
INSERT INTO Caracteristicas_fisicas (Livros_id, altura, largura, comprimento, paginas, capa_dura) VALUES ('00000003', '17', '12', '4.2', '1480', '0');
INSERT INTO Autoria (Livros_id, Autores_id) VALUES ('00000003', '00001');

INSERT INTO Livros (id, isbn13, Editoras_id, titulo, subtitulo, lingua, lancamento, descricao) VALUES ('00000004', '9788580446296', '0001', 'As Crônicas de Gelo e Fogo', 'O Festim dos Corvos', 'ptBR', '2014-01-01', '<p>A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones.</p>');
INSERT INTO Caracteristicas_fisicas (Livros_id, altura, largura, comprimento, paginas, capa_dura) VALUES ('00000004', '17', '12', '3.1', '1104', '0');
INSERT INTO Autoria (Livros_id, Autores_id) VALUES ('00000004', '00001');

INSERT INTO Livros (id, isbn13, Editoras_id, titulo, subtitulo, lingua, lancamento, descricao) VALUES ('00000005', '9788580446302', '0001', 'As Crônicas de Gelo e Fogo', 'A Dança dos Dragões', 'ptBR', '2014-01-01', '<p>A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones.</p>');
INSERT INTO Caracteristicas_fisicas (Livros_id, altura, largura, comprimento, paginas, capa_dura) VALUES ('00000005', '17', '12', '4.1', '1456', '0');
INSERT INTO Autoria (Livros_id, Autores_id) VALUES ('00000005', '00001');
-- cadastrando lord of the rings
INSERT INTO Editoras (id, cnpj, razao_social, nome_fantasia, nome) VALUES ('0002', '', 'Houghton Mifflin Harcourt Publishing Company', 'Houghton Mifflin', 'HMH');

INSERT INTO Autores (id, nome, apelido, email) VALUES ('00002', 'John Ronald Reuel Tolkien', 'J. R. R. Tolkien', 'me@middleearth.com');

INSERT INTO Livros (id, isbn13, Editoras_id, titulo, subtitulo, lingua, lancamento, descricao) VALUES ('00000006', '9780618517657', '0002', 'The Lord of the Rings', 'The Fellowship of the Ring', 'enUS', '2004-10-21', '<p>The Fellowship of the Ring, part one of J.R.R. Tolkien''s epic masterpiece, first reached these shores on October 21, 1954, arriving, as C. S. Lewis proclaimed, “like lightning from a clear sky.” Fifty years and nearly one hundred million American readers later comes a beautiful new one-volume collectors edition befitting the stature of this crown jewel of our list. With a text fully corrected under the supervision of Christopher Tolkien to meet the author''s exacting wishes, two large-format fold-out maps, a ribbon placemarker, gilded page edges, a color insert depicting Tolkien''s own paintings of the Book of Mazarbul and exceptionally elegant and sturdy overall packaging housed within an attractive slipcase, this edition is the finest we''ve ever produced.</p>');
INSERT INTO Caracteristicas_fisicas (Livros_id, altura, largura, comprimento, paginas, capa_dura) VALUES ('00000006', '25.3', '16.8', '6.8', '1157', '1');
INSERT INTO Autoria (Livros_id, Autores_id) VALUES ('00000006', '00002');

-- cadastrando generos
INSERT INTO Generos (id, nome, descricao) VALUES ('001', 'Ação', 'O gênero de Ação conta histórias envolvendo um protagonista contra um antagonista, sempre contando com lutas, guerras e confrontos emocionantes.');
INSERT INTO Generos (id, nome, descricao) VALUES ('002', 'Drama', 'Texto ficcional de um caráter mais sério e não cômico que apresenta um desenvolvimento de fatos e circunstâncias compatíveis com os da vida real para aquele contexto.');
INSERT INTO Generos (id, nome, descricao) VALUES ('003', 'Aventura', 'A narrativa de aventura consiste em ações desenvolvidas pelo protagonista, que geralmente é um valente herói que vive as mais surpreendentes situações e desafios.');
INSERT INTO Generos (id, nome, descricao) VALUES ('004', 'Suspense', 'O gênero de suspense tem um discorrer que instiga os estados mentais de incerteza, ansiedade e dúvida de forma dramática, geralmente apresentando de forma bem detalhada os personagens e ambientes sombrios e misteriosos.');
INSERT INTO Generos (id, nome, descricao) VALUES ('005', 'Fantasia', 'O gênero de Fantasia é caracterizado por elementos fantásticos, como magia ou sobrenatural.');
INSERT INTO Generos (id, nome, descricao) VALUES ('006', 'Conto de Fadas', 'O Conto de Fadas é uma história, geralmente curta, que pertence ao gênero de Folclore. Essas histórias costumam envolver magia, encantamentos e criaturas mitológicas ou imaginárias.');


-- adicionando generos aos livros
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('001', '00000001');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('002', '00000001');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('003', '00000001');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('004', '00000001');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('005', '00000001');

INSERT INTO Tag (Generos_id, Livros_id) VALUES ('001', '00000002');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('002', '00000002');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('003', '00000002');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('004', '00000002');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('005', '00000002');

INSERT INTO Tag (Generos_id, Livros_id) VALUES ('001', '00000003');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('002', '00000003');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('003', '00000003');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('004', '00000003');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('005', '00000003');

INSERT INTO Tag (Generos_id, Livros_id) VALUES ('001', '00000004');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('002', '00000004');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('003', '00000004');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('004', '00000004');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('005', '00000004');

INSERT INTO Tag (Generos_id, Livros_id) VALUES ('001', '00000005');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('002', '00000005');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('003', '00000005');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('004', '00000005');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('005', '00000005');

INSERT INTO Tag (Generos_id, Livros_id) VALUES ('001', '00000006');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('003', '00000006');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('005', '00000006');
INSERT INTO Tag (Generos_id, Livros_id) VALUES ('006', '00000006');