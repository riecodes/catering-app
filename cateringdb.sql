-- -----------------------------------------------------
-- Schema cateringdb
DROP SCHEMA IF EXISTS cateringdb;
CREATE SCHEMA IF NOT EXISTS cateringdb;
USE cateringdb;

-- -----------------------------------------------------
-- Table Staff Details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS staff_details (
    staff_id VARCHAR(6) PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    staff_role VARCHAR(45)
);

-- -----------------------------------------------------
-- Table Menu Details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS menu_details (
    menuitem_id VARCHAR(5) NOT NULL PRIMARY KEY,
    item_name VARCHAR(45),
    package_type ENUM('A', 'S', 'P','V', 'D'),
    description TEXT
);

-- -----------------------------------------------------
-- Table Package Price
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS package_price (
    package_id ENUM('P001', 'P002', 'P003', 'P004') NOT NULL PRIMARY KEY,
    price_per_head INT,
    package_desc VARCHAR(255)
);

-- -----------------------------------------------------
-- Table Event Details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS event_details (
    event_id VARCHAR(5) NOT NULL PRIMARY KEY,
    package_id ENUM('P001', 'P002', 'P003', 'P004') NOT NULL,
    appetizer_id VARCHAR(5) NOT NULL,
    soup_id VARCHAR(5) NOT NULL,
    pasta_id VARCHAR(5) NOT NULL,
    viand1_id VARCHAR(5) NOT NULL,
    viand2_id VARCHAR(5) NOT NULL,
    viand3_id VARCHAR(5) NOT NULL,
    viand4_id VARCHAR(5) NOT NULL,
    dessert_id VARCHAR(5) NOT NULL,
    FOREIGN KEY (package_id) REFERENCES package_price(package_id),
    FOREIGN KEY (appetizer_id) REFERENCES menu_details(menuitem_id),
    FOREIGN KEY (soup_id) REFERENCES menu_details(menuitem_id),
    FOREIGN KEY (pasta_id) REFERENCES menu_details(menuitem_id),
    FOREIGN KEY (viand1_id) REFERENCES menu_details(menuitem_id),
    FOREIGN KEY (viand2_id) REFERENCES menu_details(menuitem_id),
    FOREIGN KEY (viand3_id) REFERENCES menu_details(menuitem_id),
    FOREIGN KEY (viand4_id) REFERENCES menu_details(menuitem_id),
    FOREIGN KEY (dessert_id) REFERENCES menu_details(menuitem_id)
);

-- -----------------------------------------------------
-- Table Customer Details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS customer_details (
    customer_id INT(5) NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    number BIGINT(10),
    email VARCHAR(45),
    venue ENUM('Caloocan', 'Malabon', 'Navotas', 'Valenzuela', 'Quezon City', 'Marikina', 'Pasig', 'Taguig', 'Makati', 'Manila', 'Mandaluyong', 'San Juan', 'Pasay', 'Parañaque', 'Las Piñas', 'Muntinlupa'),
    no_pax ENUM('30', '60', '80', '100'),
    date DATE,
    time ENUM('10:00-14:00', '17:00-21:00'),
    ptype ENUM('P001', 'P002', 'P003', 'P004'),
    FOREIGN KEY (ptype) REFERENCES package_price(package_id)
);

