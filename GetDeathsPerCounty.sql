USE [CloudComputing]
GO

/****** Object:  StoredProcedure [dbo].[GetDeathsPerCounty]    Script Date: 11/26/2019 7:02:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDeathsPerCounty]
	
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
		[county],
		[data_value] as [total]
	FROM [deathspercounty] (NOLOCK)
	ORDER BY [county]

END
GO


