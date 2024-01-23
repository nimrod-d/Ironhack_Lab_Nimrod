CREATE DATABASE IF NOT EXISTS cars;

USE cars;

CREATE TABLE Salesperson(
Staff_Id INT PRIMARY KEY UNIQUE,
Emp_Name VARCHAR(20),
Store_Location VARCHAR(20));

CREATE TABLE Cars(
VIN VARCHAR(45) PRIMARY KEY UNIQUE,
Manufacturer VARCHAR(20),
Model VARCHAR(20),
Year INT, 
Color VARCHAR(20));

CREATE TABLE Customers(
Customer_Id INT PRIMARY KEY UNIQUE, 
Customer_name VARCHAR(20),
phone_num VARCHAR(45),
email VARCHAR(45),
address VARCHAR(45),
city VARCHAR(20),
State_province VARCHAR(20),
Country VARCHAR(20),
zip_postal VARCHAR(20));

CREATE TABLE Invoices (
  Invoice_number INT PRIMARY KEY UNIQUE,
  Amount FLOAT(2),
  VIN VARCHAR(45),
  Staff_Id INT,
  Customer_Id INT,
  Date_of_order DATE,
  CONSTRAINT fk_cars_VIN FOREIGN KEY (VIN) REFERENCES cars (VIN),
  CONSTRAINT fk_Salesperson_Id FOREIGN KEY (Staff_Id) REFERENCES Salesperson (Staff_Id),
  CONSTRAINT fk_Customer_Id FOREIGN KEY (Customer_Id) REFERENCES Customers (Customer_Id)
);






