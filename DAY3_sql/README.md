

## **1️⃣ SQL Constraints**
### **🔹 Primary Key (PK)**
A unique identifier for each record in a table. 

#### ✅ Example: Single Primary Key
```sql
CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(100)
);
```

#### ✅ Example: Composite Primary Key
```sql
CREATE TABLE Orders (
    Order_id INT,
    Customer_id INT,
    Product_id INT,
    CONSTRAINT pk_order PRIMARY KEY (Order_id, Customer_id) 
);
```

### **🔹 Foreign Key (FK)**
Establishes a relationship between two tables.
```sql
CREATE TABLE Orders (
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);
```

### **🔹 Check Constraint**
```sql
CREATE TABLE MarchProduction (
    Cloth_Id INT PRIMARY KEY,
    Cloth_Category VARCHAR(100),
    Cloth_Price INT,
    Stock VARCHAR(50) CHECK (Stock IN ('Available', 'Not Available', 'Restore'))
);
```

#### **🔴 Error Faced:**
```
Msg 5074: The object is dependent on column 'Stock'.
```
**💡 Solution:**
```sql
ALTER TABLE MarchProduction DROP CONSTRAINT CK__MarchProd__Stock;
ALTER TABLE MarchProduction ALTER COLUMN Stock VARCHAR(100);
```

### **🔹 Default Constraint**
```sql
CREATE TABLE Customer (
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Location VARCHAR(100) DEFAULT 'Chennai'
);
```

## **2️⃣ Modifying Table Structure**
### **🔹 Alter Table Commands**
#### ✅ Add Column
```sql
ALTER TABLE Customer ADD Email VARCHAR(100);
```
#### ✅ Modify Column Data Type
```sql
ALTER TABLE Customer ALTER COLUMN Mobile BIGINT;
```
#### ✅ Make Column NOT NULL
```sql
ALTER TABLE Customer ALTER COLUMN Customer_name VARCHAR(100) NOT NULL;
```

## **3️⃣ Updating & Deleting Data**
### **🔹 Update a Column Value**
```sql
UPDATE Customer SET Location = 'Mumbai' WHERE Customer_id = 2;
```

## **4️⃣ Renaming Objects**
### **🔹 Rename Column Name**
```sql
EXEC sp_rename 'Customer.Customer_name', 'Full_Name', 'COLUMN';
```

## **5️⃣ Querying Data**
### **🔹 DISTINCT Keyword**
```sql
SELECT DISTINCT City, State FROM Customers ORDER BY City ASC, State DESC;
```

## **6️⃣ Deleting & Dropping Database**
```sql
USE master;
ALTER DATABASE MoonAari SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE MoonAari;
```

## **7️⃣ GitHub Integration for SSMS**
### **🔹 Uploading SQL Scripts to GitHub**
#### ✅ Using Git Commands
```sh
git init
git add .
git commit -m "Added SQL scripts"
git branch -M main
git remote add origin https://github.com/yourusername/repository.git
git push -u origin main
```

## **🚀 Key Errors & Fixes**
| **Error Message** | **Cause** | **Solution** |
|------------------|----------|-------------|
| `Msg 4701: Cannot find object` | Table does not exist. | Check using `SELECT * FROM sys.tables;` |
| `Msg 15225: No item by the name found.` | Column does not exist. | Verify with `SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TableName';` |
| `Msg 3702: Cannot drop database` | Active connections exist. | Set to single-user mode before dropping. |
| `Msg 5074: The object is dependent on column` | A constraint exists. | Drop constraint before altering column. |

---
## **🎯 Final Takeaways**
✅ **Constraints** ensure data integrity (**PK, FK, Check, Default**).  
✅ **Table Modifications** require **ALTER TABLE** commands (**ADD, DROP, MODIFY**).  
✅ **Updating and Deleting Data** needs **caution with Primary Keys**.  
✅ **GitHub Integration** is easy via **GitHub Desktop or Git commands**.  
✅ **Errors occur** when constraints exist—**drop constraints first** before modifying.  
