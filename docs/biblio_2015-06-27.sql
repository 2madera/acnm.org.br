# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.24)
# Database: biblio
# Generation Time: 2015-06-27 17:36:21 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table BOOK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BOOK`;

CREATE TABLE `BOOK` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `author` varchar(512) NOT NULL,
  `user` int(11) NOT NULL,
  `publisher` int(11) NOT NULL,
  `summary` text,
  `edition` varchar(512) NOT NULL,
  `volume` varchar(512) NOT NULL,
  `quantity` int(11) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `status` int(11) DEFAULT '1',
  `shelf` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_BOOK_USER_idx` (`user`),
  KEY `fk_BOOK_PUBLISHER_idx` (`publisher`),
  KEY `fk_BOOK_CATEGORY_idx` (`category`),
  CONSTRAINT `fk_BOOK_CATEGORY1` FOREIGN KEY (`category`) REFERENCES `CATEGORY` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BOOK_PUBLISHER1` FOREIGN KEY (`publisher`) REFERENCES `PUBLISHER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BOOK_USER1` FOREIGN KEY (`user`) REFERENCES `USER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `BOOK` WRITE;
/*!40000 ALTER TABLE `BOOK` DISABLE KEYS */;

INSERT INTO `BOOK` (`id`, `name`, `author`, `user`, `publisher`, `summary`, `edition`, `volume`, `quantity`, `created_at`, `status`, `shelf`, `category`)
VALUES
	(15,'As Brumas de Avalon','Marion Zimmer Bradley',4,7,'         Uma saga de amores ardentes, fantasia e violência: a história das mulheres que decidiram o destino do rei Arthur e da Távola Redonda. O livro quatro O Prisioneiro da Árvore, conta as derradeiras batalhas da epopéia de Camelot: o rei Arthur reencontra o caminho para Avalon, mas Morgana sabe ser demasiado tarde para salvar a ilha dos druídas - o cristianismo já triunfou sobre a velha religião e conquistou a Bretanha.                                          ','Livro Quatro','1',1,'2013-11-19 00:00:00',1,1,10),
	(16,'Felix e Seu Fole Fedem','Elias José',4,8,'Literatura infanto-juvenil                                                    ','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(17,'Pintar e Desenhar é só Começar - Meios de Transportes II','Silva Barros Comunicação',4,9,'Literatura infanto-juvenil','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(18,'Dicionário Universal de Curiosidades ','Da Costa e Silva , Myrtis de Carvalho, Caio Alves de Toledo',4,1,'Dicionário Universal de Curiosidades da Letra \"P-Z\"','1','6',1,'2013-11-21 00:00:00',1,1,10),
	(19,'O Tesouro dos Mares','Norman Carlisle',4,10,'Literatura infanto-juvenil','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(20,'A Caixa de Sonhos','Luci Guimarães Wantanabe',4,5,'Literatura infanto-juvenil','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(21,'Por um Grande Amor','Suzana Dias-Beck',4,11,'Literatura infanto-juvenil','11ª','1',1,'2013-11-21 00:00:00',1,1,10),
	(22,'Histórias Fantásticas','José J. Veiga',4,12,'Literatura infanto-juvenil','1','2',1,'2013-11-21 00:00:00',1,1,10),
	(23,'A Incrível Aventura de Juba e Daniel','Ivan Yazbeck',4,13,'Literatura infanto-juvenil exemplar do professor','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(24,'Ciranda dos Ventos','Luis Martins',4,11,'Crônicas Brasileiras                                     ','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(25,'O Soldado Que Não Era','Joel Rufino dos Santos',4,11,'Literatura Brasileira Ficção','14ª','1',1,'2013-11-21 00:00:00',1,1,10),
	(26,'Os Desastres de Sofia','Condessa de Segur',4,14,'Literatura infanto-juvenil Ficção                                           ','8','1',1,'2013-11-21 00:00:00',1,1,10),
	(27,'A Casa do Anjo da Guarda','Condessa de Ségur',4,14,'Literatura infanto-juvenil ficção                    ','4ª','1',1,'2013-11-21 00:00:00',1,1,10),
	(28,'O Boi Aruá','Luis Jardim',4,15,'Literatura infantil','10ª','1',1,'2013-11-21 00:00:00',1,1,10),
	(29,'Os Colegas','Lygia Bojunga Nunes',4,15,'Literatura infanto-juvenil                                           ','4ª','1',1,'2013-11-21 00:00:00',1,1,10),
	(30,'Histórias da Mata-Virgem','Ivan Englev de Almeida',4,14,'Literatura infanto-juvenil','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(31,'Travessuras da Mãe-do-Ouro','Jair Vitória',4,13,'Literatura infanto-juvenil ficção','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(32,'As Aventuras de Pinóquio','Carlo Collodi',4,16,'Literatura infanto-juvenil  obra universal','1','1',1,'2013-11-21 00:00:00',1,1,10),
	(33,'Sete Fases do Conto de Fadas','Marcia Kupastas',4,11,'Literatura infanto-juvenil                                              ','2ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(34,'Tantos Medos e Outras Coragens','Roseana Murray',4,17,'Literatura infanto-juvenil','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(35,'Um Assassinato um Mistério e um Casamento','Mark Twain',4,1,'Literatura juvenil apresentado por Ana Maria Machado.                                                   ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(36,'O Amor e as Pedras','Sulema Mendes',4,18,'Romance.                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(37,'K\'s First Case','L.G Alexander',4,19,'Livro em Inglês conta uma história de mistério.                                                 ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(38,'O Rapto do Líquido Mágico','Maria Eunice Garrido Barbieri',4,17,'Literatura infanto-juvenil.                                          ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(39,'Por Que Não Mais Que Sete','Lurdes Gonçalves',4,20,'Literatura infanto-juvenil.                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(40,'Bola de Sebo e Outras Histórias','Guy de Maupassant',4,13,'Literatura infanto-juvenil.                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(41,'Uma Escola Assim, Eu Quero Pra Mim','Elias José',4,17,'Literatura infanto-juvenil.                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(42,'Quem Manda Em Mim Sou Eu','Fanny Abramovich',4,5,'Literatura infanto-juvenil.                                                    ','16ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(43,'A Feiticeira da Salina','Herberto Sales',4,21,'Literatura infantil.                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(44,'Os Detetives do Farol','Klaus Bliesener',4,22,'Literatura infanto-juvenil                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(45,'O Mistério da Fábrica de Livros','Pedro Bandeira',4,23,'Literatura infanto-juvenil.                                                    ','39ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(46,'O Mundo Maravilhoso dos Helicópteros','Frank J. Delear',4,10,'Livro conta a história e algumas tarefas dos helicópteros.                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(47,'Os Miseráveis','Víctor Hugo',4,1,'Literatura infanto-juvenil.                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(48,'O Fio da Navalha','W. Somerset Maugham',4,24,'Literatura ficcionista.                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(49,'Magia das Árvores','Máqui',4,17,'Literatura infanto-juvenil','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(50,'O Castelo Proibido','Edward Packard',4,18,'Literatura infanto-juvenil','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(51,'Perigo na Ilha','Eunice Sertã',4,25,'Literatura infanto-juvenil ficção                                                ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(52,'Histórias Curtas e Birutas','Sylvia Orthof',4,26,'Literatura infanto-juvenil','1ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(53,'O livro do Pode-Não-Pode','Rosa Amanda Strausz',4,17,'Cópia encadernada literatura infanto-juvenil','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(54,'Você e o Trânsito','Nilcéia Cleide da Silva',4,1,'Infantil - Ilustrações com os cuidados do cotidiano.','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(55,'Gogo\'s Crazy Bones','Kimo Osuma',4,27,'Gibi','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(56,'Vamos Ler na Escola','Beatriz Elaine',4,28,'Educação ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(57,'Clássicos do Romance Brasileiro','Samira Youssef Campedelli',4,13,'Educação - Romances','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(58,'Marcelo','L.M Alcoti',4,3,'Literatura Juvenil                                                  ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(59,'Aventuras de um Petroleiro','Richard Armstrong',4,3,'Literatura Juvenil                                            ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(60,'Robinson Suíço','Johann Rudolf Wyss',4,3,'Literatura Juvenil                                               ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(61,'O Feijão e o Sonho','Orígenes Lessa',4,22,'Romance Brasileiro','31ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(62,'Urraca a Perfeita','Clovis Tourinho',4,29,'Romance Histórico.','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(63,'Transporte o Rio Para Melhor','Ceci Juruá',4,30,'Educação','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(64,'Luz Del Fuegho','Aguinaldo Silva e Joaquim Vaz de Carvalho',4,26,'Romance Brasileiro','1','122',1,'2013-11-22 00:00:00',1,1,10),
	(65,'Terêncio: Famoso Músico e Peão de Ouro Preto','A. Sobreira',4,31,'Romance','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(66,'Cazuza','Viriato Corrêa',4,32,'Literatura Brasileira','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(67,'O Leite da Leoa','Isaac B. Tinger',4,10,'Literatura Juvenil','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(68,'O Velho Careta','Pedro Bolch',4,33,'Literatura Brasileira.                                            ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(69,'Os Anões da Floresta','Perraul - Aderson - Grimm',4,34,'Literatura Infantil                                                ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(70,'O Garôto de Roma','Fr. Elzeário Schmitt, OFM.',4,8,'Bíblico                                                   ','1ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(71,'Quinquim Labareda','Maria Heloísa Penteado',4,22,'Literatura infanto-juvenil','4ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(72,'Zé Murieta, O Homem da Capa Preta','Lilian Sypriano',4,36,'Literatura infanto-juvenil                                           ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(73,'Homo Sapiens e Animais Inferiores','Lucio Leite de Oliveira',4,1,'Literatura infanto-juvenil                                              ','1','1',1,'2013-12-02 00:00:00',1,1,10),
	(74,'Soprinho','Fernanda Lopes de Almeida',4,37,'Literatura infanto-juvenil','3ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(75,'Os Bons de Bola','Júlio Emílio Braz e Patrícia Martins',4,17,'Literatura infanto-juvenil                                          ','2ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(76,'Ciranda do Meio Ambiente','Virgínia Schall,Sylvia Orthof,Paula Saldanha,Roseana Murray e Maria Alice Aguiar',4,30,'Educação Ambiental','1','2',1,'2013-11-22 00:00:00',1,1,10),
	(77,'A Parábola do Planeta Azul','Fernando Carraro',4,17,'literatura infanto-juvenil, Ecologia','11ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(78,'A Bela Adormecida no Bosque','Charles Perrault',4,38,'Literatura infanto-juvenil, Ficção.                                         ','1','4',1,'2013-11-22 00:00:00',1,1,10),
	(79,'Andrômeda','Cesar lobo',4,39,'Literatura infanto-juvenil','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(80,'O Último dos Moicanos','James Fenimore Cooper',4,41,'Literatura Juvenil                                             ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(81,'O Gato Que Amava Girl','Antônio de Pádua e Silva',4,6,'Literatura infanto-juvenil','2ª','1',1,'2013-11-22 00:00:00',1,1,10),
	(82,'O Mary Celeste','Rupert Furneaux',4,37,'Literatura Juvenil','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(83,'O Elefante Branco','Georgene Faulkner',4,42,'Coleção Horas Preciosas da Infância livro 1/8','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(84,'O Ganso Patinador','Alice Cooper Bailey',4,42,'Coleção Horas Preciosas da Infância livro 2/8                                               ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(85,'Graciosos Personagens de Minha Horta','Elizabeth Gordon',4,42,'Coleção Horas Preciosas da Infância livro 3/8                                              ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(86,'Aventuras Geográficas','Gertrude Alice Kay',4,42,'Coleção Horas Preciosas da Infância livro 4/8                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(87,'As Aventuras Geográficas','Gertrude Alice Kay',4,42,'Coleção Horas Preciosas da Infância livro 5/8                                              ','1','2',1,'2013-11-22 00:00:00',1,1,10),
	(88,'Curiosos Habitantes do Mar','Wilfrid, Sw Ancourt e Bronson',4,42,'Coleção Horas Preciosas da Infância livro 6/8                                           ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(89,'Os Entes Transformáveis','Elizabeth Gordon',4,42,'Coleção Horas Preciosas da Infância livro 7/8','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(90,'Brotinho de Pêssego','Georgente Faulkner',4,42,'Coleção Horas Preciosas da Infância livro 8/8                                                    ','1','1',1,'2013-11-22 00:00:00',1,1,10),
	(91,'Quem Manda Em Mim Sou Eu','Fanny Abramovich',4,5,'A2 numerar depois Literatura infanto-juvenil','13ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(92,'Meu Amiguinho','Violeta Delamare Torres',4,43,'A2-numerar   Infanto Juvenil - João e Maria','1','1',1,'2013-12-02 00:00:00',1,2,10),
	(93,'Meu Amiguinho','Violeta Delamare Torres',4,43,'A2 numerar depois Infanto-Juvenil                                                     ','1','1',1,'2013-12-02 00:00:00',1,2,10),
	(94,'O Rapaz Dos Dedos Verdes','Meiga Villas Boas Vasconcelos',4,14,'A2 numerar depois Infanto Juvenil                                                      ','1','1',1,'2013-12-02 00:00:00',1,2,10),
	(95,'Odisséia Espacial 2001','Arthur C. Clarke',4,44,'A2 numerar depois Ficção Científica                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(96,'Memórias De Um Burro','Condêssa de Ségur',4,14,'A2 numerar depois Infanto Juvenil                                                     ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(97,'A Divina Comédia','Dante',4,18,'A2 numerar depois Infanto Juvenil                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(98,'Hitler','Pierre E Reneé Gosset',4,45,'A2 numerar depois Biografia de Adolf Hitler                                                    ','2ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(99,'A Máscara Da Sedutora','Victoria Holt',4,3,'A2 numerar depois Romance e Suspense                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(100,'Novelas Paulistanas','Antônio De Alcântara Machado',4,15,'A2 numerar depois Contos Brasileiros                                                    ','4ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(101,'A Demanda De Dom Domigos','Zora Selian',4,33,'A2 numerar depois Histórias Nigerianas                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(102,'A Segunda Vitória','Morris West',4,10,'A2 numerar depois Infanto Juvenil                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(103,'Madison, 1300','Ira Levin',4,7,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(104,'Poemas Ardentes E Sentidos','Maria Ormesinda Xavier',4,1,'A2 numerar depois Poemas                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(105,'Ilusões As Aventuras De Um Messias Indeciso','Richard Bach',4,10,'A2 numerar depois Literatura Estrangeira                                                    ','12ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(106,'A Chegada Em Darkover','Marion Zimmer Bradley',4,48,'A2 numerar depois Literatura Estrangeira                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(107,'Vencendo A Própria Crise','Carlos Wizard Martins',4,49,'A2 numerar depois Auto-Ajuda                                                     ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(108,'Kennedy Sem Lágrimas O Homem Por Baixo Do Mito','Tom Wicker',4,50,'A2 numerar depois Biografia de Kennedy                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(109,'Discurso Sobre A Corda','Benedicto Monteiro',4,51,'A2 numerar depois Poesia','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(110,'O Jogo De 1 Milhão De Dólares','Chassie L. West',4,7,'A2 numerar depois Aventura                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(111,'O Jogo De 1 Milhão De Dólares','Chassie L. West',4,7,'A2 numerar depois Aventura                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(112,'Papai Vovô E Eu','Flávio De Souza',4,11,'A2 numerar depois Infanto-Juvenil                                                    ','7ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(113,'Tatá e Dó-Ré-Mi-Fá No Reino Do Calajá','Marco Túlio Costa',4,17,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(114,'Contando Histórias','Celso Martins E Outros',4,53,'A2 numerar depois Espiritismo                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(115,'O Xaile Mágico E Outros Contos Para Crianças','Desconhecido',4,54,'A2 numerar depois Infantil','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(116,'O Menino Do Dedo Verde','Maurice Druon',4,15,'A2 numerar depois Ficção                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(117,'Angélica','Lygia Bojunga Nunes',4,55,'A2 numerar depois Infantil                                                    ','16ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(118,'A balada Do Falso Messias','Moacyr Scliar',4,22,'A2 numerar depois Ficção                                                    ','3ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(119,'O Falso Observador De Pássaros','Luiz Maria Veiga',4,5,'A2 numerar depois Infanto-Juvenil                                                    ','10ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(120,'É Preciso Lutar!','Marcia Kupstas',4,17,'A2 numerar depois Infanto-Juvenil                                                    ','13ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(121,'Os Cavalinhos De Platiplanto','José J. Veiga',4,56,'A2 numerar depois Contos Brasileiros                                                    ','7ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(122,'Férias Em Xangri-lá','Teresa Noronha',4,57,'A2 numerar depois Infanto-Juvenil                                                    ','17ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(123,'O Boi Aruá','Luis Jardim',4,15,'A2 numerar depois Infanto Juvenil                                                     ','10ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(124,'Rei Do Mundo','Lucila Junqueira De Almeida Prado',4,10,'A2 numerar depois Infanto-Juvenil                                                    ','9ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(125,'Por Que Não Mais Que Sete','Lurdes Gonçalves',4,58,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(126,'Homo Sapiens E Os Animais Inferiores','Lucio Leite De Oliveira',4,1,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',5,'2013-12-02 00:00:00',1,2,10),
	(127,'A Longa Busca Da Comodidade','Lourenço Diaféria',4,59,'A2 numerar depois Crônicas                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(128,'Veneno Lento','Raul Drewnick',4,17,'A2 numerar depois Infanto-Juvenil                                                    ','3ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(129,'As Colinas Da Ira','Leon Uris',4,10,'A2 numerar depois Suspense                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(130,'Corda Bamba','Lygia Bojunga Nunes',4,55,'A2 numerar depois Infanto-Juvenil                                                    ','9ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(131,'O Anel De Brilhantes E Outras Estórias','A. S. De Mendonça Junior',4,1,'A2 numerar depois Literatura Brasileira                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(132,'Uma Segunda Chance','Justine Davis',4,7,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(133,'Xisto No Espaço','Lúcia Machado De Almeida',4,22,'A2 numerar depois Infanto-Juvenil                                                    ','18ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(134,'Bisa Bia Bisa Bel','Ana Maria Machado',4,60,'A2 numerar depois Infanto-Juvenil                                                    ','8ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(135,'Maria Bonita','Afrânio Peixoto',4,18,'A2 numerar depois Romance Regionalista Brasileiro                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(136,'Perigos No Mar','Aristides Fraga Lima',4,22,'A2 numerar depois Ficção                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(137,'O Último Conversível','Anton Myrer',4,10,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(138,'Memórias','Marechal J. B. Mascarenhas De Moraes',4,61,'A2 numerar depois Ilustrações e Mapas                                                    ','2ª','2',1,'2013-12-02 00:00:00',1,2,10),
	(139,'A Últimas Do Brasileiro','Ziraldo',4,26,'A2 numerar depois Charges                        ','3ª','3',1,'2013-12-02 00:00:00',1,2,10),
	(140,'Estórias Estradeiras','Virgílio Da Veiga',4,61,'A2 numerar depois Vida Militar                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(141,'Casulo Das Águas','Marcia De Almeida',4,62,'A2 numerar depois Literatura Brasileira                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(142,'A Adúltera','Adelaide Carraro',4,63,'A2 numerar depois Adulto                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(143,' O Amigo Da Infância O Cofre Dos Três Desejos e Outros Contos','Perralt, Anderson, Grimm e Outros Autores',4,34,'A2 numerar depois Infantil                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(144,'Abismo','Macedo Miranda',4,56,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(145,'Cilada De Uma Paixão','Möeth Allison',4,7,'A2 numerar depois Adulto                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(146,'A Morte Misteriosa','Carter Dickson',4,1,'A2 numerar depois Romance Policial                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(147,'Helena','Machado De Assis',4,17,'A2 numerar depois Romance Brasileiro                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(148,'Um Raio De Esperança','Barbara Cartland',4,7,'A2 numerar depois Romance                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(149,'O Brasil','Ana Maria Magalhães E Isabel Alçada ',4,13,'A2 numerar depois História Ensino Fundamental                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(150,'Uma Sombra Em Ação','Flávia Muniz',4,1,'A2 numerar depois Literatura Infantil                                                                            ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(151,'As Trapalhadas Do Saparinho','Luiz Galdino',4,11,'A2 numerar depois Infanto-Juvenil','9ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(152,'As Vinte E Seis Adorinhas','Dom Marcos Barbosa',4,14,'A2 numerar depois Infantil                                                    ','2ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(153,'A Viola Enluarada De Zequinha Piriri','Rosana Rios',4,13,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(154,'Territórios De Bravos','Francisco Marins',4,37,'A2 numerar depois Infanto-Juvenil                                                    ','36ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(155,'Morte E Vida Severina E Outros Poemas Em Voz Alta','João Cabral De Melo Neto',4,15,'A2 numerar depois Poesias                                                    ','9ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(156,'Três Voltas Pra Esquerda','Stella Carr',4,64,'A2 numerar depois Infantil                                                    ','4ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(157,'O Príncipe E O Mendigo','Mark Twain',4,13,'A2 numerar depois Infanto-Juvenil                                                 ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(158,'Dias Verdes','Dinorath Do Valle',4,13,'A2 numerar depois Infanto-Juvenil                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(159,'Colméia','Roberto Muylaert Tinoco',4,11,'A2 numerar depois Infantil                                                    ','3ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(160,'A Parábola Do Planeta Azul','Fernando Carraro',4,17,'A2 numerar depois Infantil                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(161,'Automação E Movimento Operário','Harald Lossack, Clarice Melamed, José Teles',4,65,'A2 numerar depois Publicação Sindical Operária                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(162,'Cultura E Ciência','Carlos Chagas Filho',4,1,'A2 numerar depois Ciência,Cultura E Fundação                                                    ','1ª','1',1,'2013-12-02 00:00:00',1,2,10),
	(163,'Dicionário de Curiosidades','Caio Alves de Toledo',28,1,'                                                    gdfutdutsd','1','2',1,'2014-01-25 00:00:00',1,0,10);

/*!40000 ALTER TABLE `BOOK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table CATEGORY
# ------------------------------------------------------------

