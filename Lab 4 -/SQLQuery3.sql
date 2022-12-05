CREATE TABLE #BuyerTemporary
  (
     BuyerID INT PRIMARY KEY,
     NAME    NVARCHAR(100) NOT NULL
  )

INSERT INTO #BuyerTemporary
SELECT TOP 5 *
FROM   Buyer

SELECT buyerid,
       date
FROM   Bill bill
WHERE  bill.BuyerID IN(SELECT BuyerID FROM #BuyerTemporary)

DROP TABLE #BuyerTemporary 