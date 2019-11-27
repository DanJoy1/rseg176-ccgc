USE [CloudComputing]
GO

/****** Object:  StoredProcedure [dbo].[GetCardiovascularData]    Script Date: 11/26/2019 7:03:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCardiovascularData]
	(
		@searchstr varchar(50)
	)
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @IsNumeric int
	DECLARE @trackingshort VARCHAR(10)

	SELECT @IsNumeric = ISNUMERIC(@searchstr)

	IF @IsNumeric = 1
	BEGIN
		SELECT TOP 1 @trackingshort = [trackingshort] FROM [zipcode] WITH (NOLOCK) WHERE [zipcode] = @searchstr
	END
	ELSE
	BEGIN
		SELECT TOP 1 @trackingshort = [trackingshort] FROM [zipcode] WITH (NOLOCK) WHERE [city] = @searchstr
	END

	SELECT
	[class],
	[topic],
	[stratificationcategory1],
	[stratification1],
	[stratificationcategory2],
	[stratification2],
	[data_value],
	[data_value_unit]
	FROM [cardiovascular] WITH (NOLOCK)
	WHERE [locationID] = @trackingshort
	ORDER BY [stratification1], [stratification2]

END
GO


