# food-order-db
This is a simplified overview of the database for a university canteen system.

# Tables

`person`: The main table for all users, including students and professors. It holds basic user information.

`student`: Stores details unique to students, such as their student number and major. It is linked to the person table.

`professor`: Stores details unique to professors, such as their department and academic rank. It is also linked to the person table.

`food`: A catalog of all food items available in the canteen.

`order`: Represents a single purchase made by a person.

`order_items`: This table links an order to the food items within it.

# Key Relationships

A person can be a student or a professor.

A person can place many orders.

An order can contain many food items, and a single food item can be in many orders.
