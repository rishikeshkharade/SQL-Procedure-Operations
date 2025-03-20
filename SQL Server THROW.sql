--A) Using THROW statement to raise an exception
THROW 50005, N'AN error occured', 1;


--B) Using THROW statement to rethrow an exception
CREATE TABLE t1
(
	id INT PRIMARY KEY
);
GO

BEGIN TRY
INSERT INTO t1(id) VALUES (1);
INSERT INTO t1(id) VALUES (1);
END TRY
BEGIN CATCH
PRINT('Raise the caught error again');
THROW;
END CATCH


--C) Using THROW statement to rethrow an exception
EXEC sys.sp_addmessage
	@msgnum = 50010,
	@severity = 16,
	@msgtext = N'The order number %s cannot be deleted because it does not exist.',
	@lang = 'us_english';
GO

DECLARE @MessageText NVARCHAR(2048);
SET @MessageText = FORMATMESSAGE(50010, N'1001');
THROW 50010, @MessageText, 1;

