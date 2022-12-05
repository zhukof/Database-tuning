SELECT 1           AS [tag],
       NULL        AS Parent,
       b.BillID    AS [bill!1!Id],
       b.Date      AS [bill!1!Date],
       Sum(bi.Cost)AS [bill!1!Cost],
       e.Name      AS [bill!1!Employee],
       NULL        AS [product!2!Id],
       NULL        AS [product!2!Name],
       NULL        AS [product!2!Price],
       NULL        AS [product!2!Quantity],
       NULL        AS [product!2!Cost]
FROM   Bill AS b
       INNER JOIN BillItem AS bi ON bi.billid = b.billid
       INNER JOIN Employee AS e ON e.employeeid = b.employeeid
WHERE  b.BillID = 1
GROUP  BY b.BillID, b.date, e.NAME
UNION ALL
SELECT 2,
       1,
       bi.BillID,
       NULL,
       NULL,
       NULL,
       p.ProductID,
       p.NAME,
       p.Price,
       bi.Number,
       bi.Cost
FROM   BillItem AS bi
       INNER JOIN Product AS p ON p.ProductID = bi.ProductID
WHERE  bi.BillID = 1
ORDER  BY [bill!1!Id],
          [product!2!Id]
FOR xml explicit 