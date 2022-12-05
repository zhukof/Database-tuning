CREATE PROCEDURE BuyerAndEmployee
AS
  BEGIN
      SET nocount ON;

      SELECT emp.employeeid,
             buyer.buyerid,
             buyer.NAME,
             emp.NAME,
             emp.post
      FROM   buyer buyer
             CROSS JOIN employee emp
  END 