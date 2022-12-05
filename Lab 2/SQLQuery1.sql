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
'������ �� ������� ��-����������� 525�� �������� ����� �12 �����������'
, '���� ����� ������� ��� ����� 400��' )
AND b.date <= '2011-03-04' 