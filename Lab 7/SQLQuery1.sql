USE [EducationDatabase]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AddBillXML]
	@employeeID int,
	@buyerID int,
	@doc XML
AS
BEGIN
	SET NOCOUNT ON;

	-- Добавляем временную таблицу
	CREATE TABLE #BillItemXML
	(BillId INT, ProductId INT, Quantity INT)

	-- 
	EXEC	[dbo].[ParseAndAddToTemporaryTable]
			@doc = @doc

select *
from #BillItemXML

	DECLARE @BillId int

	EXEC	[dbo].[AddBill]
			@BuyerID = @buyerID,
			@EmployeeID = @employeeID,
			@BillId = @BillId OUTPUT




END