DROP TABLE IF EXISTS `CATEGORY`;

CREATE TABLE `CATEGORY` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `CATEGORY` WRITE;
/*!40000 ALTER TABLE `CATEGORY` DISABLE KEYS */;

INSERT INTO `CATEGORY` (`id`, `name`)
VALUES
	(1,'Sem categoria'),
	(4,'Revista Científica'),
	(5,'Ficção Científica'),
	(6,'Ficção Científica'),
	(7,'Literatura Infanto-Juvenil'),
	(8,'Literatura Infanto-Juvenil'),
	(9,'Épico'),
	(10,'A');

/*!40000 ALTER TABLE `CATEGORY` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table LOGIN_REGISTER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `LOGIN_REGISTER`;

CREATE TABLE `LOGIN_REGISTER` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PEOPLE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PEOPLE`;

CREATE TABLE `PEOPLE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(512) DEFAULT NULL,
  `name` varchar(512) NOT NULL,
  `birth` datetime DEFAULT NULL,
  `address` varchar(512) NOT NULL,
  `phone` varchar(512) DEFAULT NULL,
  `cell` varchar(512) DEFAULT NULL,
  `scholl_name` varchar(512) DEFAULT NULL,
  `mother_name` varchar(512) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `public_school` int(11) DEFAULT NULL,
  `graduation` varchar(512) DEFAULT NULL,
  `school_period` varchar(128) DEFAULT NULL,
  `brother_count` int(11) DEFAULT NULL,
  `extra_courses` varchar(512) DEFAULT NULL,
  `school_projects` varchar(512) DEFAULT NULL,
  `acnm_projects` varchar(512) DEFAULT NULL,
  `how_knows` varchar(512) DEFAULT NULL,
  `emergency_call` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PEOPLE_USER_idx` (`user`),
  CONSTRAINT `fk_PEOPLE_USER1` FOREIGN KEY (`user`) REFERENCES `USER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table PUBLISHER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PUBLISHER`;

CREATE TABLE `PUBLISHER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PUBLISHER` WRITE;
/*!40000 ALTER TABLE `PUBLISHER` DISABLE KEYS */;

