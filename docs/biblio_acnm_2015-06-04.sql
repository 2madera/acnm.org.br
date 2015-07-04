# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.24)
# Database: biblio_acnm
# Generation Time: 2015-06-04 17:34:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table book
# ------------------------------------------------------------

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `author` varchar(128) NOT NULL DEFAULT '',
  `user` int(10) unsigned NOT NULL,
  `publisher` int(11) NOT NULL,
  `summary` text,
  `edition` varchar(45) DEFAULT NULL,
  `volume` varchar(45) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `shelf` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BOOK_USER_idx` (`user`),
  KEY `fk_BOOK_PUBLISHER1_idx` (`publisher`),
  KEY `fk_BOOK_CATEGORY1_idx` (`category`),
  CONSTRAINT `fk_BOOK_CATEGORY1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BOOK_PUBLISHER1` FOREIGN KEY (`publisher`) REFERENCES `publisher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BOOK_USER` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;

INSERT INTO `book` (`id`, `name`, `author`, `user`, `publisher`, `summary`, `edition`, `volume`, `quantity`, `created_at`, `status`, `shelf`, `category`)
VALUES
	(11,'Biotecnologia e Recursos Genéticos','José Maria F.J. da Silveira',9,2,'Desafios e oportunidades para o Brasil                                                     ','1','1',1,'2014-01-18',1,1,3),
	(12,'Superinteressante','vários',9,3,'Revista de temas vários, tecnologia, comportamento, etc.   ','324 outubro 2013','1',1,'2014-01-18',1,0,4),
	(13,'Estranho à Terra','Richard Bach',4,4,'                                                O grandioso clássico moderno da história da aviação pelo autor Fernão Capelo Gaivota.                                                        ','1','Único',1,'2013-11-19',1,1,10),
	(14,'Pedro Pedreiro','Odette de Barros Mott',4,5,'   Literatura Infanto - Juvenil                                       ','9','1',1,'2013-11-19',1,1,10),
	(15,'As Brumas de Avalon','Marion Zimmer Bradley',4,7,'         Uma saga de amores ardentes, fantasia e violência: a história das mulheres que decidiram o destino do rei Arthur e da Távola Redonda. O livro quatro O Prisioneiro da Árvore, conta as derradeiras batalhas da epopéia de Camelot: o rei Arthur reencontra o caminho para Avalon, mas Morgana sabe ser demasiado tarde para salvar a ilha dos druídas - o cristianismo já triunfou sobre a velha religião e conquistou a Bretanha.                                          ','Livro Quatro','1',1,'2013-11-19',1,1,10),
	(16,'Felix e Seu Fole Fedem','Elias José',4,8,'Literatura infanto-juvenil                                                    ','1','1',1,'2013-11-21',1,1,10),
	(17,'Pintar e Desenhar é só Começar - Meios de Transportes II','Silva Barros Comunicação',4,9,'Literatura infanto-juvenil','1','1',1,'2013-11-21',1,1,10),
	(18,'Dicionário Universal de Curiosidades ','Da Costa e Silva , Myrtis de Carvalho, Caio Alves de Toledo',4,1,'Dicionário Universal de Curiosidades da Letra \"P-Z\"','1','6',1,'2013-11-21',1,1,10),
	(19,'O Tesouro dos Mares','Norman Carlisle',4,10,'Literatura infanto-juvenil','1','1',1,'2013-11-21',1,1,10),
	(20,'A Caixa de Sonhos','Luci Guimarães Wantanabe',4,5,'Literatura infanto-juvenil','1','1',1,'2013-11-21',1,1,10),
	(21,'Por um Grande Amor','Suzana Dias-Beck',4,11,'Literatura infanto-juvenil','11ª','1',1,'2013-11-21',1,1,10),
	(22,'Histórias Fantásticas','José J. Veiga',4,12,'Literatura infanto-juvenil','1','2',1,'2013-11-21',1,1,10),
	(23,'A Incrível Aventura de Juba e Daniel','Ivan Yazbeck',4,13,'Literatura infanto-juvenil exemplar do professor','1','1',1,'2013-11-21',1,1,10),
	(24,'Ciranda dos Ventos','Luis Martins',4,11,'Crônicas Brasileiras                                     ','1','1',1,'2013-11-21',1,1,10),
	(25,'O Soldado Que Não Era','Joel Rufino dos Santos',4,11,'Literatura Brasileira Ficção','14ª','1',1,'2013-11-21',1,1,10),
	(26,'Os Desastres de Sofia','Condessa de Segur',4,14,'Literatura infanto-juvenil Ficção                                           ','8','1',1,'2013-11-21',1,1,10),
	(27,'A Casa do Anjo da Guarda','Condessa de Ségur',4,14,'Literatura infanto-juvenil ficção                    ','4ª','1',1,'2013-11-21',1,1,10),
	(28,'O Boi Aruá','Luis Jardim',4,15,'Literatura infantil','10ª','1',1,'2013-11-21',1,1,10),
	(29,'Os Colegas','Lygia Bojunga Nunes',4,15,'Literatura infanto-juvenil                                           ','4ª','1',1,'2013-11-21',1,1,10),
	(30,'Histórias da Mata-Virgem','Ivan Englev de Almeida',4,14,'Literatura infanto-juvenil','1','1',1,'2013-11-21',1,1,10),
	(31,'Travessuras da Mãe-do-Ouro','Jair Vitória',4,13,'Literatura infanto-juvenil ficção','1','1',1,'2013-11-21',1,1,10),
	(32,'As Aventuras de Pinóquio','Carlo Collodi',4,16,'Literatura infanto-juvenil  obra universal','1','1',1,'2013-11-21',1,1,10),
	(33,'Sete Fases do Conto de Fadas','Marcia Kupastas',4,11,'Literatura infanto-juvenil                                              ','2ª','1',1,'2013-11-22',1,1,10),
	(34,'Tantos Medos e Outras Coragens','Roseana Murray',4,17,'Literatura infanto-juvenil','1','1',1,'2013-11-22',1,1,10),
	(35,'Um Assassinato um Mistério e um Casamento','Mark Twain',4,1,'Literatura juvenil apresentado por Ana Maria Machado.                                                   ','1','1',1,'2013-11-22',1,1,10),
	(36,'O Amor e as Pedras','Sulema Mendes',4,18,'Romance.                                                    ','1','1',1,'2013-11-22',1,1,10),
	(37,'K\'s First Case','L.G Alexander',4,19,'Livro em Inglês conta uma história de mistério.                                                 ','1','1',1,'2013-11-22',1,1,10),
	(38,'O Rapto do Líquido Mágico','Maria Eunice Garrido Barbieri',4,17,'Literatura infanto-juvenil.                                          ','1','1',1,'2013-11-22',1,1,10),
	(39,'Por Que Não Mais Que Sete','Lurdes Gonçalves',4,20,'Literatura infanto-juvenil.                                                    ','1','1',1,'2013-11-22',1,1,10),
	(40,'Bola de Sebo e Outras Histórias','Guy de Maupassant',4,13,'Literatura infanto-juvenil.                                                    ','1','1',1,'2013-11-22',1,1,10),
	(41,'Uma Escola Assim, Eu Quero Pra Mim','Elias José',4,17,'Literatura infanto-juvenil.                                                    ','1','1',1,'2013-11-22',1,1,10),
	(42,'Quem Manda Em Mim Sou Eu','Fanny Abramovich',4,5,'Literatura infanto-juvenil.                                                    ','16ª','1',1,'2013-11-22',1,1,10),
	(43,'A Feiticeira da Salina','Herberto Sales',4,21,'Literatura infantil.                                                    ','1','1',1,'2013-11-22',1,1,10),
	(44,'Os Detetives do Farol','Klaus Bliesener',4,22,'Literatura infanto-juvenil                                                    ','1','1',1,'2013-11-22',1,1,10),
	(45,'O Mistério da Fábrica de Livros','Pedro Bandeira',4,23,'Literatura infanto-juvenil.                                                    ','39ª','1',1,'2013-11-22',1,1,10),
	(46,'O Mundo Maravilhoso dos Helicópteros','Frank J. Delear',4,10,'Livro conta a história e algumas tarefas dos helicópteros.                                                    ','1','1',1,'2013-11-22',1,1,10),
	(47,'Os Miseráveis','Víctor Hugo',4,1,'Literatura infanto-juvenil.                                                    ','1','1',1,'2013-11-22',1,1,10),
	(48,'O Fio da Navalha','W. Somerset Maugham',4,24,'Literatura ficcionista.                                                    ','1','1',1,'2013-11-22',1,1,10),
	(49,'Magia das Árvores','Máqui',4,17,'Literatura infanto-juvenil','1','1',1,'2013-11-22',1,1,10),
	(50,'O Castelo Proibido','Edward Packard',4,18,'Literatura infanto-juvenil','1','1',1,'2013-11-22',1,1,10),
	(51,'Perigo na Ilha','Eunice Sertã',4,25,'Literatura infanto-juvenil ficção                                                ','1','1',1,'2013-11-22',1,1,10),
	(52,'Histórias Curtas e Birutas','Sylvia Orthof',4,26,'Literatura infanto-juvenil','1ª','1',1,'2013-11-22',1,1,10),
	(53,'O livro do Pode-Não-Pode','Rosa Amanda Strausz',4,17,'Cópia encadernada literatura infanto-juvenil','1','1',1,'2013-11-22',1,1,10),
	(54,'Você e o Trânsito','Nilcéia Cleide da Silva',4,1,'Infantil - Ilustrações com os cuidados do cotidiano.','1','1',1,'2013-11-22',1,1,10),
	(55,'Gogo\'s Crazy Bones','Kimo Osuma',4,27,'Gibi','1','1',1,'2013-11-22',1,1,10),
	(56,'Vamos Ler na Escola','Beatriz Elaine',4,28,'Educação ','1','1',1,'2013-11-22',1,1,10),
	(57,'Clássicos do Romance Brasileiro','Samira Youssef Campedelli',4,13,'Educação - Romances','1','1',1,'2013-11-22',1,1,10),
	(58,'A Rapaziada de Jô','L.M Alcoti',4,3,'Literatura Juvenil                                                  ','1','1',1,'2013-11-22',1,1,10),
	(59,'Aventuras de um Petroleiro','Richard Armstrong',4,3,'Literatura Juvenil                                            ','1','1',1,'2013-11-22',1,1,10),
	(60,'Robinson Suíço','Johann Rudolf Wyss',4,3,'Literatura Juvenil                                               ','1','1',1,'2013-11-22',1,1,10),
	(61,'O Feijão e o Sonho','Orígenes Lessa',4,22,'Romance Brasileiro','31ª','1',1,'2013-11-22',1,1,10),
	(62,'Urraca a Perfeita','Clovis Tourinho',4,29,'Romance Histórico.','1','1',1,'2013-11-22',1,1,10),
	(63,'Transporte o Rio Para Melhor','Ceci Juruá',4,30,'Educação','1','1',1,'2013-11-22',1,1,10),
	(64,'Luz Del Fuegho','Aguinaldo Silva e Joaquim Vaz de Carvalho',4,26,'Romance Brasileiro','1','122',1,'2013-11-22',1,1,10),
	(65,'Terêncio: Famoso Músico e Peão de Ouro Preto','A. Sobreira',4,31,'Romance','1','1',1,'2013-11-22',1,1,10),
	(66,'Cazuza','Viriato Corrêa',4,32,'Literatura Brasileira','1','1',1,'2013-11-22',1,1,10),
	(67,'O Leite da Leoa','Isaac B. Tinger',4,10,'Literatura Juvenil','1','1',1,'2013-11-22',1,1,10),
	(68,'O Velho Careta','Pedro Bolch',4,33,'Literatura Brasileira.                                            ','1','1',1,'2013-11-22',1,1,10),
	(69,'Os Anões da Floresta','Perraul - Aderson - Grimm',4,34,'Literatura Infantil                                                ','1','1',1,'2013-11-22',1,1,10),
	(70,'O Garôto de Roma','Fr. Elzeário Schmitt, OFM.',4,8,'Bíblico                                                   ','1ª','1',1,'2013-11-22',1,1,10),
	(71,'Quinquim Labareda','Maria Heloísa Penteado',4,22,'Literatura infanto-juvenil','4ª','1',1,'2013-11-22',1,1,10),
	(72,'Zé Murieta, O Homem da Capa Preta','Lilian Sypriano',4,36,'Literatura infanto-juvenil                                           ','1','1',1,'2013-11-22',1,1,10),
	(73,'Homo Sapiens e Animais Inferiores','Lucio Leite de Oliveira',4,1,'Literatura infanto-juvenil                                              ','1','1',1,'2013-12-02',1,1,10),
	(74,'Soprinho','Fernanda Lopes de Almeida',4,37,'Literatura infanto-juvenil','3ª','1',1,'2013-11-22',1,1,10),
	(75,'Os Bons de Bola','Júlio Emílio Braz e Patrícia Martins',4,17,'Literatura infanto-juvenil                                          ','2ª','1',1,'2013-11-22',1,1,10),
	(76,'Ciranda do Meio Ambiente','Virgínia Schall,Sylvia Orthof,Paula Saldanha,Roseana Murray e Maria Alice Aguiar',4,30,'Educação Ambiental','1','2',1,'2013-11-22',1,1,10),
	(77,'A Parábola do Planeta Azul','Fernando Carraro',4,17,'literatura infanto-juvenil, Ecologia','11ª','1',1,'2013-11-22',1,1,10),
	(78,'A Bela Adormecida no Bosque','Charles Perrault',4,38,'Literatura infanto-juvenil, Ficção.                                         ','1','4',1,'2013-11-22',1,1,10),
	(79,'Andrômeda','Cesar lobo',4,39,'Literatura infanto-juvenil','1','1',1,'2013-11-22',1,1,10),
	(80,'O Último dos Moicanos','James Fenimore Cooper',4,41,'Literatura Juvenil                                             ','1','1',1,'2013-11-22',1,1,10),
	(81,'O Gato Que Amava Girl','Antônio de Pádua e Silva',4,6,'Literatura infanto-juvenil','2ª','1',1,'2013-11-22',1,1,10),
	(82,'O Mary Celeste','Rupert Furneaux',4,37,'Literatura Juvenil','1','1',1,'2013-11-22',1,1,10),
	(83,'O Elefante Branco','Georgene Faulkner',4,42,'Coleção Horas Preciosas da Infância livro 1/8','1','1',1,'2013-11-22',1,1,10),
	(84,'O Ganso Patinador','Alice Cooper Bailey',4,42,'Coleção Horas Preciosas da Infância livro 2/8                                               ','1','1',1,'2013-11-22',1,1,10),
	(85,'Graciosos Personagens de Minha Horta','Elizabeth Gordon',4,42,'Coleção Horas Preciosas da Infância livro 3/8                                              ','1','1',1,'2013-11-22',1,1,10),
	(86,'Aventuras Geográficas','Gertrude Alice Kay',4,42,'Coleção Horas Preciosas da Infância livro 4/8                                                    ','1','1',1,'2013-11-22',1,1,10),
	(87,'As Aventuras Geográficas','Gertrude Alice Kay',4,42,'Coleção Horas Preciosas da Infância livro 5/8                                              ','1','2',1,'2013-11-22',1,1,10),
	(88,'Curiosos Habitantes do Mar','Wilfrid, Sw Ancourt e Bronson',4,42,'Coleção Horas Preciosas da Infância livro 6/8                                           ','1','1',1,'2013-11-22',1,1,10),
	(89,'Os Entes Transformáveis','Elizabeth Gordon',4,42,'Coleção Horas Preciosas da Infância livro 7/8','1','1',1,'2013-11-22',1,1,10),
	(90,'Brotinho de Pêssego','Georgente Faulkner',4,42,'Coleção Horas Preciosas da Infância livro 8/8                                                    ','1','1',1,'2013-11-22',1,1,10),
	(91,'Quem Manda Em Mim Sou Eu','Fanny Abramovich',4,5,'A2 numerar depois Literatura infanto-juvenil','13ª','1',1,'2013-12-02',1,2,10),
	(92,'Meu Amiguinho','Violeta Delamare Torres',4,43,'A2-numerar   Infanto Juvenil - João e Maria','1','1',1,'2013-12-02',1,2,10),
	(93,'Meu Amiguinho','Violeta Delamare Torres',4,43,'A2 numerar depois Infanto-Juvenil                                                     ','1','1',1,'2013-12-02',1,2,10),
	(94,'O Rapaz Dos Dedos Verdes','Meiga Villas Boas Vasconcelos',4,14,'A2 numerar depois Infanto Juvenil                                                      ','1','1',1,'2013-12-02',1,2,10),
	(95,'Odisséia Espacial 2001','Arthur C. Clarke',4,44,'A2 numerar depois Ficção Científica                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(96,'Memórias De Um Burro','Condêssa de Ségur',4,14,'A2 numerar depois Infanto Juvenil                                                     ','1ª','1',1,'2013-12-02',1,2,10),
	(97,'A Divina Comédia','Dante',4,18,'A2 numerar depois Infanto Juvenil                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(98,'Hitler','Pierre E Reneé Gosset',4,45,'A2 numerar depois Biografia de Adolf Hitler                                                    ','2ª','1',1,'2013-12-02',1,2,10),
	(99,'A Máscara Da Sedutora','Victoria Holt',4,3,'A2 numerar depois Romance e Suspense                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(100,'Novelas Paulistanas','Antônio De Alcântara Machado',4,15,'A2 numerar depois Contos Brasileiros                                                    ','4ª','1',1,'2013-12-02',1,2,10),
	(101,'A Demanda De Dom Domigos','Zora Selian',4,33,'A2 numerar depois Histórias Nigerianas                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(102,'A Segunda Vitória','Morris West',4,10,'A2 numerar depois Infanto Juvenil                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(103,'Madison, 1300','Ira Levin',4,7,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(104,'Poemas Ardentes E Sentidos','Maria Ormesinda Xavier',4,1,'A2 numerar depois Poemas                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(105,'Ilusões As Aventuras De Um Messias Indeciso','Richard Bach',4,10,'A2 numerar depois Literatura Estrangeira                                                    ','12ª','1',1,'2013-12-02',1,2,10),
	(106,'A Chegada Em Darkover','Marion Zimmer Bradley',4,48,'A2 numerar depois Literatura Estrangeira                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(107,'Vencendo A Própria Crise','Carlos Wizard Martins',4,49,'A2 numerar depois Auto-Ajuda                                                     ','1ª','1',1,'2013-12-02',1,2,10),
	(108,'Kennedy Sem Lágrimas O Homem Por Baixo Do Mito','Tom Wicker',4,50,'A2 numerar depois Biografia de Kennedy                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(109,'Discurso Sobre A Corda','Benedicto Monteiro',4,51,'A2 numerar depois Poesia','1ª','1',1,'2013-12-02',1,2,10),
	(110,'O Jogo De 1 Milhão De Dólares','Chassie L. West',4,7,'A2 numerar depois Aventura                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(111,'O Jogo De 1 Milhão De Dólares','Chassie L. West',4,7,'A2 numerar depois Aventura                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(112,'Papai Vovô E Eu','Flávio De Souza',4,11,'A2 numerar depois Infanto-Juvenil                                                    ','7ª','1',1,'2013-12-02',1,2,10),
	(113,'Tatá e Dó-Ré-Mi-Fá No Reino Do Calajá','Marco Túlio Costa',4,17,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(114,'Contando Histórias','Celso Martins E Outros',4,53,'A2 numerar depois Espiritismo                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(115,'O Xaile Mágico E Outros Contos Para Crianças','Desconhecido',4,54,'A2 numerar depois Infantil','1ª','1',1,'2013-12-02',1,2,10),
	(116,'O Menino Do Dedo Verde','Maurice Druon',4,15,'A2 numerar depois Ficção                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(117,'Angélica','Lygia Bojunga Nunes',4,55,'A2 numerar depois Infantil                                                    ','16ª','1',1,'2013-12-02',1,2,10),
	(118,'A balada Do Falso Messias','Moacyr Scliar',4,22,'A2 numerar depois Ficção                                                    ','3ª','1',1,'2013-12-02',1,2,10),
	(119,'O Falso Observador De Pássaros','Luiz Maria Veiga',4,5,'A2 numerar depois Infanto-Juvenil                                                    ','10ª','1',1,'2013-12-02',1,2,10),
	(120,'É Preciso Lutar!','Marcia Kupstas',4,17,'A2 numerar depois Infanto-Juvenil                                                    ','13ª','1',1,'2013-12-02',1,2,10),
	(121,'Os Cavalinhos De Platiplanto','José J. Veiga',4,56,'A2 numerar depois Contos Brasileiros                                                    ','7ª','1',1,'2013-12-02',1,2,10),
	(122,'Férias Em Xangri-lá','Teresa Noronha',4,57,'A2 numerar depois Infanto-Juvenil                                                    ','17ª','1',1,'2013-12-02',1,2,10),
	(123,'O Boi Aruá','Luis Jardim',4,15,'A2 numerar depois Infanto Juvenil                                                     ','10ª','1',1,'2013-12-02',1,2,10),
	(124,'Rei Do Mundo','Lucila Junqueira De Almeida Prado',4,10,'A2 numerar depois Infanto-Juvenil                                                    ','9ª','1',1,'2013-12-02',1,2,10),
	(125,'Por Que Não Mais Que Sete','Lurdes Gonçalves',4,58,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(126,'Homo Sapiens E Os Animais Inferiores','Lucio Leite De Oliveira',4,1,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',5,'2013-12-02',1,2,10),
	(127,'A Longa Busca Da Comodidade','Lourenço Diaféria',4,59,'A2 numerar depois Crônicas                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(128,'Veneno Lento','Raul Drewnick',4,17,'A2 numerar depois Infanto-Juvenil                                                    ','3ª','1',1,'2013-12-02',1,2,10),
	(129,'As Colinas Da Ira','Leon Uris',4,10,'A2 numerar depois Suspense                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(130,'Corda Bamba','Lygia Bojunga Nunes',4,55,'A2 numerar depois Infanto-Juvenil                                                    ','9ª','1',1,'2013-12-02',1,2,10),
	(131,'O Anel De Brilhantes E Outras Estórias','A. S. De Mendonça Junior',4,1,'A2 numerar depois Literatura Brasileira                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(132,'Uma Segunda Chance','Justine Davis',4,7,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(133,'Xisto No Espaço','Lúcia Machado De Almeida',4,22,'A2 numerar depois Infanto-Juvenil                                                    ','18ª','1',1,'2013-12-02',1,2,10),
	(134,'Bisa Bia Bisa Bel','Ana Maria Machado',4,60,'A2 numerar depois Infanto-Juvenil                                                    ','8ª','1',1,'2013-12-02',1,2,10),
	(135,'Maria Bonita','Afrânio Peixoto',4,18,'A2 numerar depois Romance Regionalista Brasileiro                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(136,'Perigos No Mar','Aristides Fraga Lima',4,22,'A2 numerar depois Ficção                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(137,'O Último Conversível','Anton Myrer',4,10,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(138,'Memórias','Marechal J. B. Mascarenhas De Moraes',4,61,'A2 numerar depois Ilustrações e Mapas                                                    ','2ª','2',1,'2013-12-02',1,2,10),
	(139,'A Últimas Do Brasileiro','Ziraldo',4,26,'A2 numerar depois Charges                        ','3ª','3',1,'2013-12-02',1,2,10),
	(140,'Estórias Estradeiras','Virgílio Da Veiga',4,61,'A2 numerar depois Vida Militar                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(141,'Casulo Das Águas','Marcia De Almeida',4,62,'A2 numerar depois Literatura Brasileira                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(142,'A Adúltera','Adelaide Carraro',4,63,'A2 numerar depois Adulto                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(143,' O Amigo Da Infância O Cofre Dos Três Desejos e Outros Contos','Perralt, Anderson, Grimm e Outros Autores',4,34,'A2 numerar depois Infantil                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(144,'Abismo','Macedo Miranda',4,56,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(145,'Cilada De Uma Paixão','Möeth Allison',4,7,'A2 numerar depois Adulto                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(146,'A Morte Misteriosa','Carter Dickson',4,1,'A2 numerar depois Romance Policial                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(147,'Helena','Machado De Assis',4,17,'A2 numerar depois Romance Brasileiro                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(148,'Um Raio De Esperança','Barbara Cartland',4,7,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(149,'O Brasil','Ana Maria Magalhães E Isabel Alçada ',4,13,'A2 numerar depois História Ensino Fundamental                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(150,'Uma Sombra Em Ação','Flávia Muniz',4,1,'A2 numerar depois Literatura Infantil                                                                            ','1ª','1',1,'2013-12-02',1,2,10),
	(151,'As Trapalhadas Do Saparinho','Luiz Galdino',4,11,'A2 numerar depois Infanto-Juvenil','9ª','1',1,'2013-12-02',1,2,10),
	(152,'As Vinte E Seis Adorinhas','Dom Marcos Barbosa',4,14,'A2 numerar depois Infantil                                                    ','2ª','1',1,'2013-12-02',1,2,10),
	(153,'A Viola Enluarada De Zequinha Piriri','Rosana Rios',4,13,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(154,'Territórios De Bravos','Francisco Marins',4,37,'A2 numerar depois Infanto-Juvenil                                                    ','36ª','1',1,'2013-12-02',1,2,10),
	(155,'Morte E Vida Severina E Outros Poemas Em Voz Alta','João Cabral De Melo Neto',4,15,'A2 numerar depois Poesias                                                    ','9ª','1',1,'2013-12-02',1,2,10),
	(156,'Três Voltas Pra Esquerda','Stella Carr',4,64,'A2 numerar depois Infantil                                                    ','4ª','1',1,'2013-12-02',1,2,10),
	(157,'O Príncipe E O Mendigo','Mark Twain',4,13,'A2 numerar depois Infanto-Juvenil                                                 ','1ª','1',1,'2013-12-02',1,2,10),
	(158,'Dias Verdes','Dinorath Do Valle',4,13,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(159,'Colméia','Roberto Muylaert Tinoco',4,11,'A2 numerar depois Infantil                                                    ','3ª','1',1,'2013-12-02',1,2,10),
	(160,'A Parábola Do Planeta Azul','Fernando Carraro',4,17,'A2 numerar depois Infantil                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(161,'Automação E Movimento Operário','Harald Lossack, Clarice Melamed, José Teles',4,65,'A2 numerar depois Publicação Sindical Operária                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(162,'Cultura E Ciência','Carlos Chagas Filho',4,1,'A2 numerar depois Ciência,Cultura E Fundação                                                    ','1ª','1',1,'2013-12-02',1,2,10),
	(163,'Dicionário de Curiosidades','Caio Alves de Toledo',28,1,'                                                    gdfutdutsd','1','2',1,'2014-01-25',1,0,10);

/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`)
VALUES
	(1,'Sem categoria'),
	(3,'Biologia'),
	(4,'Revista Científica'),
	(5,'Ficção Científica'),
	(6,'Ficção Científica'),
	(7,'Literatura Infanto-Juvenil'),
	(8,'Literatura Infanto-Juvenil'),
	(9,'Épico'),
	(10,'A');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table client
