DECLARE @id INT
DECLARE @p INT= 1

SELECT *
INTO   #t
FROM   Employee

SET @id =(SELECT employeeid
          FROM   #t
          WHERE  ManagerID IS NULL)

UPDATE #t
SET    [Left] = @p
WHERE  EmployeeID = @id

SET @p = @p + 1

WHILE EXISTS (SELECT*
              FROM   #t
              WHERE  [Left] IS NULL
                      OR [Right] IS NULL)
  BEGIN
      IF EXISTS(SELECT EmployeeID
                FROM   #t
                WHERE  ManagerID = @id
                       AND [Left] IS NULL)
        BEGIN
            SET @id =(SELECT MIN(EmployeeID)
                      FROM   #t
                      WHERE  ManagerID = @id
                             AND [Left] IS NULL)

            UPDATE #t
            SET    [Left] = @p
            WHERE  EmployeeID = @id

            SET @p = @p + 1;
        END
      ELSE
        BEGIN
            UPDATE #t
            SET    [Right] = @p
            WHERE  EmployeeID = @id

            SET @p = @p + 1;
            SET @id =(SELECT ManagerID
                      FROM   #t
                      WHERE  EmployeeID = @id)
        END
  END

UPDATE Employee
SET    [Left] = t.[Left],
       [Right] = t.[Right]
FROM   #t AS t
WHERE  employee.EmployeeID = t.EmployeeID

DROP TABLE #t 