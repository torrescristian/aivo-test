-- DDL

CREATE DATABASE aivo;
USE aivo;

CREATE TABLE users(
    id INT AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY(id)
);

CREATE TABLE tweets(
    id INT AUTO_INCREMENT,
    created_at DATETIME DEFAULT NOW(),
    text VARCHAR(280) NOT NULL,
    in_reply INT DEFAULT NULL,
    CONSTRAINT pk_tweets PRIMARY KEY(id),
    CONSTRAINT fk_tweets_users FOREIGN KEY(in_reply)
        REFERENCES users(id)
);

-- DML

INSERT INTO users(name)
VALUES ('MIGUEL DE CARVANTES SAAVEDRA'),
('GABRIEL GARCIA MARQUEZ'),
('WILLIAM SHAKESPEARE'),
('EDGAR ALLAN POE'),
('JORGE LUIS BORGES');

INSERT INTO tweets(created_at, text, in_reply)
VALUES
('2018-09-09 17:19:47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse', null),

('2018-09-10 17:19:47', 'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2),

('2018-09-11 17:19:47', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse', null),

('2018-09-12 17:19:47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,', 1),

('2018-09-13 17:19:47', 'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', null),

('2018-09-14 17:19:47', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse', 2),

('2018-09-15 17:19:47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,', null),

('2018-09-16 17:19:47', 'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3),

('2018-09-17 17:19:47', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse', 4),

('2018-09-18 17:19:47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,', null),

('2018-09-19 17:19:47', 'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3),

('2018-09-20 17:19:47', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse', 5),

('2018-09-21 17:19:47', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,', null),

('2018-09-22 17:19:47', 'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 3),

('2018-09-23 17:19:47', 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse', 1);