# ------------------------------------------------------------

DROP TABLE IF EXISTS people;

CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `birth` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_CLIENT_USER1_idx` (`user`),
  CONSTRAINT `fk_CLIENT_USER1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table login_register
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_register`;

CREATE TABLE `login_register` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `login_register` WRITE;
/*!40000 ALTER TABLE `login_register` DISABLE KEYS */;

INSERT INTO `login_register` (`id`, `user`, `date`)
VALUES
	(1,22,'2015-06-03 22:10:21'),
	(2,22,'2015-06-03 22:55:40'),
	(3,22,'2015-06-04 08:56:26'),
	(4,22,'2015-06-04 09:49:12'),
	(5,22,'2015-06-04 09:49:33');

/*!40000 ALTER TABLE `login_register` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table publisher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PUBLISHER_USER1_idx` (`user`),
  CONSTRAINT `fk_PUBLISHER_USER1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;

INSERT INTO `publisher` (`id`, `name`, `user`)
VALUES
	(1,'Sem editora',1),
	(2,'Finep',1),
	(3,'Abril',1),
	(4,'Hemus - Livraria e Editora Limitada',4),
	(5,'Atual Editora LTDA',4),
	(6,'Atual Editora LTDA',4),
	(7,'Nova Cultural',4),
	(8,'Paulinas',4),
	(9,'M. Aparecida da Silva Oliveira',4),
	(10,'Record',4),
	(11,'Editora Moderna',4),
	(12,'Bertrand Brasil',4),
	(13,'Scipione',4),
	(14,'Editora do Brasil s/a',4),
	(15,'Livraria José Olympio Editora',4),
	(16,'Schwarcz Ltda.',4),
	(17,'FTD S.A',4),
	(18,'Ediouro Grupo Coquetel',4),
	(19,'Longman',4),
	(20,'Editora de Orientação Cultural Ltda.',4),
	(21,'Livraria Francisco Alves Editora S/A.',4),
	(22,'Ática',4),
	(23,'Gráfica Editora Hamburg Ltda.',4),
	(24,'Rio Gráfica Ltda.',4),
	(25,'Mundo Mirim',4),
	(26,'Codecri',4),
	(27,'Edimagic-Editora Ltda.',4),
	(28,'Inédita Books',4),
	(29,'Cátedra',4),
	(30,'Memórias Futuras ',4),
	(31,'Scor Tecci',4),
	(32,'Companhia Editora Nacional',4),
	(33,'Nórdica',4),
	(34,'Lello Brasileira S/A.',4),
	(35,'Fomato',4),
	(36,'Formato',4),
	(37,'Melhoramentos',4),
	(38,'Global',4),
	(39,'Globo',4),
	(40,'Globo',4),
	(41,'MK Com. de Livros e Publicações Ltda.',4),
	(42,'Mérito S/A',4),
	(43,'Editora Parma',4),
	(44,'Editora Expressão e Cultura',4),
	(45,'Editorial Aster Lisboa Ltda.',4),
	(46,'Editorial Aster Lisboa Ltda.',4),
	(47,'Editora Best Seller',4),
	(48,'Círculo do Livro S/A',4),
	(49,'Wizard Livros E Consultoria Ltda.',4),
	(50,'Bloch Editôres S/A',4),
	(51,'Editora Cejup',4),
	(52,'Editora Cejup',4),
	(53,'Gráfica E Editora Do Lar/ABC Do Interior',4),
	(54,'Editorial Infantil Majora',4),
	(55,'Editora Agir',4),
	(56,'Editora Civilização Brasileira',4),
	(57,'Editora Brasiliense S/A',4),
	(58,'Editora Orientação Cultural',4),
	(59,'Editora Ceres',4),
	(60,'Editora Salamandra',4),
	(61,'Biblioteca Do Exército Editora',4),
	(62,'Editora Marco Zero',4),
	(63,'L. Oren Editora E Distribuidora De Livros Ltd',4),
	(64,'Editora Pioneira',4),
	(65,'Editora Fase',4);

/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rent`;

