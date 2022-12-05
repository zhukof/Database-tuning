CREATE PROCEDURE BillandBuyer
	@date DATETIME
AS
  BEGIN
      SET nocount ON;

      SELECT bill.buyerid,
             bill.billid,
             buyer.NAME,
             bill.date
      FROM   bill bill
             FULL JOIN buyer buyer ON bill.buyerid = buyer.buyerid
      WHERE  Cast(bill.date AS DATE) = @date
  END

go 