DECLARE @id INT;
DECLARE @CurrentID INT;
DECLARE @path NVARCHAR(max)='';

SELECT*
INTO   #t
FROM   Employee

WHILE EXISTS(SELECT *
             FROM   #t
             WHERE  TreeKey IS NULL)
  BEGIN
      SET @CurrentID=(SELECT Min(EmployeeID)
                      FROM   #t
                      WHERE  TreeKey IS NULL)
      SET @path =''
      SET @id = @CurrentID

      WHILE @id IS NOT NULL
        BEGIN
            SET @path =CONVERT(NVARCHAR(max), @id) + '.' + @path
            SET @id =(SELECT ManagerId
                      FROM   employee
                      WHERE  EmployeeID = @id)
        END

      SET @path =LEFT(@path, Len(@path) - 1)

      UPDATE #t
      SET    TreeKey = @path
      WHERE  EmployeeID = @CurrentID
  END

UPDATE employee
SET    TreeKey = t.TreeKey
FROM   #t AS t
WHERE  employee.EmployeeID = t.EmployeeID

DROP TABLE #t 