-- -----------------------------------------------------
-- Table Team Details
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS team_details (
    team_id INT(5) NOT NULL PRIMARY KEY,
    number_of_guests INT(5),
    head_id VARCHAR(6),
    server1_id VARCHAR(6),
    server2_id VARCHAR(6),
    server3_id VARCHAR(6),
    server4_id VARCHAR(6),
    server5_id VARCHAR(6),
    waiter1_id VARCHAR(6),
    waiter2_id VARCHAR(6),
    waiter3_id VARCHAR(6),
    waiter4_id VARCHAR(6),
    waiter5_id VARCHAR(6),
    waiter6_id VARCHAR(6),
    waiter7_id VARCHAR(6),
    waiter8_id VARCHAR(6),
    waiter9_id VARCHAR(6),
    waiter10_id VARCHAR(6),
    transportation1_id VARCHAR(6),
    transportation2_id VARCHAR(6),
    transportation3_id VARCHAR(6),
    transportation4_id VARCHAR(6),
    FOREIGN KEY (head_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (server1_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (server2_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (server3_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (server4_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (server5_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter1_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter2_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter3_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter4_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter5_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter6_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter7_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter8_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter9_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (waiter10_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (transportation1_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (transportation2_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (transportation3_id) REFERENCES staff_details(staff_id),
    FOREIGN KEY (transportation4_id) REFERENCES staff_details(staff_id)
);

-- -----------------------------------------------------
-- Table Schedule Record
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS schedule_record (
    schedule_id VARCHAR(6) NOT NULL PRIMARY KEY,
    event_id VARCHAR(5) NOT NULL,
    time_block ENUM('10:00-14:00', '17:00-21:00'),
    staff_team INT(5) NOT NULL,
    customer_id INT(5),
    extension TINYINT(1),
    is_available TINYINT(1),
    FOREIGN KEY (event_id) REFERENCES event_details(event_id),
    FOREIGN KEY (staff_team) REFERENCES team_details(team_id),
    FOREIGN KEY (customer_id) REFERENCES customer_details(customer_id)
);

-- Insert team details
INSERT INTO staff_details (staff_id, first_name, last_name, staff_role) 
VALUES 
('H0001', 'Juan', 'Santos', 'Head'),
('H0002', 'Maria', 'Cruz', 'Head'),
('S0001', 'Ana', 'Garcia', 'Server'),
('S0002', 'Pedro', 'Fernandez', 'Server'),
('S0003', 'Rosa', 'Gonzales', 'Server'),
('S0004', 'Miguel', 'Torres', 'Server'),
('S0005', 'Sofia', 'Rodriguez', 'Server'),
('S0006', 'Manuel', 'Lopez', 'Server'),
('S0007', 'Elena', 'Martinez', 'Server'),
('S0008', 'Luis', 'Hernandez', 'Server'),
('S0009', 'Carmen', 'Rivera', 'Server'),
('S0010', 'Antonio', 'Dela Cruz', 'Server'),
('W0001', 'Jorge', 'Flores', 'Waiter'),
('W0002', 'Aurora', 'Espino', 'Waiter'),
('W0003', 'Francisco', 'Aquino', 'Waiter'),
('W0004', 'Patricia', 'Reyes', 'Waiter'),
('W0005', 'Ricardo', 'Santos', 'Waiter'),
('W0006', 'Lorna', 'Cruz', 'Waiter'),
('W0007', 'Alejandro', 'Reyes', 'Waiter'),
('W0008', 'Gloria', 'Castillo', 'Waiter'),
('W0009', 'Rafael', 'Dela Cruz', 'Waiter'),
('W0010', 'Estela', 'Reyes', 'Waiter'),
('W0011', 'Agustin', 'Ramos', 'Waiter'),
('W0012', 'Belinda', 'Santos', 'Waiter'),
('W0013', 'Armando', 'Dela Rosa', 'Waiter'),
('W0014', 'Yolanda', 'Reyes', 'Waiter'),
('W0015', 'Ernesto', 'Lim', 'Waiter'),
('W0016', 'Rosario', 'Cruz', 'Waiter'),
('W0017', 'Rodrigo', 'Ramos', 'Waiter'),
('W0018', 'Josefina', 'Santos', 'Waiter'),
('W0019', 'Emiliano', 'Reyes', 'Waiter'),
('W0020', 'Esperanza', 'Cruz', 'Waiter'),
('T0001', 'Ramon', 'Reyes', 'Transportation'),
('T0002', 'Consuelo', 'Cruz', 'Transportation'),
('T0003', 'Roberto', 'Dela Cruz', 'Transportation'),
('T0004', 'Beatriz', 'Santos', 'Transportation'),
('T0005', 'Emilio', 'Reyes', 'Transportation'),
('T0006', 'Veronica', 'Cruz', 'Transportation'),
('T0007', 'Nestor', 'Dela Cruz', 'Transportation'),
('T0008', 'Matilde', 'Santos', 'Transportation');


INSERT INTO menu_details (menuitem_id, item_name, package_type, description) VALUES
('A001', 'Potato Salad', 'A', 'A classic salad featuring potatoes mixed with mayonnaise and various seasonings.'),
('A002', 'Ham & Cheese Slidder', 'A', 'Mini sandwiches filled with ham and cheese, perfect for a quick bite.'),
('S001', 'Creamy Mushroom Soup', 'S', 'A rich and velvety soup made with mushrooms and cream, offering a comforting taste.'),
('S002', 'Creamy Pumpkin Soup', 'S', 'A smooth and indulgent soup crafted from pumpkin, cream, and spices, ideal for autumn.'),
('S003', 'Nido Oriental Soup', 'S', 'A flavorful Asian-inspired soup made with Nido (nest) brand milk and aromatic spices.'),
('S004', 'Chicken and Potato Soup', 'S', 'Hearty soup combining tender chicken and chunks of potato in a savory broth.'),
('S005', 'Crab and Corn Soup', 'S', 'A delightful blend of sweet corn and succulent crab meat in a comforting broth.'),
('P001', 'Baked Macaron', 'P', 'Oven-baked pasta dish layered with cheese and savory sauce for a comforting meal.'),
('P002', 'Creamy Ham & Bacon Carbonara', 'P', 'Pasta dish featuring a creamy sauce with ham and bacon, offering a rich and savory taste.'),
('P003', 'Tuna Carbonara', 'P', 'A twist on the classic carbonara, substituting tuna for traditional meats for a lighter option.'),
('P004', 'Cheesy Macaroni', 'P', 'Macaroni pasta tossed in a creamy cheese sauce, offering a satisfyingly cheesy taste.'),
('P005', 'Pancit Canton', 'P', 'Filipino stir-fried noodles dish typically featuring meat, vegetables, and a savory sauce.'),
('B001', 'Roast Beef with Mushroom Sauce', 'V', 'Tender slices of roast beef served with a flavorful mushroom sauce for a hearty meal.'),
('B002', 'Beef Kare Kare', 'V', 'A Filipino stew featuring tender beef and vegetables cooked in a rich peanut sauce.'),
('B003', 'Creamy Braised Beef', 'V', 'Succulent beef braised until tender and served in a creamy sauce for a luxurious taste.'),
('B004', 'Morcon', 'V', 'Filipino beef roll stuffed with savory fillings like ham, cheese, and vegetables, cooked until tender.'),
('B005', 'Beef Broccoli', 'V', 'Stir-fried dish featuring tender beef slices and crisp broccoli florets in a savory sauce.'),
('B006', 'Beef with Mushroom', 'V', 'Sautéed beef strips cooked with mushrooms in a savory sauce for a satisfying meal.'),
('B007', 'Beef Caldereta', 'V', 'A Filipino stew featuring tender beef simmered in a spicy tomato-based sauce with potatoes and vegetables.'),
('B008', 'Beef Salpicao', 'V', 'A flavorful Filipino dish of marinated beef cubes sautéed until tender and aromatic.'),
('B009', 'Beef Stew', 'V', 'Hearty stew featuring chunks of beef simmered with vegetables in a rich broth.'),
('B010', 'Beef Steak Tagalog', 'V', 'Filipino-style beef steak marinated in a tangy soy sauce mixture and served with onions.'),
('PK001', 'Korean BBQ', 'V', 'Grilled marinated meat served with various side dishes, offering a taste of Korean cuisine.'),
('PK002', 'Liempo BBQ', 'V', 'Filipino-style grilled pork belly marinated in a savory-sweet sauce for a flavorful BBQ experience.'),
('PK003', 'Pork Sisig', 'V', 'A popular Filipino dish made from chopped pork head and liver seasoned with calamansi and chili peppers.'),
('PK004', 'Sweet and Sour Pork', 'V', 'Crispy pork pieces coated in a sweet and tangy sauce with bell peppers and pineapple.'),
('PK005', 'Pork Adobo', 'V', 'Filipino-style pork stewed in a tangy and savory soy sauce and vinegar marinade.'),
('PK006', 'Crispy Pork Binagoongan w/ Talong', 'V', 'Crispy pork belly served with shrimp paste sauce and eggplant for a flavorful combination.'),
('PK007', 'Pork Asado', 'V', 'Filipino-style sweet pork stewed in a savory-sweet sauce with hints of Chinese influence.'),
('PK008', 'Pork Hamonado', 'V', 'Pork dish marinated in a sweet pineapple sauce, offering a delightful balance of flavors.'),
('PK009', 'Breaded Porkchop', 'V', 'Pork chops coated in seasoned breadcrumbs and fried to golden perfection for a crunchy texture.'),
('PK010', 'Embutido', 'V', 'Filipino-style meatloaf made with ground pork, raisins, and various seasonings, steamed or baked until firm.'),
('C001', 'Chicken BBQ', 'V', 'Grilled chicken marinated in a savory-sweet sauce, offering a juicy and flavorful taste.'),
('C002', 'Spicy Chicken', 'V', 'Chicken dish seasoned with spicy seasonings or sauce for a fiery kick.'),
('C003', 'Garlic Chicken', 'V', 'Chicken cooked with garlic and seasonings, offering a savory and aromatic taste.'),
('C004', 'Chicken Cordon Bleu', 'V', 'Chicken breast stuffed with ham and cheese, breaded, and fried or baked to perfection.'),
('C005', 'Chicken Pastel', 'V', 'Filipino-style chicken pot pie made with tender chicken and vegetables in a creamy sauce, topped with a pastry crust.'),
('C006', 'Buttered Chicken', 'V', 'Chicken cooked in a rich and creamy butter sauce for a decadent taste.'),
('C007', 'Chicken Aftritada', 'V', 'Filipino-style chicken stewed in a tomato-based sauce with potatoes, carrots, and bell peppers.'),
('C008', 'Chicken Lollipop', 'V', 'Chicken wings or drumettes prepared to resemble lollipops, seasoned and fried for a tasty appetizer.'),
('C009', 'Chicken Curry', 'V', 'Chicken cooked in a flavorful curry sauce with spices and coconut milk for a fragrant and satisfying dish.'),
('C010', 'Chicken Adobo', 'V', 'Filipino-style chicken stewed in a tangy and savory soy sauce and vinegar marinade.'),
('F001', 'Fish Fillet with Tar Tar Sauce', 'V', 'Crispy fish fillet served with tangy tartar sauce for a delightful seafood experience.'),
('F002', 'Boneless Bangus', 'V', 'Filipino milkfish deboned and marinated, typically grilled or fried to perfection.'),
('F003', 'Fish Fillet w/ Sweet and Sour', 'V', 'Tender fish fillet served in a sweet and tangy sauce with bell peppers and pineapple.'),
('F004', 'Fish Fillet w/ Black Beans', 'V', 'Fish fillet cooked in a savory black bean sauce with garlic and ginger for a flavorful dish.'),
('F005', 'Sinigang na Isda', 'V', 'Filipino sour soup made with fish, tamarind broth, and assorted vegetables for a tangy and refreshing taste.'),
('F006', 'Inihaw na Isda', 'V', 'Filipino grilled fish typically marinated in a mixture of vinegar, soy sauce, and spices before grilling.'),
('V001', 'Chopseuy', 'V', 'A stir-fried vegetable dish featuring a medley of vegetables cooked in a savory sauce.'),
('V002', 'Stir fry Vegetable', 'V', 'Assorted vegetables stir-fried in a flavorful sauce for a simple and nutritious dish.'),
('V003', 'Buttered Vegetable', 'V', 'Assorted vegetables cooked in butter for a simple yet delicious side dish.'),
('V004', 'Steamed Vegetable', 'V', 'Fresh vegetables steamed until tender for a healthy and nutritious option.'),
('V005', 'Tofu Curry', 'V', 'Cubes of tofu cooked in a spicy and aromatic curry sauce with vegetables for a flavorful vegetarian dish.'),
('V006', 'Curry Mix Vegetable', 'V', 'Mixed vegetables cooked in a fragrant curry sauce with spices and coconut milk.'),
('V007', 'Sipo Egg', 'V', 'Filipino dish made with hard-boiled eggs cooked in a rich and creamy sauce with vegetables and ground meat.'),
('V008', 'Gatang Langka', 'V', 'Filipino dish made with young jackfruit cooked in coconut milk with shrimp or meat for a creamy and flavorful dish.'),
('V009', 'Laing', 'V', 'Filipino dish made with taro leaves cooked in coconut milk with chili peppers and shrimp paste for a rich and spicy taste.'),
('D001', 'Buko Pandan', 'D', 'Filipino dessert made with young coconut strips and pandan-flavored gelatin in a creamy coconut sauce.'),
('D002', 'Buko Lychee', 'D', 'Refreshing Filipino dessert made with young coconut strips and lychee fruit in a sweet syrup.'),
('D003', 'Buko Salad', 'D', 'Filipino fruit salad made with young coconut strips, mixed fruits, and cream for a creamy and refreshing dessert.'),
('D004', 'Mango Nata', 'D', 'Filipino dessert made with ripe mangoes and nata de coco in a sweet syrup.'),
('D005', 'Fruit Salad', 'D', 'A medley of fresh fruits mixed with cream or yogurt for a refreshing and healthy dessert.'),
('D006', 'Coffee Jelly', 'D', 'Gelatin dessert made with coffee-infused gelatin cubes served in sweetened cream for a delightful treat.'),
('D007', 'Leche Flan', 'D', 'A creamy caramel custard dessert made with eggs, milk, and sugar, steamed or baked until set and topped with caramel syrup.'),
('D008', 'Refrigerated Cake', 'D', 'A cake made with layers of sponge cake, fruit, and cream, chilled to perfection for a refreshing dessert.'),
('D009', 'Brownies', 'D', 'Rich and fudgy chocolate bars made with cocoa, flour, sugar, and eggs, baked until moist and indulgent.');

INSERT INTO package_price (package_id, price_per_head, package_desc)
VALUES
('P001', 500, '1 Pasta, 3 Viands, Dessert, Iced Tea with tables and chairs'),
('P002', 570, '1 Pasta, 4 Viands, Dessert, Iced Tea with tables and chairs'),
('P003', 600, '1 Pasta, 3 Viands, Appetizer, Dessert with tables and chairs'),
('P004', 750, '1 Pasta, 3 Viands, Soup, Appetizer, Dessert, Iced Tea, with tables and chairs');


INSERT INTO customer_details (customer_id, name, number, email, venue, no_pax, date, time, ptype
)
VALUES
    (100000, 'Kyla Santos', 99842156324, 'kylasantos@gmail.com', 'Mandaluyong', '60', '2024-03-29', '10:00-14:00', 'P001'),
    (200000, 'Sofia Mae', 9958719222, 'sofiamae@yahoo.com', 'Caloocan', '100', '2024-04-29', '10:00-14:00', 'P004');

INSERT INTO event_details (event_id, package_id, appetizer_id, soup_id, pasta_id,
							viand1_id, viand2_id, viand3_id, viand4_id, dessert_id
)
VALUES
    ('E0001', 'P004', 'A001', 'S005', 'P002', 'B002', 'PK002', 'C003', 'F003', 'D004');

INSERT INTO team_details (team_id, number_of_guests, head_id, server1_id, server2_id, server3_id,
						server4_id, server5_id, waiter1_id, waiter2_id, waiter3_id, waiter4_id,
						waiter5_id, waiter6_id, waiter7_id, waiter8_id, waiter9_id, waiter10_id,
						transportation1_id, transportation2_id, transportation3_id, transportation4_id
)
VALUES
    (1, 30, 'H0001', 'S0001', 'S0002', NULL, NULL, NULL, 'W0001', 'W0002', 'W0003', 'W0004', NULL, NULL, NULL, NULL, NULL, NULL, 'T0001', 'T0002', 'T0003', 'T0004'),
    (2, 60, 'H0001', 'S0001', 'S0002', 'S0003', NULL, NULL, 'W0001', 'W0002', 'W0003', 'W0004', 'W0005', 'W0006', NULL, NULL, NULL, NULL, 'T0001', 'T0002', 'T0003', 'T0004'),
    (3, 80, 'H0001', 'S0001', 'S0002', 'S0003', 'S0004', NULL, 'W0001', 'W0002', 'W0003', 'W0004', 'W0005', 'W0006', 'W0007', 'W0008', NULL, NULL, 'T0001', 'T0002', 'T0003', 'T0004'),
    (4, 100, 'H0001', 'S0001', 'S0002', 'S0003', 'S0004', 'S0005', 'W0001', 'W0002', 'W0003', 'W0004', 'W0005', 'W0006', 'W0007', 'W0008', 'W0009', 'W0010', 'T0001', 'T0002', 'T0003', 'T0004'),
    (5, 30, 'H0002', 'S0006', 'S0007', NULL, NULL, NULL, 'W0011', 'W0012', 'W0011', 'W0012', NULL, NULL, NULL, NULL, NULL, NULL, 'T0005', 'T0006', 'T0007', 'T0008'),
    (6, 60, 'H0002', 'S0006', 'S0007', 'S0008', NULL, NULL, 'W0011', 'W0012', 'W0013', 'W0014', 'W0015', 'W0016', NULL, NULL, NULL, NULL, 'T0005', 'T0006', 'T0007', 'T0008'),
    (7, 80, 'H0002', 'S0006', 'S0007', 'S0008', 'S0009', NULL, 'W0011', 'W0012', 'W0013', 'W0014', 'W0015', 'W0016', 'W0017', 'W0018', NULL, NULL, 'T0005', 'T0006', 'T0007', 'T0008'),
    (8, 100, 'H0002', 'S0006', 'S0007', 'S0008', 'S0009', 'S0005', 'W0011', 'W0012', 'W0013', 'W0014', 'W0015', 'W0016', 'W0017', 'W0018', 'W0019', 'W0020', 'T0005', 'T0006', 'T0007', 'T0008');


INSERT INTO schedule_record (schedule_id, event_id, staff_team, time_block, extension, is_available, customer_id
)
VALUES
    ('S0001', 'E0001', 1, '10:00-14:00', 1, NULL, 100000);