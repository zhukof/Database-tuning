SELECT *
	FROM [EducationDatabase].[dbo].[Bill]
	INNER JOIN BillItem bi ON Bill.BillID = bi.BillID
	WHERE Bill.Date BETWEEN '05.02.2011' AND '20.02.2011'

SELECT *
	FROM [EducationDatabase].[dbo].[Bill]
	INNER JOIN BillItem bi ON Bill.BillID = bi.BillID
	WHERE Bill.Date BETWEEN '05.02.2011' AND '20.03.2011'
