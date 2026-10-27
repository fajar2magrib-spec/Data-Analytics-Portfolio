-- Retail Sales Database Analysis
-- Run in SQLite (sqlite3 or DB Browser for SQLite)

-- PART 1: CREATE TABLES
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name        TEXT,
    city        TEXT,
    signup_date TEXT
);
CREATE TABLE products (
    product_id  INTEGER PRIMARY KEY,
    name        TEXT,
    category    TEXT,
    price       INTEGER,   -- selling price (Rs)
    cost        INTEGER    -- purchase cost (Rs)
);
CREATE TABLE orders (
    order_id    INTEGER PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date  TEXT       -- YYYY-MM-DD
);
CREATE TABLE order_items (
    item_id     INTEGER PRIMARY KEY,
    order_id    INTEGER REFERENCES orders(order_id),
    product_id  INTEGER REFERENCES products(product_id),
    quantity    INTEGER,
    discount    REAL       -- 0.10 means 10% discount
);

-- PART 2: INSERT DATA
INSERT INTO customers VALUES (1, 'Farhan Chaudhry', 'Faisalabad', '2024-05-10');
INSERT INTO customers VALUES (2, 'Farhan Butt', 'Karachi', '2024-01-20');
INSERT INTO customers VALUES (3, 'Noor Khan', 'Islamabad', '2024-04-30');
INSERT INTO customers VALUES (4, 'Hassan Raza', 'Faisalabad', '2024-07-26');
INSERT INTO customers VALUES (5, 'Asad Raza', 'Lahore', '2024-10-08');
INSERT INTO customers VALUES (6, 'Hassan Butt', 'Faisalabad', '2025-06-27');
INSERT INTO customers VALUES (7, 'Ayesha Butt', 'Faisalabad', '2025-02-22');
INSERT INTO customers VALUES (8, 'Rabia Raza', 'Multan', '2024-07-22');
INSERT INTO customers VALUES (9, 'Asad Qureshi', 'Lahore', '2024-01-11');
INSERT INTO customers VALUES (10, 'Rabia Qureshi', 'Karachi', '2024-04-05');
INSERT INTO customers VALUES (11, 'Noor Siddiqui', 'Karachi', '2025-08-20');
INSERT INTO customers VALUES (12, 'Hira Malik', 'Multan', '2024-10-02');
INSERT INTO customers VALUES (13, 'Omar Khan', 'Multan', '2025-02-18');
INSERT INTO customers VALUES (14, 'Ahmed Sheikh', 'Islamabad', '2024-02-02');
INSERT INTO customers VALUES (15, 'Hassan Khan', 'Karachi', '2024-01-21');
INSERT INTO customers VALUES (16, 'Hassan Malik', 'Karachi', '2025-05-22');
INSERT INTO customers VALUES (17, 'Zainab Chaudhry', 'Karachi', '2024-12-18');
INSERT INTO customers VALUES (18, 'Zainab Qureshi', 'Multan', '2024-07-04');
INSERT INTO customers VALUES (19, 'Hira Sheikh', 'Lahore', '2024-07-09');
INSERT INTO customers VALUES (20, 'Maryam Siddiqui', 'Faisalabad', '2024-02-23');
INSERT INTO customers VALUES (21, 'Maryam Hussain', 'Islamabad', '2024-04-13');
INSERT INTO customers VALUES (22, 'Rabia Siddiqui', 'Karachi', '2024-01-15');
INSERT INTO customers VALUES (23, 'Hira Hussain', 'Karachi', '2025-05-18');
INSERT INTO customers VALUES (24, 'Ayesha Chaudhry', 'Islamabad', '2024-10-06');
INSERT INTO customers VALUES (25, 'Rabia Hussain', 'Faisalabad', '2024-03-17');
INSERT INTO customers VALUES (26, 'Bilal Chaudhry', 'Multan', '2025-03-19');
INSERT INTO customers VALUES (27, 'Hamza Ansari', 'Multan', '2024-04-27');
INSERT INTO customers VALUES (28, 'Saad Chaudhry', 'Karachi', '2024-02-07');
INSERT INTO customers VALUES (29, 'Kiran Ansari', 'Multan', '2024-12-25');
INSERT INTO customers VALUES (30, 'Fatima Malik', 'Faisalabad', '2025-06-21');
INSERT INTO customers VALUES (31, 'Ayesha Ansari', 'Islamabad', '2024-01-17');
INSERT INTO customers VALUES (32, 'Saad Malik', 'Islamabad', '2025-04-28');
INSERT INTO customers VALUES (33, 'Hassan Sheikh', 'Faisalabad', '2024-04-24');
INSERT INTO customers VALUES (34, 'Kiran Malik', 'Faisalabad', '2024-02-25');
INSERT INTO customers VALUES (35, 'Hamza Malik', 'Lahore', '2024-01-11');
INSERT INTO customers VALUES (36, 'Saad Hussain', 'Multan', '2024-06-24');
INSERT INTO customers VALUES (37, 'Ali Qureshi', 'Faisalabad', '2025-03-12');
INSERT INTO customers VALUES (38, 'Zainab Hussain', 'Lahore', '2024-10-22');
INSERT INTO customers VALUES (39, 'Kiran Butt', 'Multan', '2025-05-26');
INSERT INTO customers VALUES (40, 'Omar Hussain', 'Lahore', '2024-05-10');
INSERT INTO products VALUES (1, 'Laptop', 'Electronics', 185000, 150000);
INSERT INTO products VALUES (2, 'Smartphone', 'Electronics', 95000, 78000);
INSERT INTO products VALUES (3, 'Headphones', 'Electronics', 8500, 5500);
INSERT INTO products VALUES (4, 'Smart Watch', 'Electronics', 22000, 15000);
INSERT INTO products VALUES (5, 'Tablet', 'Electronics', 60000, 48000);
INSERT INTO products VALUES (6, 'Office Chair', 'Furniture', 25000, 15000);
INSERT INTO products VALUES (7, 'Study Desk', 'Furniture', 35000, 21000);
INSERT INTO products VALUES (8, 'Bookshelf', 'Furniture', 18000, 10500);
INSERT INTO products VALUES (9, 'Sofa Set', 'Furniture', 120000, 80000);
INSERT INTO products VALUES (10, 'Notebook Pack', 'Stationery', 600, 300);
INSERT INTO products VALUES (11, 'Pen Set', 'Stationery', 450, 200);
INSERT INTO products VALUES (12, 'Printer Paper', 'Stationery', 1800, 1200);
INSERT INTO products VALUES (13, 'Marker Set', 'Stationery', 900, 450);
INSERT INTO products VALUES (14, 'File Folder', 'Stationery', 350, 150);
INSERT INTO products VALUES (15, 'Calculator', 'Stationery', 2200, 1300);
INSERT INTO orders VALUES (1, 20, '2025-01-01');
INSERT INTO orders VALUES (2, 24, '2025-01-03');
INSERT INTO orders VALUES (3, 8, '2025-01-08');
INSERT INTO orders VALUES (4, 29, '2025-01-09');
INSERT INTO orders VALUES (5, 16, '2025-01-16');
INSERT INTO orders VALUES (6, 24, '2025-01-17');
INSERT INTO orders VALUES (7, 20, '2025-01-18');
INSERT INTO orders VALUES (8, 20, '2025-01-20');
INSERT INTO orders VALUES (9, 33, '2025-01-21');
INSERT INTO orders VALUES (10, 17, '2025-01-23');
INSERT INTO orders VALUES (11, 3, '2025-01-23');
INSERT INTO orders VALUES (12, 30, '2025-01-23');
INSERT INTO orders VALUES (13, 28, '2025-01-26');
INSERT INTO orders VALUES (14, 6, '2025-01-27');
INSERT INTO orders VALUES (15, 12, '2025-01-28');
INSERT INTO orders VALUES (16, 15, '2025-02-04');
INSERT INTO orders VALUES (17, 12, '2025-02-05');
INSERT INTO orders VALUES (18, 30, '2025-02-05');
INSERT INTO orders VALUES (19, 24, '2025-02-09');
INSERT INTO orders VALUES (20, 2, '2025-02-10');
INSERT INTO orders VALUES (21, 15, '2025-02-11');
INSERT INTO orders VALUES (22, 32, '2025-02-12');
INSERT INTO orders VALUES (23, 34, '2025-02-12');
INSERT INTO orders VALUES (24, 34, '2025-02-15');
INSERT INTO orders VALUES (25, 18, '2025-02-18');
INSERT INTO orders VALUES (26, 12, '2025-02-19');
INSERT INTO orders VALUES (27, 22, '2025-02-19');
INSERT INTO orders VALUES (28, 24, '2025-02-20');
INSERT INTO orders VALUES (29, 20, '2025-02-22');
INSERT INTO orders VALUES (30, 6, '2025-02-22');
INSERT INTO orders VALUES (31, 20, '2025-02-23');
INSERT INTO orders VALUES (32, 22, '2025-02-24');
INSERT INTO orders VALUES (33, 2, '2025-02-24');
INSERT INTO orders VALUES (34, 10, '2025-02-26');
INSERT INTO orders VALUES (35, 21, '2025-02-28');
INSERT INTO orders VALUES (36, 12, '2025-03-01');
INSERT INTO orders VALUES (37, 12, '2025-03-01');
INSERT INTO orders VALUES (38, 20, '2025-03-01');
INSERT INTO orders VALUES (39, 29, '2025-03-04');
INSERT INTO orders VALUES (40, 9, '2025-03-05');
INSERT INTO orders VALUES (41, 9, '2025-03-05');
INSERT INTO orders VALUES (42, 32, '2025-03-07');
INSERT INTO orders VALUES (43, 34, '2025-03-12');
INSERT INTO orders VALUES (44, 10, '2025-03-14');
INSERT INTO orders VALUES (45, 2, '2025-03-15');
INSERT INTO orders VALUES (46, 13, '2025-03-16');
INSERT INTO orders VALUES (47, 12, '2025-03-16');
INSERT INTO orders VALUES (48, 9, '2025-03-17');
INSERT INTO orders VALUES (49, 10, '2025-03-18');
INSERT INTO orders VALUES (50, 32, '2025-03-20');
INSERT INTO orders VALUES (51, 24, '2025-03-20');
INSERT INTO orders VALUES (52, 2, '2025-03-21');
INSERT INTO orders VALUES (53, 15, '2025-03-21');
INSERT INTO orders VALUES (54, 2, '2025-03-24');
INSERT INTO orders VALUES (55, 25, '2025-03-25');
INSERT INTO orders VALUES (56, 11, '2025-03-27');
INSERT INTO orders VALUES (57, 33, '2025-03-27');
INSERT INTO orders VALUES (58, 1, '2025-03-27');
INSERT INTO orders VALUES (59, 15, '2025-03-28');
INSERT INTO orders VALUES (60, 25, '2025-04-01');
INSERT INTO orders VALUES (61, 7, '2025-04-01');
INSERT INTO orders VALUES (62, 2, '2025-04-02');
INSERT INTO orders VALUES (63, 6, '2025-04-02');
INSERT INTO orders VALUES (64, 1, '2025-04-05');
INSERT INTO orders VALUES (65, 25, '2025-04-09');
INSERT INTO orders VALUES (66, 18, '2025-04-10');
INSERT INTO orders VALUES (67, 2, '2025-04-11');
INSERT INTO orders VALUES (68, 26, '2025-04-11');
INSERT INTO orders VALUES (69, 13, '2025-04-13');
INSERT INTO orders VALUES (70, 20, '2025-04-14');
INSERT INTO orders VALUES (71, 25, '2025-04-15');
INSERT INTO orders VALUES (72, 29, '2025-04-16');
INSERT INTO orders VALUES (73, 20, '2025-04-16');
INSERT INTO orders VALUES (74, 24, '2025-04-18');
INSERT INTO orders VALUES (75, 20, '2025-04-19');
INSERT INTO orders VALUES (76, 20, '2025-04-20');
INSERT INTO orders VALUES (77, 20, '2025-04-22');
INSERT INTO orders VALUES (78, 10, '2025-04-25');
INSERT INTO orders VALUES (79, 25, '2025-04-25');
INSERT INTO orders VALUES (80, 18, '2025-04-25');
INSERT INTO orders VALUES (81, 5, '2025-04-25');
INSERT INTO orders VALUES (82, 2, '2025-04-27');
INSERT INTO orders VALUES (83, 24, '2025-05-02');
INSERT INTO orders VALUES (84, 19, '2025-05-04');
INSERT INTO orders VALUES (85, 10, '2025-05-04');
INSERT INTO orders VALUES (86, 10, '2025-05-07');
INSERT INTO orders VALUES (87, 3, '2025-05-14');
INSERT INTO orders VALUES (88, 20, '2025-05-14');
INSERT INTO orders VALUES (89, 18, '2025-05-18');
INSERT INTO orders VALUES (90, 12, '2025-05-21');
INSERT INTO orders VALUES (91, 20, '2025-05-21');
INSERT INTO orders VALUES (92, 20, '2025-05-26');
INSERT INTO orders VALUES (93, 20, '2025-06-03');
INSERT INTO orders VALUES (94, 31, '2025-06-04');
INSERT INTO orders VALUES (95, 13, '2025-06-05');
INSERT INTO orders VALUES (96, 20, '2025-06-08');
INSERT INTO orders VALUES (97, 20, '2025-06-08');
INSERT INTO orders VALUES (98, 10, '2025-06-09');
INSERT INTO orders VALUES (99, 20, '2025-06-11');
INSERT INTO orders VALUES (100, 24, '2025-06-12');
INSERT INTO orders VALUES (101, 24, '2025-06-17');
INSERT INTO orders VALUES (102, 10, '2025-06-20');
INSERT INTO orders VALUES (103, 22, '2025-06-20');
INSERT INTO orders VALUES (104, 2, '2025-06-20');
INSERT INTO orders VALUES (105, 20, '2025-06-21');
INSERT INTO orders VALUES (106, 23, '2025-06-21');
INSERT INTO orders VALUES (107, 25, '2025-06-23');
INSERT INTO orders VALUES (108, 29, '2025-06-25');
INSERT INTO orders VALUES (109, 34, '2025-06-26');
INSERT INTO orders VALUES (110, 25, '2025-06-27');
INSERT INTO orders VALUES (111, 10, '2025-06-28');
INSERT INTO orders VALUES (112, 2, '2025-07-01');
INSERT INTO orders VALUES (113, 9, '2025-07-04');
INSERT INTO orders VALUES (114, 30, '2025-07-05');
INSERT INTO orders VALUES (115, 24, '2025-07-06');
INSERT INTO orders VALUES (116, 2, '2025-07-09');
INSERT INTO orders VALUES (117, 30, '2025-07-09');
INSERT INTO orders VALUES (118, 24, '2025-07-10');
INSERT INTO orders VALUES (119, 22, '2025-07-13');
INSERT INTO orders VALUES (120, 14, '2025-07-14');
INSERT INTO orders VALUES (121, 25, '2025-07-16');
INSERT INTO orders VALUES (122, 8, '2025-07-17');
INSERT INTO orders VALUES (123, 8, '2025-07-17');
INSERT INTO orders VALUES (124, 8, '2025-07-21');
INSERT INTO orders VALUES (125, 25, '2025-07-22');
INSERT INTO orders VALUES (126, 9, '2025-07-22');
INSERT INTO orders VALUES (127, 15, '2025-07-23');
INSERT INTO orders VALUES (128, 6, '2025-07-23');
INSERT INTO orders VALUES (129, 20, '2025-07-25');
INSERT INTO orders VALUES (130, 17, '2025-07-28');
INSERT INTO orders VALUES (131, 17, '2025-08-01');
INSERT INTO orders VALUES (132, 20, '2025-08-01');
INSERT INTO orders VALUES (133, 20, '2025-08-04');
INSERT INTO orders VALUES (134, 15, '2025-08-05');
INSERT INTO orders VALUES (135, 2, '2025-08-05');
INSERT INTO orders VALUES (136, 34, '2025-08-06');
INSERT INTO orders VALUES (137, 3, '2025-08-08');
INSERT INTO orders VALUES (138, 26, '2025-08-10');
INSERT INTO orders VALUES (139, 8, '2025-08-14');
INSERT INTO orders VALUES (140, 17, '2025-08-16');
INSERT INTO orders VALUES (141, 6, '2025-08-20');
INSERT INTO orders VALUES (142, 24, '2025-08-25');
INSERT INTO orders VALUES (143, 6, '2025-08-28');
INSERT INTO orders VALUES (144, 8, '2025-09-02');
INSERT INTO orders VALUES (145, 8, '2025-09-03');
INSERT INTO orders VALUES (146, 18, '2025-09-04');
INSERT INTO orders VALUES (147, 6, '2025-09-05');
INSERT INTO orders VALUES (148, 29, '2025-09-06');
INSERT INTO orders VALUES (149, 12, '2025-09-07');
INSERT INTO orders VALUES (150, 24, '2025-09-08');
INSERT INTO orders VALUES (151, 28, '2025-09-10');
INSERT INTO orders VALUES (152, 20, '2025-09-11');
INSERT INTO orders VALUES (153, 2, '2025-09-12');
INSERT INTO orders VALUES (154, 10, '2025-09-12');
INSERT INTO orders VALUES (155, 17, '2025-09-13');
INSERT INTO orders VALUES (156, 25, '2025-09-14');
INSERT INTO orders VALUES (157, 24, '2025-09-14');
INSERT INTO orders VALUES (158, 24, '2025-09-18');
INSERT INTO orders VALUES (159, 10, '2025-09-19');
INSERT INTO orders VALUES (160, 18, '2025-09-19');
INSERT INTO orders VALUES (161, 3, '2025-09-19');
INSERT INTO orders VALUES (162, 15, '2025-09-20');
INSERT INTO orders VALUES (163, 13, '2025-09-23');
INSERT INTO orders VALUES (164, 2, '2025-09-24');
INSERT INTO orders VALUES (165, 17, '2025-09-25');
INSERT INTO orders VALUES (166, 17, '2025-09-26');
INSERT INTO orders VALUES (167, 29, '2025-09-27');
INSERT INTO orders VALUES (168, 30, '2025-09-28');
INSERT INTO orders VALUES (169, 20, '2025-09-28');
INSERT INTO orders VALUES (170, 2, '2025-09-28');
INSERT INTO orders VALUES (171, 30, '2025-09-28');
INSERT INTO orders VALUES (172, 7, '2025-10-04');
INSERT INTO orders VALUES (173, 20, '2025-10-15');
INSERT INTO orders VALUES (174, 17, '2025-10-16');
INSERT INTO orders VALUES (175, 8, '2025-10-19');
INSERT INTO orders VALUES (176, 24, '2025-10-19');
INSERT INTO orders VALUES (177, 12, '2025-10-21');
INSERT INTO orders VALUES (178, 24, '2025-10-26');
INSERT INTO orders VALUES (179, 24, '2025-10-27');
INSERT INTO orders VALUES (180, 15, '2025-10-28');
INSERT INTO orders VALUES (181, 20, '2025-11-03');
INSERT INTO orders VALUES (182, 28, '2025-11-03');
INSERT INTO orders VALUES (183, 34, '2025-11-03');
INSERT INTO orders VALUES (184, 1, '2025-11-04');
INSERT INTO orders VALUES (185, 15, '2025-11-04');
INSERT INTO orders VALUES (186, 15, '2025-11-05');
INSERT INTO orders VALUES (187, 12, '2025-11-06');
INSERT INTO orders VALUES (188, 6, '2025-11-06');
INSERT INTO orders VALUES (189, 14, '2025-11-11');
INSERT INTO orders VALUES (190, 29, '2025-11-13');
INSERT INTO orders VALUES (191, 29, '2025-11-14');
INSERT INTO orders VALUES (192, 6, '2025-11-15');
INSERT INTO orders VALUES (193, 24, '2025-11-16');
INSERT INTO orders VALUES (194, 9, '2025-11-16');
INSERT INTO orders VALUES (195, 21, '2025-11-17');
INSERT INTO orders VALUES (196, 11, '2025-11-17');
INSERT INTO orders VALUES (197, 3, '2025-11-17');
INSERT INTO orders VALUES (198, 20, '2025-11-19');
INSERT INTO orders VALUES (199, 2, '2025-11-20');
INSERT INTO orders VALUES (200, 29, '2025-11-21');
INSERT INTO orders VALUES (201, 6, '2025-11-23');
INSERT INTO orders VALUES (202, 20, '2025-11-24');
INSERT INTO orders VALUES (203, 10, '2025-11-25');
INSERT INTO orders VALUES (204, 18, '2025-11-28');
INSERT INTO orders VALUES (205, 9, '2025-11-28');
INSERT INTO orders VALUES (206, 20, '2025-12-01');
INSERT INTO orders VALUES (207, 6, '2025-12-01');
INSERT INTO orders VALUES (208, 2, '2025-12-02');
INSERT INTO orders VALUES (209, 6, '2025-12-03');
INSERT INTO orders VALUES (210, 28, '2025-12-04');
INSERT INTO orders VALUES (211, 20, '2025-12-04');
INSERT INTO orders VALUES (212, 25, '2025-12-04');
INSERT INTO orders VALUES (213, 29, '2025-12-06');
INSERT INTO orders VALUES (214, 24, '2025-12-06');
INSERT INTO orders VALUES (215, 18, '2025-12-11');
INSERT INTO orders VALUES (216, 34, '2025-12-12');
INSERT INTO orders VALUES (217, 3, '2025-12-12');
INSERT INTO orders VALUES (218, 26, '2025-12-13');
INSERT INTO orders VALUES (219, 29, '2025-12-13');
INSERT INTO orders VALUES (220, 12, '2025-12-14');
INSERT INTO orders VALUES (221, 15, '2025-12-14');
INSERT INTO orders VALUES (222, 8, '2025-12-15');
INSERT INTO orders VALUES (223, 23, '2025-12-15');
INSERT INTO orders VALUES (224, 2, '2025-12-15');
INSERT INTO orders VALUES (225, 2, '2025-12-16');
INSERT INTO orders VALUES (226, 25, '2025-12-17');
INSERT INTO orders VALUES (227, 21, '2025-12-18');
INSERT INTO orders VALUES (228, 20, '2025-12-18');
INSERT INTO orders VALUES (229, 24, '2025-12-21');
INSERT INTO orders VALUES (230, 6, '2025-12-22');
INSERT INTO orders VALUES (231, 6, '2025-12-22');
INSERT INTO orders VALUES (232, 10, '2025-12-23');
INSERT INTO orders VALUES (233, 9, '2025-12-23');
INSERT INTO orders VALUES (234, 24, '2025-12-26');
INSERT INTO orders VALUES (235, 13, '2025-12-26');
INSERT INTO orders VALUES (236, 30, '2025-12-26');
INSERT INTO orders VALUES (237, 2, '2025-12-27');
INSERT INTO orders VALUES (238, 6, '2025-12-27');
INSERT INTO orders VALUES (239, 29, '2025-12-28');
INSERT INTO orders VALUES (240, 23, '2025-12-28');
INSERT INTO order_items VALUES (1, 1, 6, 1, 0.1);
INSERT INTO order_items VALUES (2, 1, 9, 2, 0.0);
INSERT INTO order_items VALUES (3, 2, 1, 2, 0.0);
INSERT INTO order_items VALUES (4, 3, 14, 4, 0.0);
INSERT INTO order_items VALUES (5, 3, 2, 2, 0.05);
INSERT INTO order_items VALUES (6, 4, 11, 4, 0.0);
INSERT INTO order_items VALUES (7, 5, 5, 2, 0.1);
INSERT INTO order_items VALUES (8, 6, 12, 2, 0.0);
INSERT INTO order_items VALUES (9, 6, 15, 3, 0.1);
INSERT INTO order_items VALUES (10, 7, 7, 2, 0.0);
INSERT INTO order_items VALUES (11, 7, 9, 2, 0.1);
INSERT INTO order_items VALUES (12, 8, 8, 3, 0.05);
INSERT INTO order_items VALUES (13, 9, 15, 4, 0.0);
INSERT INTO order_items VALUES (14, 10, 13, 4, 0.2);
INSERT INTO order_items VALUES (15, 11, 15, 2, 0.0);
INSERT INTO order_items VALUES (16, 11, 7, 2, 0.1);
INSERT INTO order_items VALUES (17, 12, 4, 2, 0.0);
INSERT INTO order_items VALUES (18, 12, 1, 1, 0.0);
INSERT INTO order_items VALUES (19, 13, 4, 2, 0.2);
INSERT INTO order_items VALUES (20, 13, 15, 4, 0.1);
INSERT INTO order_items VALUES (21, 13, 2, 2, 0.2);
INSERT INTO order_items VALUES (22, 14, 2, 2, 0.05);
INSERT INTO order_items VALUES (23, 15, 3, 2, 0.0);
INSERT INTO order_items VALUES (24, 15, 8, 4, 0.0);
INSERT INTO order_items VALUES (25, 16, 12, 2, 0.0);
INSERT INTO order_items VALUES (26, 16, 1, 2, 0.0);
INSERT INTO order_items VALUES (27, 16, 8, 1, 0.0);
INSERT INTO order_items VALUES (28, 17, 12, 1, 0.2);
INSERT INTO order_items VALUES (29, 18, 1, 1, 0.2);
INSERT INTO order_items VALUES (30, 18, 14, 2, 0.0);
INSERT INTO order_items VALUES (31, 18, 12, 1, 0.0);
INSERT INTO order_items VALUES (32, 19, 10, 3, 0.1);
INSERT INTO order_items VALUES (33, 20, 6, 2, 0.1);
INSERT INTO order_items VALUES (34, 21, 11, 1, 0.0);
INSERT INTO order_items VALUES (35, 22, 2, 1, 0.0);
INSERT INTO order_items VALUES (36, 22, 14, 4, 0.0);
INSERT INTO order_items VALUES (37, 23, 14, 3, 0.2);
INSERT INTO order_items VALUES (38, 24, 2, 2, 0.0);
INSERT INTO order_items VALUES (39, 25, 8, 3, 0.0);
INSERT INTO order_items VALUES (40, 26, 14, 3, 0.0);
INSERT INTO order_items VALUES (41, 27, 6, 2, 0.0);
INSERT INTO order_items VALUES (42, 28, 3, 4, 0.05);
INSERT INTO order_items VALUES (43, 28, 15, 3, 0.05);
INSERT INTO order_items VALUES (44, 29, 9, 1, 0.0);
INSERT INTO order_items VALUES (45, 30, 5, 2, 0.1);
INSERT INTO order_items VALUES (46, 31, 3, 2, 0.0);
INSERT INTO order_items VALUES (47, 32, 6, 2, 0.1);
INSERT INTO order_items VALUES (48, 32, 8, 2, 0.0);
INSERT INTO order_items VALUES (49, 33, 3, 2, 0.1);
INSERT INTO order_items VALUES (50, 34, 4, 2, 0.0);
INSERT INTO order_items VALUES (51, 34, 1, 1, 0.2);
INSERT INTO order_items VALUES (52, 35, 11, 1, 0.2);
INSERT INTO order_items VALUES (53, 36, 11, 4, 0.0);
INSERT INTO order_items VALUES (54, 36, 10, 2, 0.0);
INSERT INTO order_items VALUES (55, 36, 1, 1, 0.1);
INSERT INTO order_items VALUES (56, 37, 13, 3, 0.0);
INSERT INTO order_items VALUES (57, 38, 11, 1, 0.1);
INSERT INTO order_items VALUES (58, 39, 15, 1, 0.0);
INSERT INTO order_items VALUES (59, 40, 7, 2, 0.05);
INSERT INTO order_items VALUES (60, 41, 12, 2, 0.0);
INSERT INTO order_items VALUES (61, 41, 7, 2, 0.0);
INSERT INTO order_items VALUES (62, 42, 8, 1, 0.0);
INSERT INTO order_items VALUES (63, 43, 7, 1, 0.0);
INSERT INTO order_items VALUES (64, 43, 9, 2, 0.05);
INSERT INTO order_items VALUES (65, 44, 2, 2, 0.05);
INSERT INTO order_items VALUES (66, 45, 1, 2, 0.0);
INSERT INTO order_items VALUES (67, 46, 3, 2, 0.0);
INSERT INTO order_items VALUES (68, 46, 5, 2, 0.0);
INSERT INTO order_items VALUES (69, 47, 1, 1, 0.0);
INSERT INTO order_items VALUES (70, 47, 10, 4, 0.0);
INSERT INTO order_items VALUES (71, 48, 8, 4, 0.1);
INSERT INTO order_items VALUES (72, 49, 2, 2, 0.0);
INSERT INTO order_items VALUES (73, 50, 8, 2, 0.05);
INSERT INTO order_items VALUES (74, 51, 5, 1, 0.0);
INSERT INTO order_items VALUES (75, 51, 14, 1, 0.0);
INSERT INTO order_items VALUES (76, 52, 13, 3, 0.0);
INSERT INTO order_items VALUES (77, 53, 8, 4, 0.0);
INSERT INTO order_items VALUES (78, 53, 13, 4, 0.0);
INSERT INTO order_items VALUES (79, 53, 5, 2, 0.0);
INSERT INTO order_items VALUES (80, 54, 6, 2, 0.0);
INSERT INTO order_items VALUES (81, 54, 11, 1, 0.0);
INSERT INTO order_items VALUES (82, 55, 6, 1, 0.0);
INSERT INTO order_items VALUES (83, 55, 12, 3, 0.0);
INSERT INTO order_items VALUES (84, 55, 4, 2, 0.05);
INSERT INTO order_items VALUES (85, 56, 6, 1, 0.0);
INSERT INTO order_items VALUES (86, 56, 8, 2, 0.05);
INSERT INTO order_items VALUES (87, 57, 14, 1, 0.05);
INSERT INTO order_items VALUES (88, 58, 14, 4, 0.2);
INSERT INTO order_items VALUES (89, 59, 4, 2, 0.0);
INSERT INTO order_items VALUES (90, 60, 1, 1, 0.0);
INSERT INTO order_items VALUES (91, 61, 9, 2, 0.05);
INSERT INTO order_items VALUES (92, 61, 6, 2, 0.0);
INSERT INTO order_items VALUES (93, 62, 3, 2, 0.0);
INSERT INTO order_items VALUES (94, 63, 6, 2, 0.0);
INSERT INTO order_items VALUES (95, 63, 3, 3, 0.0);
INSERT INTO order_items VALUES (96, 64, 9, 2, 0.2);
INSERT INTO order_items VALUES (97, 64, 14, 4, 0.05);
INSERT INTO order_items VALUES (98, 65, 1, 1, 0.0);
INSERT INTO order_items VALUES (99, 66, 8, 3, 0.2);
INSERT INTO order_items VALUES (100, 66, 6, 2, 0.1);
INSERT INTO order_items VALUES (101, 66, 11, 4, 0.1);
INSERT INTO order_items VALUES (102, 67, 9, 2, 0.2);
INSERT INTO order_items VALUES (103, 67, 12, 2, 0.0);
INSERT INTO order_items VALUES (104, 68, 12, 4, 0.0);
INSERT INTO order_items VALUES (105, 68, 5, 1, 0.0);
INSERT INTO order_items VALUES (106, 69, 7, 1, 0.0);
INSERT INTO order_items VALUES (107, 70, 1, 2, 0.1);
INSERT INTO order_items VALUES (108, 71, 10, 1, 0.1);
INSERT INTO order_items VALUES (109, 71, 14, 1, 0.0);
INSERT INTO order_items VALUES (110, 72, 11, 3, 0.05);
INSERT INTO order_items VALUES (111, 73, 10, 4, 0.0);
INSERT INTO order_items VALUES (112, 73, 11, 2, 0.05);
INSERT INTO order_items VALUES (113, 74, 9, 2, 0.05);
INSERT INTO order_items VALUES (114, 74, 7, 2, 0.0);
INSERT INTO order_items VALUES (115, 75, 11, 4, 0.05);
INSERT INTO order_items VALUES (116, 75, 12, 1, 0.1);
INSERT INTO order_items VALUES (117, 75, 7, 2, 0.0);
INSERT INTO order_items VALUES (118, 76, 4, 2, 0.0);
INSERT INTO order_items VALUES (119, 77, 3, 4, 0.0);
INSERT INTO order_items VALUES (120, 77, 1, 2, 0.1);
INSERT INTO order_items VALUES (121, 78, 5, 2, 0.0);
INSERT INTO order_items VALUES (122, 79, 12, 4, 0.0);
INSERT INTO order_items VALUES (123, 80, 4, 2, 0.0);
INSERT INTO order_items VALUES (124, 80, 10, 2, 0.0);
INSERT INTO order_items VALUES (125, 81, 2, 1, 0.0);
INSERT INTO order_items VALUES (126, 81, 3, 3, 0.0);
INSERT INTO order_items VALUES (127, 81, 7, 2, 0.2);
INSERT INTO order_items VALUES (128, 82, 5, 1, 0.0);
INSERT INTO order_items VALUES (129, 83, 7, 1, 0.1);
INSERT INTO order_items VALUES (130, 84, 11, 4, 0.0);
INSERT INTO order_items VALUES (131, 85, 5, 1, 0.0);
INSERT INTO order_items VALUES (132, 85, 14, 2, 0.0);
INSERT INTO order_items VALUES (133, 86, 6, 1, 0.0);
INSERT INTO order_items VALUES (134, 86, 10, 2, 0.1);
INSERT INTO order_items VALUES (135, 86, 2, 2, 0.0);
INSERT INTO order_items VALUES (136, 87, 10, 4, 0.1);
INSERT INTO order_items VALUES (137, 87, 9, 1, 0.1);
INSERT INTO order_items VALUES (138, 87, 4, 2, 0.0);
INSERT INTO order_items VALUES (139, 88, 3, 3, 0.0);
INSERT INTO order_items VALUES (140, 88, 7, 2, 0.0);
INSERT INTO order_items VALUES (141, 89, 7, 1, 0.1);
INSERT INTO order_items VALUES (142, 90, 13, 3, 0.0);
INSERT INTO order_items VALUES (143, 91, 11, 2, 0.0);
INSERT INTO order_items VALUES (144, 92, 6, 1, 0.0);
INSERT INTO order_items VALUES (145, 92, 12, 4, 0.0);
INSERT INTO order_items VALUES (146, 93, 11, 2, 0.05);
INSERT INTO order_items VALUES (147, 93, 10, 2, 0.0);
INSERT INTO order_items VALUES (148, 94, 15, 4, 0.2);
INSERT INTO order_items VALUES (149, 95, 10, 3, 0.05);
INSERT INTO order_items VALUES (150, 95, 13, 1, 0.0);
INSERT INTO order_items VALUES (151, 96, 8, 1, 0.0);
INSERT INTO order_items VALUES (152, 97, 11, 1, 0.05);
INSERT INTO order_items VALUES (153, 98, 11, 2, 0.0);
INSERT INTO order_items VALUES (154, 99, 9, 2, 0.0);
INSERT INTO order_items VALUES (155, 99, 12, 4, 0.0);
INSERT INTO order_items VALUES (156, 99, 4, 1, 0.0);
INSERT INTO order_items VALUES (157, 100, 13, 4, 0.2);
INSERT INTO order_items VALUES (158, 100, 4, 2, 0.0);
INSERT INTO order_items VALUES (159, 100, 14, 3, 0.1);
INSERT INTO order_items VALUES (160, 101, 7, 1, 0.1);
INSERT INTO order_items VALUES (161, 101, 3, 1, 0.0);
INSERT INTO order_items VALUES (162, 101, 1, 2, 0.0);
INSERT INTO order_items VALUES (163, 102, 7, 2, 0.0);
INSERT INTO order_items VALUES (164, 102, 12, 3, 0.1);
INSERT INTO order_items VALUES (165, 103, 15, 3, 0.0);
INSERT INTO order_items VALUES (166, 104, 7, 1, 0.0);
INSERT INTO order_items VALUES (167, 105, 10, 4, 0.1);
INSERT INTO order_items VALUES (168, 106, 13, 3, 0.0);
INSERT INTO order_items VALUES (169, 106, 14, 4, 0.1);
INSERT INTO order_items VALUES (170, 107, 6, 1, 0.0);
INSERT INTO order_items VALUES (171, 108, 1, 1, 0.1);
INSERT INTO order_items VALUES (172, 108, 2, 1, 0.0);
INSERT INTO order_items VALUES (173, 109, 10, 3, 0.0);
INSERT INTO order_items VALUES (174, 110, 5, 2, 0.0);
INSERT INTO order_items VALUES (175, 110, 4, 1, 0.0);
INSERT INTO order_items VALUES (176, 110, 10, 1, 0.05);
INSERT INTO order_items VALUES (177, 111, 15, 2, 0.0);
INSERT INTO order_items VALUES (178, 111, 11, 3, 0.0);
INSERT INTO order_items VALUES (179, 112, 12, 4, 0.0);
INSERT INTO order_items VALUES (180, 113, 8, 4, 0.0);
INSERT INTO order_items VALUES (181, 114, 14, 1, 0.1);
INSERT INTO order_items VALUES (182, 115, 8, 4, 0.1);
INSERT INTO order_items VALUES (183, 115, 3, 2, 0.05);
INSERT INTO order_items VALUES (184, 116, 15, 1, 0.1);
INSERT INTO order_items VALUES (185, 116, 13, 4, 0.05);
INSERT INTO order_items VALUES (186, 117, 7, 2, 0.05);
INSERT INTO order_items VALUES (187, 117, 8, 3, 0.0);
INSERT INTO order_items VALUES (188, 117, 5, 2, 0.0);
INSERT INTO order_items VALUES (189, 118, 1, 1, 0.0);
INSERT INTO order_items VALUES (190, 119, 10, 1, 0.05);
INSERT INTO order_items VALUES (191, 120, 15, 3, 0.0);
INSERT INTO order_items VALUES (192, 120, 13, 2, 0.0);
INSERT INTO order_items VALUES (193, 121, 12, 3, 0.0);
INSERT INTO order_items VALUES (194, 121, 7, 2, 0.05);
INSERT INTO order_items VALUES (195, 122, 10, 2, 0.0);
INSERT INTO order_items VALUES (196, 123, 14, 1, 0.2);
INSERT INTO order_items VALUES (197, 124, 15, 4, 0.05);
INSERT INTO order_items VALUES (198, 125, 4, 2, 0.0);
INSERT INTO order_items VALUES (199, 126, 14, 2, 0.0);
INSERT INTO order_items VALUES (200, 126, 9, 1, 0.1);
INSERT INTO order_items VALUES (201, 127, 3, 4, 0.0);
INSERT INTO order_items VALUES (202, 127, 7, 2, 0.0);
INSERT INTO order_items VALUES (203, 128, 5, 2, 0.05);
INSERT INTO order_items VALUES (204, 128, 12, 3, 0.2);
INSERT INTO order_items VALUES (205, 129, 15, 1, 0.0);
INSERT INTO order_items VALUES (206, 129, 10, 1, 0.0);
INSERT INTO order_items VALUES (207, 129, 1, 1, 0.1);
INSERT INTO order_items VALUES (208, 130, 4, 2, 0.0);
INSERT INTO order_items VALUES (209, 131, 14, 1, 0.05);
INSERT INTO order_items VALUES (210, 132, 5, 2, 0.05);
INSERT INTO order_items VALUES (211, 132, 1, 1, 0.0);
INSERT INTO order_items VALUES (212, 132, 11, 2, 0.0);
INSERT INTO order_items VALUES (213, 133, 4, 2, 0.05);
INSERT INTO order_items VALUES (214, 133, 1, 1, 0.05);
INSERT INTO order_items VALUES (215, 133, 14, 1, 0.0);
INSERT INTO order_items VALUES (216, 134, 12, 1, 0.0);
INSERT INTO order_items VALUES (217, 135, 14, 3, 0.0);
INSERT INTO order_items VALUES (218, 136, 11, 3, 0.0);
INSERT INTO order_items VALUES (219, 136, 3, 2, 0.0);
INSERT INTO order_items VALUES (220, 137, 6, 1, 0.2);
INSERT INTO order_items VALUES (221, 137, 10, 2, 0.0);
INSERT INTO order_items VALUES (222, 138, 9, 1, 0.0);
INSERT INTO order_items VALUES (223, 139, 10, 2, 0.0);
INSERT INTO order_items VALUES (224, 139, 2, 1, 0.0);
INSERT INTO order_items VALUES (225, 140, 12, 4, 0.0);
INSERT INTO order_items VALUES (226, 141, 14, 1, 0.0);
INSERT INTO order_items VALUES (227, 142, 3, 3, 0.0);
INSERT INTO order_items VALUES (228, 142, 7, 1, 0.1);
INSERT INTO order_items VALUES (229, 143, 7, 2, 0.0);
INSERT INTO order_items VALUES (230, 143, 11, 4, 0.2);
INSERT INTO order_items VALUES (231, 144, 9, 2, 0.0);
INSERT INTO order_items VALUES (232, 144, 2, 1, 0.0);
INSERT INTO order_items VALUES (233, 145, 14, 1, 0.0);
INSERT INTO order_items VALUES (234, 145, 4, 1, 0.05);
INSERT INTO order_items VALUES (235, 146, 9, 1, 0.0);
INSERT INTO order_items VALUES (236, 147, 8, 4, 0.0);
INSERT INTO order_items VALUES (237, 147, 2, 1, 0.0);
INSERT INTO order_items VALUES (238, 148, 10, 1, 0.0);
INSERT INTO order_items VALUES (239, 148, 2, 1, 0.05);
INSERT INTO order_items VALUES (240, 148, 4, 2, 0.0);
INSERT INTO order_items VALUES (241, 149, 7, 1, 0.0);
INSERT INTO order_items VALUES (242, 149, 15, 2, 0.0);
INSERT INTO order_items VALUES (243, 150, 2, 2, 0.0);
INSERT INTO order_items VALUES (244, 151, 6, 2, 0.0);
INSERT INTO order_items VALUES (245, 151, 10, 1, 0.2);
INSERT INTO order_items VALUES (246, 152, 13, 2, 0.05);
INSERT INTO order_items VALUES (247, 152, 15, 2, 0.0);
INSERT INTO order_items VALUES (248, 153, 9, 2, 0.2);
INSERT INTO order_items VALUES (249, 153, 1, 1, 0.0);
INSERT INTO order_items VALUES (250, 154, 10, 3, 0.05);
INSERT INTO order_items VALUES (251, 154, 1, 2, 0.05);
INSERT INTO order_items VALUES (252, 155, 9, 1, 0.1);
INSERT INTO order_items VALUES (253, 155, 7, 1, 0.05);
INSERT INTO order_items VALUES (254, 156, 4, 1, 0.0);
INSERT INTO order_items VALUES (255, 157, 11, 1, 0.1);
INSERT INTO order_items VALUES (256, 158, 4, 2, 0.2);
INSERT INTO order_items VALUES (257, 158, 2, 1, 0.0);
INSERT INTO order_items VALUES (258, 158, 5, 2, 0.0);
INSERT INTO order_items VALUES (259, 159, 10, 4, 0.0);
INSERT INTO order_items VALUES (260, 160, 6, 2, 0.0);
INSERT INTO order_items VALUES (261, 160, 15, 4, 0.0);
INSERT INTO order_items VALUES (262, 161, 1, 1, 0.0);
INSERT INTO order_items VALUES (263, 162, 4, 1, 0.0);
INSERT INTO order_items VALUES (264, 162, 2, 1, 0.0);
INSERT INTO order_items VALUES (265, 162, 12, 1, 0.0);
INSERT INTO order_items VALUES (266, 163, 7, 2, 0.0);
INSERT INTO order_items VALUES (267, 163, 13, 3, 0.1);
INSERT INTO order_items VALUES (268, 163, 14, 4, 0.05);
INSERT INTO order_items VALUES (269, 164, 3, 4, 0.05);
INSERT INTO order_items VALUES (270, 164, 11, 1, 0.0);
INSERT INTO order_items VALUES (271, 165, 12, 3, 0.2);
INSERT INTO order_items VALUES (272, 165, 2, 2, 0.0);
INSERT INTO order_items VALUES (273, 165, 9, 2, 0.0);
INSERT INTO order_items VALUES (274, 166, 6, 1, 0.0);
INSERT INTO order_items VALUES (275, 167, 9, 2, 0.05);
INSERT INTO order_items VALUES (276, 167, 3, 4, 0.05);
INSERT INTO order_items VALUES (277, 167, 12, 3, 0.0);
INSERT INTO order_items VALUES (278, 168, 15, 2, 0.05);
INSERT INTO order_items VALUES (279, 169, 15, 4, 0.0);
INSERT INTO order_items VALUES (280, 170, 3, 2, 0.2);
INSERT INTO order_items VALUES (281, 171, 2, 1, 0.0);
INSERT INTO order_items VALUES (282, 172, 2, 1, 0.0);
INSERT INTO order_items VALUES (283, 173, 5, 1, 0.0);
INSERT INTO order_items VALUES (284, 174, 3, 4, 0.05);
INSERT INTO order_items VALUES (285, 175, 7, 1, 0.1);
INSERT INTO order_items VALUES (286, 175, 9, 1, 0.0);
INSERT INTO order_items VALUES (287, 176, 15, 1, 0.05);
INSERT INTO order_items VALUES (288, 177, 10, 1, 0.05);
INSERT INTO order_items VALUES (289, 178, 9, 2, 0.0);
INSERT INTO order_items VALUES (290, 178, 2, 2, 0.05);
INSERT INTO order_items VALUES (291, 179, 6, 2, 0.0);
INSERT INTO order_items VALUES (292, 180, 2, 2, 0.1);
INSERT INTO order_items VALUES (293, 181, 14, 4, 0.0);
INSERT INTO order_items VALUES (294, 182, 7, 1, 0.05);
INSERT INTO order_items VALUES (295, 183, 8, 4, 0.2);
INSERT INTO order_items VALUES (296, 183, 6, 2, 0.0);
INSERT INTO order_items VALUES (297, 184, 6, 2, 0.0);
INSERT INTO order_items VALUES (298, 184, 3, 4, 0.0);
INSERT INTO order_items VALUES (299, 185, 12, 3, 0.1);
INSERT INTO order_items VALUES (300, 185, 11, 3, 0.05);
INSERT INTO order_items VALUES (301, 186, 4, 2, 0.0);
INSERT INTO order_items VALUES (302, 187, 6, 2, 0.05);
INSERT INTO order_items VALUES (303, 188, 7, 1, 0.0);
INSERT INTO order_items VALUES (304, 189, 7, 1, 0.0);
INSERT INTO order_items VALUES (305, 190, 4, 1, 0.0);
INSERT INTO order_items VALUES (306, 190, 12, 4, 0.0);
INSERT INTO order_items VALUES (307, 190, 15, 1, 0.05);
INSERT INTO order_items VALUES (308, 191, 1, 1, 0.0);
INSERT INTO order_items VALUES (309, 191, 4, 1, 0.0);
INSERT INTO order_items VALUES (310, 192, 3, 2, 0.2);
INSERT INTO order_items VALUES (311, 193, 7, 2, 0.0);
INSERT INTO order_items VALUES (312, 194, 3, 3, 0.0);
INSERT INTO order_items VALUES (313, 195, 7, 2, 0.1);
INSERT INTO order_items VALUES (314, 195, 12, 3, 0.05);
INSERT INTO order_items VALUES (315, 195, 6, 2, 0.05);
INSERT INTO order_items VALUES (316, 196, 8, 1, 0.0);
INSERT INTO order_items VALUES (317, 197, 5, 1, 0.0);
INSERT INTO order_items VALUES (318, 198, 9, 2, 0.05);
INSERT INTO order_items VALUES (319, 199, 14, 3, 0.0);
INSERT INTO order_items VALUES (320, 200, 7, 2, 0.2);
INSERT INTO order_items VALUES (321, 201, 11, 3, 0.0);
INSERT INTO order_items VALUES (322, 201, 10, 4, 0.05);
INSERT INTO order_items VALUES (323, 202, 11, 2, 0.0);
INSERT INTO order_items VALUES (324, 203, 6, 2, 0.0);
INSERT INTO order_items VALUES (325, 204, 4, 1, 0.0);
INSERT INTO order_items VALUES (326, 205, 7, 2, 0.05);
INSERT INTO order_items VALUES (327, 206, 4, 2, 0.05);
INSERT INTO order_items VALUES (328, 206, 6, 1, 0.0);
INSERT INTO order_items VALUES (329, 207, 15, 3, 0.1);
INSERT INTO order_items VALUES (330, 207, 9, 1, 0.0);
INSERT INTO order_items VALUES (331, 208, 6, 1, 0.0);
INSERT INTO order_items VALUES (332, 209, 4, 1, 0.0);
INSERT INTO order_items VALUES (333, 210, 9, 2, 0.05);
INSERT INTO order_items VALUES (334, 210, 5, 1, 0.0);
INSERT INTO order_items VALUES (335, 210, 14, 3, 0.0);
INSERT INTO order_items VALUES (336, 211, 5, 1, 0.0);
INSERT INTO order_items VALUES (337, 211, 14, 4, 0.0);
INSERT INTO order_items VALUES (338, 211, 4, 1, 0.2);
INSERT INTO order_items VALUES (339, 212, 7, 1, 0.0);
INSERT INTO order_items VALUES (340, 212, 11, 4, 0.0);
INSERT INTO order_items VALUES (341, 212, 13, 3, 0.1);
INSERT INTO order_items VALUES (342, 213, 14, 4, 0.0);
INSERT INTO order_items VALUES (343, 213, 15, 3, 0.0);
INSERT INTO order_items VALUES (344, 213, 5, 1, 0.0);
INSERT INTO order_items VALUES (345, 214, 13, 1, 0.1);
INSERT INTO order_items VALUES (346, 214, 7, 1, 0.05);
INSERT INTO order_items VALUES (347, 215, 5, 1, 0.0);
INSERT INTO order_items VALUES (348, 215, 14, 3, 0.0);
INSERT INTO order_items VALUES (349, 215, 15, 2, 0.0);
INSERT INTO order_items VALUES (350, 216, 15, 3, 0.0);
INSERT INTO order_items VALUES (351, 217, 8, 1, 0.05);
INSERT INTO order_items VALUES (352, 217, 10, 2, 0.0);
INSERT INTO order_items VALUES (353, 218, 3, 1, 0.1);
INSERT INTO order_items VALUES (354, 218, 8, 1, 0.05);
INSERT INTO order_items VALUES (355, 219, 9, 2, 0.0);
INSERT INTO order_items VALUES (356, 219, 15, 3, 0.0);
INSERT INTO order_items VALUES (357, 220, 3, 3, 0.0);
INSERT INTO order_items VALUES (358, 221, 2, 2, 0.05);
INSERT INTO order_items VALUES (359, 221, 9, 2, 0.0);
INSERT INTO order_items VALUES (360, 222, 5, 1, 0.1);
INSERT INTO order_items VALUES (361, 223, 14, 2, 0.0);
INSERT INTO order_items VALUES (362, 223, 1, 2, 0.0);
INSERT INTO order_items VALUES (363, 224, 7, 2, 0.0);
INSERT INTO order_items VALUES (364, 225, 15, 3, 0.0);
INSERT INTO order_items VALUES (365, 226, 7, 2, 0.0);
INSERT INTO order_items VALUES (366, 227, 13, 4, 0.0);
INSERT INTO order_items VALUES (367, 228, 1, 1, 0.0);
INSERT INTO order_items VALUES (368, 229, 12, 4, 0.1);
INSERT INTO order_items VALUES (369, 229, 9, 1, 0.05);
INSERT INTO order_items VALUES (370, 230, 9, 2, 0.2);
INSERT INTO order_items VALUES (371, 231, 9, 1, 0.0);
INSERT INTO order_items VALUES (372, 231, 3, 2, 0.0);
INSERT INTO order_items VALUES (373, 232, 15, 4, 0.1);
INSERT INTO order_items VALUES (374, 233, 14, 3, 0.05);
INSERT INTO order_items VALUES (375, 233, 13, 4, 0.2);
INSERT INTO order_items VALUES (376, 234, 13, 2, 0.2);
INSERT INTO order_items VALUES (377, 235, 12, 4, 0.0);
INSERT INTO order_items VALUES (378, 235, 1, 2, 0.2);
INSERT INTO order_items VALUES (379, 236, 9, 2, 0.0);
INSERT INTO order_items VALUES (380, 237, 5, 1, 0.0);
INSERT INTO order_items VALUES (381, 238, 1, 2, 0.0);
INSERT INTO order_items VALUES (382, 239, 13, 1, 0.0);
INSERT INTO order_items VALUES (383, 239, 2, 1, 0.0);
INSERT INTO order_items VALUES (384, 240, 7, 1, 0.0);

