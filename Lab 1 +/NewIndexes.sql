-- Bill
CREATE NONCLUSTERED INDEX IX_Bill_EmployeeID
    ON Bill (EmployeeID)

CREATE NONCLUSTERED INDEX IX_Bill_BuyerID
    ON Bill (BuyerID)

CREATE NONCLUSTERED INDEX IX_Bill_Date
    ON Bill (Date)

-- BillItem
CREATE NONCLUSTERED INDEX IX_BillItem_BillID
    ON BillItem (BillID)

CREATE NONCLUSTERED INDEX IX_BillItem_ProductID
    ON BillItem (ProductID)

CREATE NONCLUSTERED INDEX IX_BillItem_Date
    ON BillItem (Date)

-- Buyer
CREATE NONCLUSTERED INDEX IX_Buyer_Name
    ON Buyer (Name)

-- Employee
CREATE NONCLUSTERED INDEX IX_Employee_Name
    ON Employee (Name)

-- Product
CREATE NONCLUSTERED INDEX IX_Product_Name
    ON Product (Name)