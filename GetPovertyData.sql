USE [CloudComputing]
GO

/****** Object:  StoredProcedure [dbo].[GetPovertyData]    Script Date: 11/26/2019 7:04:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPovertyData]
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
	[locationid],
	[percent]
	FROM [poverty] WITH (NOLOCK)
	WHERE [locationid] = @trackingshort
	ORDER BY [locationid]

END
GO