-- PART 3: ANALYSIS QUERIES

-- Q1. Business summary (KPIs)
SELECT COUNT(DISTINCT o.order_id)    AS total_orders,
       COUNT(DISTINCT o.customer_id) AS active_customers,
       ROUND(SUM(oi.quantity * p.price * (1 - oi.discount)), 2) AS total_revenue,
       ROUND(SUM(oi.quantity * (p.price * (1 - oi.discount) - p.cost)), 2) AS total_profit,
       ROUND(SUM(oi.quantity * p.price * (1 - oi.discount))
             / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p     ON p.product_id = oi.product_id;

-- Q2. Monthly revenue, growth and running total
WITH monthly AS (
    SELECT strftime('%Y-%m', o.order_date) AS month,
           SUM(oi.quantity * p.price * (1 - oi.discount)) AS revenue
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.order_id
    JOIN products p     ON p.product_id = oi.product_id
    GROUP BY month
)
SELECT month,
       ROUND(revenue, 2) AS revenue,
       ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0
             / LAG(revenue) OVER (ORDER BY month), 1) AS growth_pct,
       ROUND(SUM(revenue) OVER (ORDER BY month), 2) AS running_total
FROM monthly
ORDER BY month;

-- Q3. Top 5 products by revenue
SELECT p.name AS product,
       p.category,
       SUM(oi.quantity) AS units_sold,
       ROUND(SUM(oi.quantity * p.price * (1 - oi.discount)), 2) AS revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY revenue DESC
