# Online-library   (Esercitazione libreria) 


















# Library Platform Database

This project uses the **MySQL** Database Management System (DBMS) to manage the data for the library platform. The SQL file for importing the database is included in this repository.

## Database Structure

The database was created based on the project requirements and technical considerations to ensure an efficient and scalable structure. Below is a description of the tables and their fields.

![image](https://github.com/user-attachments/assets/1bf8602d-0403-4f4c-8970-5fb2f7038c2c)


### 1. Authors Table (TB_AUTHORS)
This table stores information about the book authors.

| Field        | Type            | Details                         |
|--------------|-----------------|---------------------------------|
| `ID_AUTHOR`  | INT             | Primary Key, Auto Increment      |
| `NM_AUTHOR`  | VARCHAR(100)     | Author's name, Not Null          |

### 2. Books Table (TB_BOOKS)
This table stores information about the books registered on the platform.

| Field                 | Type            | Details                         |
|-----------------------|-----------------|---------------------------------|
| `ID_BOOK`             | INT             | Primary Key, Auto Increment      |
| `NM_TITLE`            | VARCHAR(100)    | Book title, Not Null             |
| `ID_AUTHOR`           | INT             | Foreign Key (references `ID_AUTHOR` from `TB_AUTHORS`), Not Null |
| `DT_PUBLICATION_YEAR` | INTEGER         | Publication year, Not Null       |
| `NUM_STOCK`           | INTEGER         | Number of copies in stock, Not Null |

### 3. Genres Table (TB_GENDER)
This table stores the different genres or categories of books.

| Field        | Type            | Details                         |
|--------------|-----------------|---------------------------------|
| `ID_GENDER`  | INT             | Primary Key, Auto Increment      |
| `NM_GENDER`  | VARCHAR(100)     | Genre name, Not Null             |

### 4. Books-Genres Relationship Table (TB_RELATIONSHIP_TB_BOOKS_TB_GENDER)
This table establishes a **many-to-many** relationship between books and genres. 

A book can belong to multiple genres (e.g., a book could be both a **mystery** and a **thriller**), and a genre can have many books associated with it (e.g., there can be many books in the **science fiction** genre). To model this, an intermediate or join table (`TB_RELATIONSHIP_TB_BOOKS_TB_GENDER`) is created to link the books and genres, ensuring each book can have multiple genres and each genre can contain multiple books.

| Field            | Type            | Details                         |
|------------------|-----------------|---------------------------------|
| `ID_RELATIONSHIP`| INT             | Primary Key, Auto Increment      |
| `ID_BOOK`        | INT             | Foreign Key (references `ID_BOOK` from `TB_BOOKS`), Not Null |
| `ID_GENDER`      | INT             | Foreign Key (references `ID_GENDER` from `TB_GENDER`), Not Null |