INSERT INTO `PUBLISHER` (`id`, `name`)
VALUES
	(1,'Sem editora'),
	(2,'Finep'),
	(3,'Abril'),
	(4,'Hemus - Livraria e Editora Limitada'),
	(5,'Atual Editora Ltda 4'),
	(6,'Atual Editora Ltda'),
	(7,'Nova Cultural'),
	(8,'Paulinas'),
	(9,'M. Aparecida da Silva Oliveira'),
	(10,'Record'),
	(11,'Editora Moderna'),
	(12,'Bertrand Brasil'),
	(13,'Scipione'),
	(14,'Editora do Brasil s/a'),
	(15,'Livraria José Olympio Editora'),
	(16,'Schwarcz Ltda.'),
	(17,'FTD S.A'),
	(18,'Ediouro Grupo Coquetel'),
	(19,'Longman'),
	(20,'Editora de Orientação Cultural Ltda.'),
	(21,'Livraria Francisco Alves Editora S/A.'),
	(22,'Ática'),
	(23,'Gráfica Editora Hamburg Ltda.'),
	(24,'Rio Gráfica Ltda.'),
	(25,'Mundo Mirim'),
	(26,'Codecri'),
	(27,'Edimagic-Editora Ltda.'),
	(28,'Inédita Books'),
	(29,'Cátedra'),
	(30,'Memórias Futuras '),
	(31,'Scor Tecci'),
	(32,'Companhia Editora Nacional'),
	(33,'Nórdica'),
	(34,'Lello Brasileira S/A.'),
	(35,'Fomato'),
	(36,'Formato'),
	(37,'Melhoramentos'),
	(38,'Global'),
	(39,'Globo'),
	(40,'Globo'),
	(41,'MK Com. de Livros e Publicações Ltda.'),
	(42,'Mérito S/A'),
	(43,'Editora Parma'),
	(44,'Editora Expressão e Cultura'),
	(45,'Editorial Aster Lisboa Ltda.'),
	(46,'Editorial Aster Lisboa Ltda.'),
	(47,'Editora Best Seller'),
	(48,'Círculo do Livro S/A'),
	(49,'Wizard Livros E Consultoria Ltda.'),
	(50,'Bloch Editôres S/A'),
	(51,'Editora Cejup'),
	(52,'Editora Cejup'),
	(53,'Gráfica E Editora Do Lar/ABC Do Interior'),
	(54,'Editorial Infantil Majora'),
	(55,'Editora Agir'),
	(56,'Editora Civilização Brasileira'),
	(57,'Editora Brasiliense S/A'),
	(58,'Editora Orientação Cultural'),
	(59,'Editora Ceres'),
	(60,'Editora Salamandra'),
	(61,'Biblioteca Do Exército Editora'),
	(62,'Editora Marco Zero'),
	(63,'L. Oren Editora E Distribuidora De Livros Ltd'),
	(64,'Editora Pioneira'),
	(65,'Editora Fase');

