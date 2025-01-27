CREATE DATABASE Project1;

USE Project1;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Drivers (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15),
    VehicleType VARCHAR(50)
);

CREATE TABLE Rides (
    RideID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    DriverID INT,
    PickupLocation VARCHAR(255),
    DropLocation VARCHAR(255),
    FareAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

INSERT INTO Users (Name, PhoneNumber, Email) VALUES
('Alice', '9876543210', 'alice@example.com'),
('Bob', '9123456789', 'bob@example.com'),
('Charlie', '9001234567', 'charlie@example.com'),
('David', '7890123456', 'david@example.com'),
('Emma', '8787878787', 'emma@example.com');

INSERT INTO Drivers (Name, PhoneNumber, VehicleType) VALUES
('John', '8008008001', 'Car'),
('Mike', '8118118111', 'Bike'),
('Sarah', '8228228222', 'Auto'),
('Ravi', '8338338333', 'SUV'),
('Sophia', '8448448444', 'Car');

INSERT INTO Rides (UserID, DriverID, PickupLocation, DropLocation, FareAmount) VALUES
(1, 1, 'MG Road', 'Indiranagar', 200.00),
(2, 2, 'Koramangala', 'Whitefield', 150.00),
(3, 3, 'Electronic City', 'Silk Board', 120.00),
(4, 4, 'Majestic', 'Yeshwanthpur', 300.00),
(5, 5, 'Hebbal', 'Airport', 500.00);