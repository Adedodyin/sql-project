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

/* To calculate the duration*/
 
SELECT *, CAST(dbo.Train_details$.[Arrival time] AS time) AS arrive, 
CAST([SQL Tutorial].dbo.Train_details$.[Departure Time] AS time) AS depart, 
DATEDIFF(second, CAST(dbo.Train_details$.[Arrival time] AS time),
CAST([SQL Tutorial].dbo.Train_details$.[Departure Time] AS time)) AS duration
FROM dbo.Train_details$;

/* to create a table */

/* To calculate the duration*/
 
CREATE VIEW fixed_table AS
SELECT *, CAST(dbo.Train_details$.[Arrival time] AS time) AS arrive, 
CAST([SQL Tutorial].dbo.Train_details$.[Departure Time] AS time) AS depart, 
DATEDIFF(second, CAST(dbo.Train_details$.[Arrival time] AS time),
CAST([SQL Tutorial].dbo.Train_details$.[Departure Time] AS time)) AS duration
FROM dbo.Train_details$;

/*To find the trains with the longest duration*/

SELECT fixed_table.[Train No], MAX(fixed_table.duration) AS longest_duration
FROM fixed_table
GROUP BY [Train No]
ORDER BY longest_duration DESC;

/* To find the number of trains with over 20 hours, 20 hours ~ 72000*/
SELECT COUNT(fixed_table.duration) AS number_of_trains
FROM fixed_table 
WHERE duration> 72000;

/* To find the average ride length for the trains*/
SELECT AVG(fixed_table.duration) AS average_ride_length 
FROM fixed_table

/*To find the average distance for the trains*/
SELECT AVG(fixed_table.Distance) AS average_distance
FROM fixed_table;


/* To find the train with longest ride length*/
SELECT TOP 1(fixed_table.[Train No]), MAX(fixed_table.duration) AS longest_ride_length
FROM fixed_table
GROUP BY fixed_table.[Train No]
ORDER BY longest_ride_length DESC;

/* To find the most common destination and source pair*/
SELECT fixed_table.[Source Station Name], fixed_table.[Destination Station Name], COUNT(*) AS Frequency
FROM fixed_table
GROUP BY fixed_table.[Source Station Name], fixed_table.[Destination Station Name]
ORDER BY Frequency DESC;
