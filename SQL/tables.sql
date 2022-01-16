CREATE TABLE Customer_Dim(
    Customer_ID INTEGER PRIMARY KEY,
    Customer_Country CHARACTER(2),
    Customer_Group CHARACTER(40),
    Customer_Type CHARACTER(40),
    Customer_Gender CHARACTER(1),
    Customer_Age SMALLINT,
    Customer_Name CHARACTER(40),
    Customer_fistname CHARACTER(20),
    Customer_Lastname CHARACTER(30),
    Customer_Birth_Date DATE
);

CREATE TABLE Organization_Dim (
   Employee_ID INTEGER PRIMARY KEY,
   Employee_Country CHARACTER(2),
   Company CHARACTER(30),
   Department VARCHAR(40),
   Section VARCHAR(40),
   Org_Group VARCHAR(40),
   Job_Title VARCHAR(25),
   Employee_Name VARCHAR(40),
   Employee_Gender CHARACTER(1),
   Salary DECIMAL(13),
   Employee_Birth_Date DATE,
   Employee_Hire_Date DATE,
   Employee_Term_Date DATE
);

CREATE TABLE Geography_Dim (
   Street_ID BIGINT PRIMARY KEY,
   Continent VARCHAR(30),
   Country CHARACTER(2),
   State_Code CHARACTER(2),
   State VARCHAR(25),
   Region VARCHAR(30),
   Province VARCHAR(30),
   County VARCHAR(60),
   City VARCHAR(30),
   Postal_Code CHARACTER(10),
   Street_Name VARCHAR(45)
); 

CREATE TABLE Product_Dim(
   Product_ID BIGINT PRIMARY KEY,
   Product_Line CHARACTER(20),
   Product_Category CHARACTER(25),
   Product_Group CHARACTER(25),
   Product_Name CHARACTER(45),
   Product_Country CHARACTER(2),
   Supplier_Name CHARACTER(30),
   Supplier_ID INTEGER
);

CREATE TABLE Time_Dim (
   Date_ID DATE PRIMARY KEY,
   Year_ID CHARACTER(4),
   Quarter CHARACTER(6),
   Month_Name VARCHAR(20),
   Weekday_Name VARCHAR(20),
   Month_Num SMALLINT,
   Weekday_NUM SMALLINT
);

CREATE TABLE Order_Fact (
   Customer_ID INTEGER,
   Employee_ID INTEGER,
   Street_ID BIGINT,
   Product_ID BIGINT,
   Order_Date DATE,
   Order_ID INTEGER,
   Order_Type SMALLINT,
   Delivery_Date DATE,
   Quantity SMALLINT,
   Total_Retail_Proce DECIMAL(13,2),
   Costprice_Per_Unit DECIMAL(13,2),
   Discount DECIMAL(5,2),
   PRIMARY KEY (Customer_ID,Employee_ID,Street_ID,Product_ID,Order_Date,Order_ID),
   CONSTRAINT fk_cust_id FOREIGN KEY (Customer_ID) REFERENCES Customer_Dim (Customer_ID),
   CONSTRAINT fk_org_id FOREIGN KEY (Employee_ID) REFERENCES Organization_Dim (Employee_ID),
   CONSTRAINT fk_geo_id FOREIGN KEY (Street_ID) REFERENCES Geography_Dim (Street_ID),
   CONSTRAINT fk_prod_id FOREIGN KEY (Product_ID) REFERENCES Product_Dim (Product_ID),
   CONSTRAINT fk_ord_id FOREIGN KEY (Order_Date) REFERENCES Time_Dim (Date_ID) 
);
