CREATE TABLE IF NOT EXISTS person
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL,
    name NVARCHAR(256) NOT NULL,
    national_id NVARCHAR(10) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS student
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    student_number INT NOT NULL UNIQUE,
    major ENUM('CS', 'CE', 'EE', 'ME', 'IE', 'CVE', 'AE', 'MATH') NOT NULL,

    FOREIGN KEY (person_id) REFERENCES person(id)

);

CREATE TABLE IF NOT EXISTS professor
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    personnel_number INT NOT NULL UNIQUE,
    department NVARCHAR(255) NOT NULL,
    academic_rank ENUM('INSTR', 'LECT', 'ASST. PROF', 'ASSOC. PROF', 'DIST. PROF') NOT NULL,

    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE IF NOT EXISTS food
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name NVARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    offer_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS `order` (
    id INT PRIMARY KEY AUTO_INCREMENT,
    person_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE IF NOT EXISTS order_items
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    food_id INT NOT NULL,
    quantity INT NOT NULL,
    price_at_order DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES `order`(id),
    FOREIGN KEY (food_id) REFERENCES food(id)
);


