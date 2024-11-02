# Online-library   (Esercitazione libreria) 

## Library API

This repository contains the code for the library API server, developed in Node.js with Express and MySQL. The API is responsible for managing information about books, authors, and genres.

### Technologies Used

- **Node.js**: JavaScript runtime environment on the server.
- **Express**: Web framework for Node.js, used to build the API.
- **MySQL**: Relational database management system used for data storage.
- **CORS**: Middleware to enable cross-origin resource sharing.

### Project Structure

- **Database Connection**: Uses `mysql2/promise` to connect to the MySQL database asynchronously.
- **Routes**: The API has several routes that allow:
  - Retrieve all books (`GET /books`)
  - Add a new book (`POST /books`)
  - Edit an existing book (`PUT /books/:editingBookId`)
  - Delete a book (`DELETE /books/:id`)
  - Retrieve, add, edit, and delete genres (`/genres`)
  - Retrieve, add, edit, and delete authors (`/authors`)

### Technical Choices

- **Route Organization**: The routes are organized by resource (books, genres, and authors), facilitating maintenance and scalability of the API.
- **Error Handling**: Each route has basic error handling that captures exceptions and returns an appropriate message to the client.
- **Use of Promises**: The API uses the `promise` version of the MySQL library to allow the use of `async/await`, improving code readability and management of asynchronous calls.
- **Genre Grouping**: The query to retrieve all books includes the `GROUP_CONCAT` function to gather associated genres for each book, allowing for a richer and more organized response.

## Online Library

The web application for managing books, genres, and authors is developed using React. The system allows for the addition, editing, and deletion of books, genres, and authors, while providing an intuitive interface for searching and navigation.

### Features

- **Home Screen**: 
  - Displays the list of available books.
  - Includes a search field to find books by name or genre.

- **Add Book Screen**: 
  - A dedicated interface for adding new books to the library.

- **Add Genres Screen**: 
  - Allows adding new book genres.
  - CRUD (Create, Read, Update, Delete) functionalities to manage genres.
  
- **Add Authors Screen**: 
  - Interface for adding new authors.
  - CRUD functionalities to manage authors, including editing and deleting.

- **Books CRUD Screen**: 
  - Allows editing and deleting information of existing books.

### Technologies Used

- **React**: JavaScript library for building user interfaces.
- **Vite**: Build tool for rapid development.
- **TailwindCSS**: CSS framework for quick and responsive styling.
- **Axios**: Library for making HTTP requests.
- **TypeScript**: Language that adds static typing to JavaScript.

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


## How to Run the Project
To run the project, you will need to download both the server and the web application, as well as the database file. These will be organized in the following folder structure:

- Library (API)
- Online-Library (Web Application)
- DB_LIBRARY.SQL (Database)

### Steps to Follow

1. **Import the Database into MySQL:**
   - Open your MySQL interface (such as phpMyAdmin).
   - Select the **Import** option.
   - Click on **Choose File** and select the `DB_LIBRARY.SQL` file that you downloaded.
   - Click **Execute** to import the database.

2. **Configure Database Access in the Server:**
   - Navigate to the **Library (API)** folder.
   - Open the file `/src/server.ts`.
   - Configure database access by adjusting the information in the code below:
     ```javascript
     const db = mysql.createPool({
       host: "localhost", // Database host
       user: "root",      // MySQL user
       password: "",      // Enter your password if required
       database: "db_library", // Database name (do not change)
     });
     ```
   - Save the changes made to the file.

3. **Run the Server:**
   - Stay in the **Library (API)** folder.
   - Open a terminal/command line in this folder.
   - Run the following command to install the necessary dependencies:
     ```bash
     npm install
     ```
   - After the dependencies are installed, start the server with the command:
     ```bash
     npm start
     ```

4. **Run the Web Application:**
   - Navigate to the **Online-Library (Web Application)** folder.
   - Open a terminal/command line in this folder.
   - Install the necessary dependencies by executing:
     ```bash
     npm install
     ```
   - After the dependencies are installed, start the web application with the following command:
     ```bash
     npm run dev
     ```

### Accessing the Application

Once you have started both the server and the web application, you can access the Online Library in your browser using the address that will be displayed in the terminal (usually something like `http://localhost:3000`).

### Video Tutorial

For a demonstration of the project, watch the tutorial video here: [Project Demonstration](https://youtu.be/c5XraXITo30)

