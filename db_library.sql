CREATE DATABASE IF NOT EXISTS db_library;
USE db_library;

-- Structure of the `tb_authors` table
CREATE TABLE `tb_authors` (
  `ID_AUTHORS` int(11) NOT NULL AUTO_INCREMENT,
  `NM_AUTHORS` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_AUTHORS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure of the `tb_books` table
CREATE TABLE `tb_books` (
  `ID_BOOKS` int(11) NOT NULL AUTO_INCREMENT,
  `NM_TITLE` varchar(100) NOT NULL,
  `ID_AUTHOR` int(11) NOT NULL,
  `DT_PUBLICATION_YEAR` INT NOT NULL,
  `NUM_STOCK` int(11) NOT NULL,
  PRIMARY KEY (`ID_BOOKS`),
  KEY `ID_AUTHOR` (`ID_AUTHOR`),
  CONSTRAINT `tb_books_ibfk_1` FOREIGN KEY (`ID_AUTHOR`) REFERENCES `tb_authors` (`ID_AUTHORS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure of the `tb_genres` table
CREATE TABLE `tb_genres` (
  `ID_GENRES` int(11) NOT NULL AUTO_INCREMENT,
  `NM_GENRES` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_GENRES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Structure of the `tb_relationship_tb_books_tb_genres` table
CREATE TABLE `tb_relationship_tb_books_tb_genres` (
  `ID_RELATIONSHIP` int(11) NOT NULL AUTO_INCREMENT,
  `ID_BOOKS` int(11) NOT NULL,
  `ID_GENRES` int(11) NOT NULL,
  PRIMARY KEY (`ID_RELATIONSHIP`),
  KEY `ID_BOOKS` (`ID_BOOKS`),
  KEY `ID_GENRES` (`ID_GENRES`),
  CONSTRAINT `tb_relationship_tb_books_tb_genres_ibfk_1` FOREIGN KEY (`ID_BOOKS`) REFERENCES `tb_books` (`ID_BOOKS`),
  CONSTRAINT `tb_relationship_tb_books_tb_genres_ibfk_2` FOREIGN KEY (`ID_GENRES`) REFERENCES `tb_genres` (`ID_GENRES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
