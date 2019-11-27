USE [CloudComputing]
GO

/****** Object:  StoredProcedure [dbo].[GetLifeExpectancyByZip]    Script Date: 11/26/2019 7:05:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLifeExpectancyByZip]
	(
		@searchstr varchar(5)
	)
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT TOP 1 [B].[zipcode], [B].[City], [A].[expectancy], [B].[county], [P].[percent] as [countypoverty], [B].[population2015] as [population]
	FROM [trackinginfo] [A] WITH (NOLOCK)
	INNER JOIN [zipcode] [B] WITH (NOLOCK) ON [B].[trackingid] = [A].[trackingid]
	LEFT JOIN [poverty] [P] WITH (NOLOCK) ON [P].[locationid] = [A].[trackingshort]
	WHERE [B].[zipcode] = @searchstr
END
GO


