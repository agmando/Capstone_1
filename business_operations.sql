USE gimme_apizza_that; 


-- Table for storing customer information
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each customer
    FirstName VARCHAR(50), -- Customer's first name
    LastName VARCHAR(50), -- Customer's last name
    Phone VARCHAR(20), -- Customer's phone number
    Email VARCHAR(100), -- Customer's email address
    Address VARCHAR(255), -- Customer's address
    DateCreated DATETIME DEFAULT CURRENT_TIMESTAMP -- When the customer was added
);

-- Table for storing orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each order
    OrderDate DATETIME, -- Date and time of the order
    CustomerID INT, -- Foreign key referencing Customers
    EmployeeID INT, -- Foreign key referencing Employees
    PaymentMethod VARCHAR(50), -- Payment method (Cash, Card, etc.)
    Status VARCHAR(50), -- Order status (Pending, Completed, Canceled)
    TotalAmount DECIMAL(10, 2), -- Total cost of the order
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), -- Relationship with Customers table
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID) -- Relationship with Employees table
);

-- Table for storing a variety of food items, not just pizzas
CREATE TABLE FoodItems (
    FoodItemID INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each food item
    ItemName VARCHAR(100), -- Name of the food item
    Category VARCHAR(50), -- Category (Pizza, Appetizer, Beverage, etc.)
    Price DECIMAL(6, 2), -- Price of the item
    Description TEXT, -- Description of the food item
    IsAvailable BOOLEAN DEFAULT TRUE, -- Whether the item is currently available
    Calories INT, -- Caloric value
    DateAdded DATETIME DEFAULT CURRENT_TIMESTAMP -- When the item was added to the menu
);

-- Table for storing sales information
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each sale
    OrderID INT, -- Foreign key referencing Orders
    SaleDate DATE, -- Date of the sale
    SaleAmount DECIMAL(10, 2), -- Amount of the sale
    DiscountApplied DECIMAL(5, 2), -- Discount applied to the sale, if any
    PaymentType VARCHAR(50), -- Payment type (Cash, Card, etc.)
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- Relationship with Orders table
);

-- Table for storing order details (relationship between Orders and FoodItems)
CREATE TABLE OrderDetails (
    OrderID INT, -- Foreign key referencing Orders
    FoodItemID INT, -- Foreign key referencing FoodItems
    Quantity INT, -- Quantity of each food item in the order
    UnitPrice DECIMAL(6, 2), -- Price of the item at the time of order
    Subtotal DECIMAL(10, 2), -- Subtotal for the food item in the order
    PRIMARY KEY (OrderID, FoodItemID), -- Composite key to ensure unique combinations of orders and food items
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), -- Relationship with Orders table
    FOREIGN KEY (FoodItemID) REFERENCES FoodItems(FoodItemID) -- Relationship with FoodItems table
);

-- Table for storing employee information
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID for each employee
    FirstName VARCHAR(50), -- Employee's first name
    LastName VARCHAR(50), -- Employee's last name
    Role VARCHAR(50), -- Employee's role in the restaurant (e.g., Server, Manager)
    HireDate DATE, -- Date the employee was hired
    Salary DECIMAL(10, 2), -- Employee's salary
    IsActive BOOLEAN DEFAULT TRUE, -- Whether the employee is currently employed
    Phone VARCHAR(20), -- Employee's phone number
    Email VARCHAR(100) -- Employee's email address
);
