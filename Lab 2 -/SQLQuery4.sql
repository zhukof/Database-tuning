SELECT bill.buyerid,
       bill.billid,
       buyer.NAME,
       bill.date
FROM   bill bill
       FULL JOIN buyer buyer ON bill.buyerid = buyer.buyerid
WHERE  bill.billid IS NULL
        OR buyer.buyerid IS NULL 