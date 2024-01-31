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


/* To find the train with the longest ride length*/
SELECT TOP 1(fixed_table.[Train No]), MAX(fixed_table.duration) AS longest_ride_length
FROM fixed_table
GROUP BY fixed_table.[Train No]
ORDER BY longest_ride_length DESC;

/* To find the most common destination and source pair*/
SELECT fixed_table.[Source Station Name], fixed_table.[Destination Station Name], COUNT(*) AS Frequency
FROM fixed_table
GROUP BY fixed_table.[Source Station Name], fixed_table.[Destination Station Name]
ORDER BY Frequency DESC;


/* To find the unique stations in the dataset*/
SELECT COUNT(DISTINCT fixed_table.[Station Name]) AS unique_stations 
FROM fixed_table;

/* To find the stations with the highest and lowest average duration */
SELECT TOP 5 fixed_table.[Station Name], AVG(fixed_table.duration) AS average_ride_length
FROM fixed_table
GROUP BY fixed_table.[Station Name]
ORDER BY average_ride_length DESC;

SELECT TOP 5 fixed_table.[Station Name], AVG(fixed_table.duration) AS average_ride_length
FROM fixed_table
GROUP BY fixed_table.[Station Name]
ORDER BY average_ride_length ASC;

/* To find the station which serves as start and destination */

SELECT DISTINCT ft1.[Source Station Name]
FROM fixed_table ft1
JOIN fixed_table ft2 ON 
ft1.[Station Name] = ft2.[Station Name] 
WHERE ft1.[Train No] <> ft2.[Train No]
ORDER BY ft1.[Source Station Name];

/* To find the source station that has the most destinations */
SELECT fixed_table.[Source Station Name] , COUNT(fixed_table.[Destination Station Name]) AS most_destinations 
FROM fixed_table
GROUP BY fixed_table.[Source Station Name]
ORDER BY most_destinations DESC;

/*To find the destination station that has the most sources */
SELECT fixed_table.[Destination Station Name], COUNT(fixed_table.[Source Station Name]) AS most_sources 
FROM fixed_table
GROUP BY fixed_table.[Destination Station Name]
ORDER BY most_sources DESC;

/*To find the trains that cover the most distance in the dataset*/
SELECT TOP 10 fixed_table.[Train No], MAX(fixed_table.[Distance]) AS max_distance 
FROM fixed_table 
GROUP BY fixed_table.[Train No]
ORDER BY max_distance DESC;