LIMIT 5;

-- Q4. Revenue, profit and margin by category
SELECT p.category,
       ROUND(SUM(oi.quantity * p.price * (1 - oi.discount)), 2) AS revenue,
       ROUND(SUM(oi.quantity * (p.price * (1 - oi.discount) - p.cost)), 2) AS profit,
       ROUND(100.0 * SUM(oi.quantity * (p.price * (1 - oi.discount) - p.cost))
             / SUM(oi.quantity * p.price * (1 - oi.discount)), 1) AS margin_pct
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Q5. Cities ranked by revenue
SELECT c.city,
       COUNT(DISTINCT o.order_id) AS orders,
       ROUND(SUM(oi.quantity * p.price * (1 - oi.discount)), 2) AS revenue,
       RANK() OVER (ORDER BY SUM(oi.quantity * p.price * (1 - oi.discount)) DESC) AS city_rank
FROM customers c
JOIN orders o       ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p     ON p.product_id = oi.product_id
GROUP BY c.city
ORDER BY city_rank;

-- Q6. Top 10 customers and their share of revenue
WITH customer_sales AS (
    SELECT c.customer_id, c.name, c.city,
           SUM(oi.quantity * p.price * (1 - oi.discount)) AS revenue
    FROM customers c
    JOIN orders o       ON o.customer_id = c.customer_id
    JOIN order_items oi ON oi.order_id = o.order_id
    JOIN products p     ON p.product_id = oi.product_id
    GROUP BY c.customer_id
)
SELECT name, city,
       ROUND(revenue, 2) AS revenue,
       ROUND(100.0 * revenue / (SELECT SUM(revenue) FROM customer_sales), 1) AS share_pct
FROM customer_sales
ORDER BY revenue DESC
LIMIT 10;

-- Q7. Customers who never placed an order
SELECT c.customer_id, c.name, c.city, c.signup_date
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;
