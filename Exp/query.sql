SELECT 
    f.name AS Food_Name,
    f.amount AS Amount,
    f.size AS Size,
    f.configurations AS Configurations,
    c.condition_description AS Conditions,
    spf.feature_name AS Features,
    po.cost AS Cost,
    po.sustainability_score AS Sustainability_Score,
    tt.truck_type AS Truck_Type
FROM 
    Food f
JOIN 
    Conditions c ON f.food_id = c.food_id
JOIN 
    Packaging_Options po ON f.food_id = po.food_id
JOIN 
    Smart_Packaging_Features spf ON po.feature_id = spf.feature_id
JOIN 
    Food_Truck ft ON f.food_id = ft.food_id
JOIN 
    Truck_Type tt ON ft.truck_id = tt.truck_id
WHERE 
    f.name = 'fish';  -- Replace with actual food name

