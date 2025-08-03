INSERT INTO person (username, password, name, national_id) VALUES
('jdoe', 'hashed_password_1', 'John Doe', 1234567890),
('asmith', 'hashed_password_2', 'Alice Smith', 9876543210),
('mjackson', 'hashed_password_3', 'Michael Jackson', 1122334455),
('smarquez', 'hashed_password_4', 'Sofia Marquez', 6677889900),
('tnguyen', 'hashed_password_5', 'Tina Nguyen', 2233445566),
('sjohnson', 'hashed_password_6', 'Sarah Johnson', 3344556677);


INSERT INTO student (person_id, student_number, major) VALUES
((SELECT id FROM person WHERE username = 'jdoe'), 10001, 'CS'),
((SELECT id FROM person WHERE username = 'asmith'), 10002, 'CE');


INSERT INTO professor (person_id, personnel_number, department, academic_rank) VALUES
((SELECT id FROM person WHERE username = 'mjackson'), 5001, 'Computer Science', 'ASST. PROF'),
((SELECT id FROM person WHERE username = 'smarquez'), 5002, 'Electrical Engineering', 'DIST. PROF'),
((SELECT id FROM person WHERE username = 'tnguyen'), 5003, 'Mechanical Engineering', 'LECT');


INSERT INTO food (name, price, offer_date) VALUES
('Spaghetti Bolognese', 12.50, '2025-08-01'),
('Chicken Caesar Salad', 9.75, '2025-08-01'),
('Veggie Burger', 8.99, '2025-08-02'),
('Pizza Margherita', 14.00, '2025-08-03'),
('Sushi Platter', 22.50, '2025-08-03');


INSERT INTO `order` (person_id, total_amount) VALUES
((SELECT id FROM person WHERE username = 'jdoe'), 22.25),
((SELECT id FROM person WHERE username = 'asmith'), 12.50),
((SELECT id FROM person WHERE username = 'smarquez'), 8.99);


INSERT INTO order_items (order_id, food_id, quantity, price_at_order) VALUES
((SELECT id FROM `order` WHERE person_id = (SELECT id FROM person WHERE username = 'jdoe')), (SELECT id FROM food WHERE name = 'Spaghetti Bolognese'), 1, 12.50),
((SELECT id FROM `order` WHERE person_id = (SELECT id FROM person WHERE username = 'jdoe')), (SELECT id FROM food WHERE name = 'Chicken Caesar Salad'), 1, 9.75),
((SELECT id FROM `order` WHERE person_id = (SELECT id FROM person WHERE username = 'asmith')), (SELECT id FROM food WHERE name = 'Spaghetti Bolognese'), 1, 12.50),
((SELECT id FROM `order` WHERE person_id = (SELECT id FROM person WHERE username = 'smarquez')), (SELECT id FROM food WHERE name = 'Veggie Burger'), 1, 8.99);
