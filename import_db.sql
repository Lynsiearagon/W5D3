PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id) 

); 

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    follower_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
); 

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    parent_replies_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (parent_replies_id) REFERENCES replies(id)
); 

CREATE TABLE question_likes (
    id INTEGER PRIMARY NOT NULL,
    users_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (users_id) REFERENCES questions(id),
    FOREIGN KEY (question_id) REFERENCES users(id)
); 

INSERT INTO 
    users (fname, lname)
VALUES
    ('Lynsie', 'Aragon'),
    ('Chak', 'Chan');


INSERT INTO
    questions (title, body, author_id)
VALUES
    ('Recursion', 'What is recursion?', (SELECT id FROM users WHERE fname = 'Chak' AND lname = 'Chan')),
    ('SQL', 'What is SQL?', (SELECT id FROM users WHERE fname = 'Lynsie' AND lname = 'Aragon'));


INSERT INTO
    replies (body, question_id, author_id, parent_replies_id)
VALUES 
    ('SQL is a querying language!', (SELECT id FROM questions WHERE title = 'SQL'), 
    (SELECT id FROM users WHERE fname = 'Chak' AND lname = 'Chan',
    IS NULL)), 
    ('Thanks, Chak!', (SELECT id FROM questions WHERE title = 'SQL'), 
    (SELECT id FROM users WHERE fname = 'Lynsie' AND lname = 'Aragon'),
    (SELECT id FROM replies WHERE body = 'SQL is a querying language!'));


INSERT INTO
    question_likes (users_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Chak' AND lname = 'Chan'),
    (SELECT id FROM questions WHERE title = 'SQL')),
    ((SELECT id FROM users WHERE fname = 'Lynsie' AND lname = 'Aragon'),
    (SELECT id FROM questions WHERE title = 'Recursion'));


INSERT INTO
    question_follows (users_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Chak' AND lname = 'Chan'),
    (SELECT id FROM questions WHERE title = 'SQL'));
    ((SELECT id FROM users WHERE fname = 'Lynsie' AND lname = 'Aragon'),
    (SELECT id FROM questions WHERE title = 'Recursion'));



