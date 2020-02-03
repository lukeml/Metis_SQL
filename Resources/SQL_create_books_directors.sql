CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(100),
    book_genre VARCHAR(100),
);

INSERT INTO books values (1, 'A Wrinkle in Time', 'science fiction');
INSERT INTO books values (2, 'Murder on the Orient Express', 'mystery');
INSERT INTO books values (3, 'Jurassic Park', 'science fiction');
INSERT INTO books values (4, 'Pride and Prejudice', 'romance');


CREATE TABLE directors(
    director_id INT PRIMARY KEY,
    director_name VARCHAR(100),
    director_specialty VARCHAR (100),
    preferred_book_id INT,
    fav_director_id INT
);

INSERT INTO directors VALUES (1, 'Alfred Hitchcock', 'mystery', 2, 3);
INSERT INTO directors VALUES (2, 'Michael Bay', 'action', 3, 3);
INSERT INTO directors VALUES (3, 'George Lucas', 'science fiction', 1, 1);