/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Train No]
      ,[Station Code]
      ,[Station Name]
      ,[Arrival time]
      ,[Departure Time]
      ,[Ride_Length]
      ,[Distance]
      ,[Source Station Code]
      ,[Source Station Name]
      ,[Destination Station]
      ,[Destination Station Name]
  FROM [SQL Tutorial].[dbo].[Train_details$];

 
SELECT *, CAST(dbo.Train_details$.[Arrival time] AS time) AS arrive, 
CAST([SQL Tutorial].dbo.Train_details$.[Departure Time] AS time) AS depart, 
DATEDIFF(second, CAST(dbo.Train_details$.[Arrival time] AS time),
CAST([SQL Tutorial].dbo.Train_details$.[Departure Time] AS time)) AS duration
FROM dbo.Train_details$;

