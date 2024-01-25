/* Selecting the TOP 1000 to get an overview of the dataset*/
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

/* To calculate the duration*/
 
SELECT *, CAST(dbo.Train_details$.[Arrival time] AS time) AS arrive, 
CAST([SQL Tutorial].dbo.Train_details$.[Departure Time] AS time) AS depart, 
DATEDIFF(second, CAST(dbo.Train_details$.[Arrival time] AS time),
CAST([SQL Tutorial].dbo.Train_details$.[Departure Time] AS time)) AS duration
FROM dbo.Train_details$;

/* To find the total number of trains*/

SELECT COUNT(dbo.Train_details$.[Train No]) AS Total_trains
FROM dbo.Train_details$;

/* To find the unique train numbers*/

SELECT COUNT(DISTINCT(dbo.Train_details$.[Train No]))
FROM dbo.Train_details$;

/* to find the unique source and destination station*/
SELECT COUNT(DISTINCT(dbo.Train_details$.[Source Station Name])) AS source_station, 
COUNT(DISTINCT(dbo.Train_details$.[Destination Station Name])) AS destination_station
FROM dbo.Train_details$;
