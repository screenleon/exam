CREATE DATABASE IF NOT EXISTS `w3resource`;

USE `w3resource`;

CREATE TABLE IF NOT EXISTS `salesman` (
    `salesman_id` INT,
    `name` VARCHAR(20),
    `city` VARCHAR(20),
	`commision` REAL
);

ALTER TABLE `salesman` ADD PRIMARY KEY (`salesman_id`);

ALTER TABLE `salesman` MODIFY `salesman_id` INT NOT NULL AUTO_INCREMENT COMMENT '主鍵', AUTO_INCREMENT=1;

INSERT INTO `salesman` (`name`, `city`, `commision`) VALUES
    ('James Hoog', 'New York', 0.15),
    ('Nail Knite', 'Paris', 0.13),
    ('Pit Alex', 'London', 0.11),
    ('Mc Lyon', 'Paris', 0.14),
    ('Paul Adam', 'Rome', 0.13),
    ('Lauson Hen', 'San Jose', 0.12);

------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `customer` (
    `customer_id` INT,
    `cust_name` VARCHAR(20),
    `city` VARCHAR(20),
    `grade` INT,
    `salesman_id` INT
);

ALTER TABLE `customer` ADD PRIMARY KEY (`customer_id`);

ALTER TABLE `customer` MODIFY `customer_id` INT NOT NULL AUTO_INCREMENT COMMENT '主鍵', AUTO_INCREMENT=1;

ALTER TABLE `customer` ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`);

INSERT INTO `customer` (`cust_name`, `city`, `grade`, `salesman_id`) VALUES
    ('Nick Rimando', 'New York', 100, 1),
    ('Brad Davis', 'New York', 200, 1),
    ('Graham Zusi', 'California', 200, 2),
    ('Julian Green', 'London', 300, 2),
    ('Fabian Johnson', 'Paris', 300, 4),
    ('Geoff Cameron', 'Berlin', 100, 6),
    ('Jozy Altidor', 'Moscow', 200, 5),
    ('Brad Guzan', 'London', NULL, 3);

/*
customer_id |   cust_name    |    city    | grade | salesman_id 
-------------+----------------+------------+-------+-------------
        1 | Nick Rimando   | New York   |   100 |        1
        2 | Brad Davis     | New York   |   200 |        1
        3 | Graham Zusi    | California |   200 |        2
        4 | Julian Green   | London     |   300 |        2
        5 | Fabian Johnson | Paris      |   300 |        4
        6 | Geoff Cameron  | Berlin     |   100 |        6
        7 | Jozy Altidor   | Moscow     |   200 |        5
        8 | Brad Guzan     | London     |       |        3
*/
----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `orders` (
    `ord_no` INT,
    `purch_amt` REAL,
    `ord_date` DATE,
	`customer_id` INT,
    `salesman_id` INT
);

ALTER TABLE `orders` ADD PRIMARY KEY (`ord_no`);

ALTER TABLE `orders` MODIFY `ord_no` INT NOT NULL AUTO_INCREMENT COMMENT '主鍵', AUTO_INCREMENT=1;


ALTER TABLE `orders` ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`salesman_id`) REFERENCES `salesman` (`salesman_id`);

INSERT INTO `orders` (`purch_amt`, `ord_date`, `customer_id`, `salesman_id`) VALUES
    (150.5, '2012-10-05', 3, 2),
    (270.65, '2012-09-10', 8, 3),
    (65.26, '2012-10-05', 1, 1),
    (110.5, '2012-08-17', 6, 6),
    (948.5, '2012-09-10', 3, 2),
    (2400.6, '2012-07-27', 2, 1),
    (5760, '2012-09-10', 1, 1),
    (1983.43, '2020-10-10', 5, 4),
    (2480.4, '2012-10-10', 6, 6),
    (250.45, '2012-06-27', 4, 2),
    (75.29, '2012-08-17', 7, 5),
    (3045.6, '2012-04-25', 1, 1);

---------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `nobel_win` (
    `YEAR` INT NOT NULL,
    `SUBJECT` VARCHAR(20) NOT NULL,
    `WINNER` VARCHAR(40) NOT NULL,
	`COUNTRY` VARCHAR(20) NOT NULL,
    `CATEGORY` VARCHAR(20) NOT NULL
);

INSERT INTO `nobel_win` (`YEAR`, `SUBJECT`, `WINNER`, `COUNTRY`, `CATEGORY`) VALUES
    (1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
    (1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
    (1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
    (1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
    (1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
    (1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
    (1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
    (1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
    (1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
    (1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
    (1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
    (1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
    (1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
    (1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
    (1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
    (1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
    (1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
    (1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
    (1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
    (1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
    (1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
    (1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
    (1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
    (1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');

/*
YEAR SUBJECT                   WINNER                                        COUNTRY                CATEGORY
---- ------------------------- --------------------------------------------- ------------------------- ------------
1970 Physics                   Hannes Alfven                                 Sweden                 Scientist
1970 Physics                   Louis Neel                                    France                 Scientist
1970 Chemistry                 Luis Federico Leloir                          France                 Scientist
1970 Physiology                Ulf von Euler                                 Sweden                 Scientist
1970 Physiology                Bernard Katz                                  Germany                Scientist
1970 Literature                Aleksandr Solzhenitsyn                        Russia                 Linguist
1970 Economics                 Paul Samuelson                                USA                    Economist
1970 Physiology                Julius Axelrod                                USA                    Scientist
1971 Physics                   Dennis Gabor                                  Hungary                Scientist
1971 Chemistry                 Gerhard Herzberg                              Germany                Scientist
1971 Peace                     Willy Brandt                                  Germany                Chancellor
1971 Literature                Pablo Neruda                                  Chile                  Linguist
1971 Economics                 Simon Kuznets                                 Russia                 Economist
1978 Peace                     Anwar al-Sadat                                Egypt                  President
1978 Peace                     Menachem Begin                                Israel                 Prime Minister
1987 Chemistry                 Donald J. Cram                                USA                    Scientist
1987 Chemistry                 Jean-Marie Lehn                               France                 Scientist
1987 Physiology                Susumu Tonegawa                               Japan                  Scientist
1994 Economics                 Reinhard Selten                               Germany                Economist
1994 Peace                     Yitzhak Rabin                                 Israel                 Prime Minister
1987 Physics                   Johannes Georg Bednorz                        Germany                Scientist
1987 Literature                Joseph Brodsky                                Russia                 Linguist
1987 Economics                 Robert Solow                                  USA                    Economist
1994 Literature                Kenzaburo Oe                                  Japan                  Linguist