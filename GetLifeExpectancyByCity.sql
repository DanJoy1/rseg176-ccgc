USE [CloudComputing]
GO

/****** Object:  StoredProcedure [dbo].[GetLifeExpectancyByCity]    Script Date: 10/31/2019 7:47:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetLifeExpectancyByCity]
	(
		@searchstr varchar(50)
	)
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT TOP 1 [B].[zipcode], [B].[City], [A].[expectancy], [B].[county], [B].[population2015] as [population]
	FROM [trackinginfo] [A] WITH (NOLOCK)
	INNER JOIN [zipcode] [B] WITH (NOLOCK) ON [B].[trackingid] = [A].[trackingid]
	WHERE [B].[city] = @searchstr
END
GO


