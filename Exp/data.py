import PostgreSQL

def fetch_food_data(food_name):
    # Connect to your database
    conn = PostgreSQL.connect('smartpackaging.db')  # Replace with your database file or connection details
    cursor = conn.cursor()
    
    # Define the SQL query
    query = """
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
        f.name = ?
    """
    
    # Execute the query
    cursor.execute(query, (food_name,))
    
    # Fetch the results
    results = cursor.fetchall()
    
    # Close the connection
    conn.close()
    
    return results

if __name__ == "__main__":
    food_name = 'Specific Food Name'  # Replace with the actual food name
    data = fetch_food_data(food_name)
    
    # Print the results
    for row in data:
        print(row)
