CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    -- question_id INTEGER NOT NULL
)

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    FOREIGN KEY (users_id) REFERENCES users(id) 

)

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (questions_id) REFERENCES questions(id),
)