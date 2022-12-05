SELECT BuyerID
FROM   Buyer buyer
WHERE  NOT EXISTS (SELECT *
                   FROM   bill
                   WHERE  bill.buyerID = buyer.buyerID AND bill.Date BETWEEN '2010-01-01 00:00' AND '2010-01-01 23:59') 