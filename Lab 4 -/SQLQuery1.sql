SELECT
	BillID,
	Date
FROM Bill
	WHERE EXISTS
	(SELECT *
	FROM Bill AS b
	WHERE Bill.BillID<>B.BillID AND dateadd(DAY,datediff(day, 0,Bill.Date),0)=dateadd(DAY,datediff(day, 0,b.Date),0) AND Bill.Date BETWEEN'2011-01-01 00:00'AND'2011-01-01 23:59')