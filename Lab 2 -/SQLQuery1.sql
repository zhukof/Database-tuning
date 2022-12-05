SELECT b.billid,
       bi.billitemid,
       bi.productid,
       p.NAME,
       bi.number,
       p.price,
       bi.cost,
       b.date,
       bi.date
FROM   billitem bi
       INNER JOIN bill b ON bi.billid = b.billid
       INNER JOIN product p ON bi.productid = p.productid
WHERE  p.NAME IN (
'Жаркое из Свинины по-монастырски 525гр жестяная банка №12 Главпродукт'
, 'Корм сухой Фрискис для котят 400гр' )
AND b.date <= '2011-03-04' 