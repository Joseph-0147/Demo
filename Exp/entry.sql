-- Inserting sample food
INSERT INTO Food (name, amount, size, configurations) VALUES
('Milk', 10, '1000ml', 'Bottle');

-- Inserting sample conditions for the food
INSERT INTO Conditions (food_id, condition_description) VALUES
(1, 'Keep refrigerated');

-- Inserting sample packaging options
INSERT INTO Packaging_Options (food_id, cost, sustainability_score, feature_id) VALUES
(1, 5.00, 8.5, 1), -- Tracking
(1, 7.50, 9.0, 4); -- Refrigeration

-- Inserting sample food-truck mapping
INSERT INTO Food_Truck (food_id, truck_id) VALUES
(1, 1);  -- Refrigerated Truck