/*!40000 ALTER TABLE `PUBLISHER` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table RENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RENT`;

CREATE TABLE `RENT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `leave_date` datetime NOT NULL,
  `user` int(11) NOT NULL,
  `people` int(11) NOT NULL,
  `book` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_RENT_USER_idx` (`user`),
  KEY `fk_RENT_PEOPLE_idx` (`people`),
  KEY `fk_RENT_BOOK_idx` (`book`),
  CONSTRAINT `fk_RENT_BOOK1` FOREIGN KEY (`book`) REFERENCES `BOOK` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RENT_PEOPLE1` FOREIGN KEY (`people`) REFERENCES `PEOPLE` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RENT_USER1` FOREIGN KEY (`user`) REFERENCES `USER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table USER
# ------------------------------------------------------------

DROP TABLE IF EXISTS `USER`;

CREATE TABLE `USER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `login` varchar(512) NOT NULL,
  `pwrd` varchar(256) NOT NULL,
  `is_admin` int(11) NOT NULL,
  `status` int(11) DEFAULT '1',
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_USER_USER_idx` (`user`),
  CONSTRAINT `fk_USER_USER1` FOREIGN KEY (`user`) REFERENCES `USER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;

INSERT INTO `USER` (`id`, `name`, `email`, `login`, `pwrd`, `is_admin`, `status`, `user`)
VALUES
	(1,'Regina Morais','email@email.com','reginamorais','$2y$11$bWFyY2Vsb21hZGVpcmFfbeBkBMjhhLXgV7TIlfscLijRDdl4EYOKW',1,1,1),
	(4,'Josivaldo','email@email.com','josivaldo','$2y$11$bWFyY2Vsb21hZGVpcmFfbe1ebkK1mzdUb34.JCqL.Mh4LplOVXVNC',0,1,1),
	(5,'Martha','email@email.com','martha','$2y$11$bWFyY2Vsb21hZGVpcmFfbeux3FoLjJ/wwPxMiryvxSnPTL.K/u4ZG',0,1,1),
	(6,'Dandara','email@email.com','dandara','$2y$11$bWFyY2Vsb21hZGVpcmFfbe8ehu1g8b/4NCIG/P/KkwnJa866h9EP6',0,1,1),
	(7,'Danielle','email@email.com','danielle','$2y$11$bWFyY2Vsb21hZGVpcmFfbemGKLJr7JcG3Pr/E8W1y9Zq7j8BR1nWy',0,1,1),
	(8,'Sinelle','email@email.com','sinelle','$2y$11$bWFyY2Vsb21hZGVpcmFfbe9VwzC2iSkW6BM4yfW3kpsE8cJ6yOsXe',0,1,1),
	(9,'Raquel Maria','email@email.com','raquelmaria','$2y$11$bWFyY2Vsb21hZGVpcmFfbee.aFiMNVmn9biogaSmEoRetbwumlXva',0,1,1),
	(10,'Roberto Junior','email@email.com','robertojunior','$2y$11$bWFyY2Vsb21hZGVpcmFfbenXu9bt2DyVeYsWggf0r5YCey9Xw13by',0,1,1),
	(11,'Edson Vando','email@email.com','edsonvando','$2y$11$bWFyY2Vsb21hZGVpcmFfbebXpRh.ggQDSFzyXiFOz2iAh1iGli7pq',0,1,1),
	(12,'Priscila','email@email.com','priscila','$2y$11$bWFyY2Vsb21hZGVpcmFfbeQEM29FRfNSfgpslTsIHW8r6qWAWLDa2',0,1,1),
	(13,'Soliane','email@email.com','soliane','$2y$11$bWFyY2Vsb21hZGVpcmFfbe2DfBIpQeF4UAlx7kXjd2glegi7Ytjzm',0,1,1),
	(14,'Carla','email@email.com','carla','$2y$11$bWFyY2Vsb21hZGVpcmFfbeuE63r0NGz2VVNsSCIwJRMl7Nox0mvX.',0,1,1),
	(15,'Eduardo','email@email.com','eduardo','$2y$11$bWFyY2Vsb21hZGVpcmFfbe6wqRb2xfBVtBrFyTBzhXL8mb9w2B.Uu',0,1,1),
	(16,'Célia','email@email.com','celia','$2y$11$bWFyY2Vsb21hZGVpcmFfbeHV.e8DDFf.c60CCVUVnPbzfLmz0ZESG',0,1,1),
	(17,'Adriene','email@email.com','adriene','$2y$11$bWFyY2Vsb21hZGVpcmFfbeSNbLruDkB8vRx4Tx65GmXyDnwiEfD/O',0,1,1),
	(18,'Jussara','email@email.com','jussara','$2y$11$bWFyY2Vsb21hZGVpcmFfbebvgB8.5m7lHl9NcslkDvYxTVKXgiLa6',0,1,1),
	(19,'Adriano','email@email.com','adriano','$2y$11$bWFyY2Vsb21hZGVpcmFfbe.Rmpq7IjsnYKWYlYO3y7e1GDR.XyYyO',0,1,1),
	(20,'Jairo','email@email.com','jairo','$2y$11$bWFyY2Vsb21hZGVpcmFfbez9I9gLWj7/zwG7uyDORvxxLIfE/1Jvy',0,1,1),
	(21,'Elaine','email@email.com','elaine','$2y$11$bWFyY2Vsb21hZGVpcmFfbeKhLMm46pOtv3PrHla.1QWDXx8El2QbG',0,1,1),
	(22,'Marcelo','maderabatera@gmail.com','marcelo','$2y$11$bWFyY2Vsb21hZGVpcmFfbeg4BC4/Ga3Pty1Rns8mRaui6ctyLykYK',1,1,1),
	(23,'Raul','email@email.com','raul','$2y$11$bWFyY2Vsb21hZGVpcmFfbeGwQYPfy5p1PWxCyhGzKAn0EfLcCeOOS',0,1,1),
	(24,'Viviane','email@email.com','viviane','$2y$11$bWFyY2Vsb21hZGVpcmFfbelk7230tqFukIXa2klrmShc8VGqnbW4q',0,1,1),
	(25,'Sabrina','email@email.com','sabrina','$2y$11$bWFyY2Vsb21hZGVpcmFfbetj7Z5TCzRo2VSGFNIzmU8TanIoYsXu2',0,1,1),
	(26,'Vanessa Constant','email@email.com','vanessaconstant','$2y$11$bWFyY2Vsb21hZGVpcmFfbek0qXvazEQ8QTniWD4s12QJeUmmT.4xW',0,1,1),
	(27,'Marília Gabriela','email@email.com','marilia','$2y$11$bWFyY2Vsb21hZGVpcmFfbeslZ.XbW3BCxUnZH25W3XfwH8te.oYbe',0,1,1),
	(28,'Gerson','email@email.com','gerson','$2y$11$bWFyY2Vsb21hZGVpcmFfbe.jFr0W6JEAJ7W3qp90nVewvzUDRk1rm',0,1,1),
	(29,'Igor','email@email.com','igor','$2y$11$bWFyY2Vsb21hZGVpcmFfbee4NRKEDp4FeDq1pTuuEK3n13z8aC.f2',0,1,1),
	(30,'Carina','email@email.com','carina','$2y$11$bWFyY2Vsb21hZGVpcmFfbeZqZwZOEF20S1gG9TSeRnkcpOf40wlxm',0,1,1),
	(193,'Admin','maderabatera@gmail.com','admin','$2y$11$bWFyY2Vsb21hZGVpcmFfbeTdyRwChU2gGpGKZvBeN2pW/AvkrnuR.',1,1,1);

/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