CREATE TABLE `rent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `client` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `leave_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_RENT_USER1_idx` (`user`),
  KEY `fk_RENT_CLIENT1_idx` (`client`),
  KEY `fk_RENT_BOOK1_idx` (`book`),
  CONSTRAINT `fk_RENT_BOOK1` FOREIGN KEY (`book`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RENT_CLIENT1` FOREIGN KEY (`client`) REFERENCES people (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RENT_USER1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `ip_address`, `timestamp`, `data`)
VALUES
	('1aeeadf321992a4c5337de9ec4f01bb03f59fad9','127.0.0.1',1433422069,X'5F5F63695F6C6173745F726567656E65726174657C693A313433333432313737303B'),
	('26126ad0e71147fd91cc22c11d31b6d852fb5b97','127.0.0.1',1433422173,X'5F5F63695F6C6173745F726567656E65726174657C693A313433333432323136383B69647C733A323A223232223B6E616D657C733A373A224D617263656C6F223B6C6F67696E7C733A373A226D617263656C6F223B707772647C733A36303A22243279243131246257467959325673623231685A475670636D4666626567344243342F47613350747931526E73386D52617569366374794C796B594B223B76616C6964617465647C623A313B'),
	('4fe4d80ab9e091e5b19539de295ee2b4c85e63ec','127.0.0.1',1433420743,X'5F5F63695F6C6173745F726567656E65726174657C693A313433333432303530393B'),
	('ac1547d93aa56973a204c2f0bfaed9b57c292677','127.0.0.1',1433421367,X'5F5F63695F6C6173745F726567656E65726174657C693A313433333432313233383B');

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(255) NOT NULL DEFAULT '',
  `pwrd` varchar(255) NOT NULL DEFAULT '',
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_USER_USER1_idx` (`user`),
  CONSTRAINT `fk_USER_USER1` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `name`, `login`, `pwrd`, `is_admin`, `status`, `user`)
VALUES
	(1,'Regina Morais','reginamorais','$2y$11$bWFyY2Vsb21hZGVpcmFfbeBkBMjhhLXgV7TIlfscLijRDdl4EYOKW',1,1,1),
	(4,'Josivaldo','josivaldo','$2y$11$bWFyY2Vsb21hZGVpcmFfbe1ebkK1mzdUb34.JCqL.Mh4LplOVXVNC',0,1,1),
	(5,'Martha','martha','$2y$11$bWFyY2Vsb21hZGVpcmFfbeux3FoLjJ/wwPxMiryvxSnPTL.K/u4ZG',0,1,1),
	(6,'Dandara','dandara','$2y$11$bWFyY2Vsb21hZGVpcmFfbe8ehu1g8b/4NCIG/P/KkwnJa866h9EP6',0,1,1),
	(7,'Danielle','danielle','$2y$11$bWFyY2Vsb21hZGVpcmFfbemGKLJr7JcG3Pr/E8W1y9Zq7j8BR1nWy',0,1,1),
	(8,'Sinelle','sinelle','$2y$11$bWFyY2Vsb21hZGVpcmFfbe9VwzC2iSkW6BM4yfW3kpsE8cJ6yOsXe',0,1,1),
	(9,'Raquel Maria','raquelmaria','$2y$11$bWFyY2Vsb21hZGVpcmFfbee.aFiMNVmn9biogaSmEoRetbwumlXva',0,1,1),
	(10,'Roberto Junior','robertojunior','$2y$11$bWFyY2Vsb21hZGVpcmFfbenXu9bt2DyVeYsWggf0r5YCey9Xw13by',0,1,1),
	(11,'Edson Vando','edsonvando','$2y$11$bWFyY2Vsb21hZGVpcmFfbebXpRh.ggQDSFzyXiFOz2iAh1iGli7pq',0,1,1),
	(12,'Priscila','priscila','$2y$11$bWFyY2Vsb21hZGVpcmFfbeQEM29FRfNSfgpslTsIHW8r6qWAWLDa2',0,1,1),
	(13,'Soliane','soliane','$2y$11$bWFyY2Vsb21hZGVpcmFfbe2DfBIpQeF4UAlx7kXjd2glegi7Ytjzm',0,1,1),
	(14,'Carla','carla','$2y$11$bWFyY2Vsb21hZGVpcmFfbeuE63r0NGz2VVNsSCIwJRMl7Nox0mvX.',0,1,1),
	(15,'Eduardo','eduardo','$2y$11$bWFyY2Vsb21hZGVpcmFfbe6wqRb2xfBVtBrFyTBzhXL8mb9w2B.Uu',0,1,1),
	(16,'Célia','celia','$2y$11$bWFyY2Vsb21hZGVpcmFfbeHV.e8DDFf.c60CCVUVnPbzfLmz0ZESG',0,1,1),
	(17,'Adriene','adriene','$2y$11$bWFyY2Vsb21hZGVpcmFfbeSNbLruDkB8vRx4Tx65GmXyDnwiEfD/O',0,1,1),
	(18,'Jussara','jussara','$2y$11$bWFyY2Vsb21hZGVpcmFfbebvgB8.5m7lHl9NcslkDvYxTVKXgiLa6',0,1,1),
	(19,'Adriano','adriano','$2y$11$bWFyY2Vsb21hZGVpcmFfbe.Rmpq7IjsnYKWYlYO3y7e1GDR.XyYyO',0,1,1),
	(20,'Jairo','jairo','$2y$11$bWFyY2Vsb21hZGVpcmFfbez9I9gLWj7/zwG7uyDORvxxLIfE/1Jvy',0,1,1),
	(21,'Elaine','elaine','$2y$11$bWFyY2Vsb21hZGVpcmFfbeKhLMm46pOtv3PrHla.1QWDXx8El2QbG',0,1,1),
	(22,'Marcelo','marcelo','$2y$11$bWFyY2Vsb21hZGVpcmFfbeg4BC4/Ga3Pty1Rns8mRaui6ctyLykYK',0,1,1),
	(23,'Raul','raul','$2y$11$bWFyY2Vsb21hZGVpcmFfbeGwQYPfy5p1PWxCyhGzKAn0EfLcCeOOS',0,1,1),
	(24,'Viviane','viviane','$2y$11$bWFyY2Vsb21hZGVpcmFfbelk7230tqFukIXa2klrmShc8VGqnbW4q',0,1,1),
	(25,'Sabrina','sabrina','$2y$11$bWFyY2Vsb21hZGVpcmFfbetj7Z5TCzRo2VSGFNIzmU8TanIoYsXu2',0,1,1),
	(26,'Vanessa Constant','vanessaconstant','$2y$11$bWFyY2Vsb21hZGVpcmFfbek0qXvazEQ8QTniWD4s12QJeUmmT.4xW',0,1,1),
	(27,'Marília Gabriela','marilia','$2y$11$bWFyY2Vsb21hZGVpcmFfbeslZ.XbW3BCxUnZH25W3XfwH8te.oYbe',0,1,1),
	(28,'Gerson','gerson','$2y$11$bWFyY2Vsb21hZGVpcmFfbe.jFr0W6JEAJ7W3qp90nVewvzUDRk1rm',0,1,1),
	(29,'Igor','igor','$2y$11$bWFyY2Vsb21hZGVpcmFfbee4NRKEDp4FeDq1pTuuEK3n13z8aC.f2',0,1,1),
	(30,'Carina','carina','$2y$11$bWFyY2Vsb21hZGVpcmFfbeZqZwZOEF20S1gG9TSeRnkcpOf40wlxm',0,1,1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
