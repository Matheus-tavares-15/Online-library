# Online-library   (Esercitazione libreria) 



















# Banco de Dados da Plataforma de Biblioteca

Este projeto utiliza o Sistema de Gerenciamento de Banco de Dados (SGBD) **MySQL** para gerenciar os dados da plataforma de biblioteca. O arquivo SQL para importação do banco de dados está incluído neste repositório.

## Estrutura do Banco de Dados

O banco de dados foi criado seguindo as orientações da atividade, levando em consideração elementos técnicos essenciais para a criação de um banco de dados eficiente. Abaixo estão descritas as tabelas e seus campos.

### 1. Tabela de Autores (TB_AUTHORS)
Esta tabela armazena as informações sobre os autores dos livros.

| Campo        | Tipo            | Detalhes                        |
|--------------|-----------------|---------------------------------|
| `ID_AUTHOR`  | INT             | Primary Key, Auto Increment     |
| `NM_AUTHOR`  | VARCHAR(100)     | Nome do autor, Not Null         |

### 2. Tabela de Livros (TB_BOOKS)
Esta tabela armazena as informações dos livros cadastrados na plataforma.

| Campo                 | Tipo            | Detalhes                        |
|-----------------------|-----------------|---------------------------------|
| `ID_BOOK`             | INT             | Primary Key, Auto Increment     |
| `NM_TITLE`            | VARCHAR(100)    | Título do livro, Not Null       |
| `ID_AUTHOR`           | INT             | Foreign Key (referencia `ID_AUTHOR` de `TB_AUTHORS`), Not Null |
| `DT_PUBLICATION_YEAR` | INTEGER         | Ano de publicação, Not Null     |
| `NUM_STOCK`           | INTEGER         | Número de exemplares em estoque, Not Null |

### 3. Tabela de Gêneros (TB_GENDER)
Esta tabela armazena os diferentes gêneros (ou categorias) dos livros.

| Campo        | Tipo            | Detalhes                        |
|--------------|-----------------|---------------------------------|
| `ID_GENDER`  | INT             | Primary Key, Auto Increment     |
| `NM_GENDER`  | VARCHAR(100)     | Nome do gênero, Not Null        |

### 4. Tabela de Relacionamento Livros-Gêneros (TB_RELATIONSHIP_TB_BOOKS_TB_GENDER)
Esta tabela cria um relacionamento de muitos-para-muitos entre os livros e os gêneros.

| Campo            | Tipo            | Detalhes                        |
|------------------|-----------------|---------------------------------|
| `ID_RELATIONSHIP`| INT             | Primary Key, Auto Increment     |
| `ID_BOOK`        | INT             | Foreign Key (referencia `ID_BOOK` de `TB_BOOKS`), Not Null |
| `ID_GENDER`      | INT             | Foreign Key (referencia `ID_GENDER` de `TB_GENDER`), Not Null |

## Instruções de Importação

1. Clone este repositório para sua máquina local.
2. Utilize o arquivo SQL incluído para importar o banco de dados no MySQL. O comando abaixo pode ser utilizado para a importação:

```bash
mysql -u [usuario] -p [nome_do_banco] < arquivo_importacao.sql
