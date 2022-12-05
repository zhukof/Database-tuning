SELECT bill.billid,
       bi.billitemid,
       bi.productid,
       buyer.buyerid,
       p.NAME,
       bi.number,
       p.price,
       bi.cost,
       bill.date,
       bi.date,
       buyer.NAME,
       p.photo
FROM   bill bill
       LEFT JOIN buyer buyer ON bill.buyerid = buyer.buyerid
       INNER JOIN billitem bi ON bill.billid = bi.billid
       INNER JOIN product p ON bi.productid = p.productid
       RIGHT JOIN employee emp ON bill.employeeid = emp.employeeid
WHERE  bill.billid IS NULL 