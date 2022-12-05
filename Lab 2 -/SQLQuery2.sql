SELECT bill.BillID,
       bi.BillItemID,
       bi.ProductID,
       buyer.BuyerID,
       p.Name,
       bi.Number,
       p.Price,
       bi.Cost,
       bill.Date,
       bi.Date,
       buyer.Name,
       p.Photo
FROM   Bill bill
       LEFT JOIN Buyer buyer ON bill.BuyerID = buyer.BuyerID
       INNER JOIN BillItem bi ON bill.BillID = bi.BillID
       INNER JOIN Product p ON bi.ProductID = p.ProductID
WHERE  buyer.BuyerID IS NULL 