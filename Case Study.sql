/****** Script for SelectTopNRows command from SSMS  ******/
/* The 'daily_tweet_activity' table was imported into a database and the top 1000 rows were select to give a preview of the data. 
The table has 15 columns from date of Tweets published to media engagements on each tweet as shown below: */
SELECT TOP (1000) [Date]
      ,[Weekday]
      ,[Tweets published]
      ,[impressions]
      ,[engagements]
      ,[engagement rate]
      ,[retweets]
      ,[replies]
      ,[likes]
      ,[user profile clicks]
      ,[url clicks]
      ,[detail expands]
      ,[follows]
      ,[media views]
      ,[media engagements]
  FROM [Case Study].[dbo].[daily_tweet_activity]

  /* DATA AGGREGATION
  The data was aggregated to find the average of some of the colimns to make conclusions. 
  The Average of the following columns were taken; 'Tweets Published', 'engagements' , 'retweets', 'replies', 'impressions'
  'likes' and 'media engagements' 
  */

  SELECT AVG([Tweets published]) AS ' Avg Published', AVG([engagements]) AS 'Avg Engagements', 
  AVG([retweets]) AS 'Avg Retweet', AVG([replies]) AS 'Avg Reply', AVG([impressions]) AS 'AVg Impressions',
  AVG([likes]) AS 'Avg Like', AVG([media engagements]) AS 'Avg Media'
    FROM [Case Study].[dbo].[daily_tweet_activity]

/* The Average tweets oblsihed in a day is 2.94 which s approximtely 3 tweets per day which neds to be improved to get more mpressions.
The average engagement per day is 614.14 which is low and needs to br brought up to get more impressions. 
The average retweets in a day is 64.25 and rhe avarge replies in a dat is 79.82. 
The average impressions per day is 29758.53 and it needs to be imporved as the daily impessions needs to be about 60000 in a day to get paid for Twitter Blue.
The average like aday is 123.46 and the average media engagement per day is 48.7
*/

/* The sum of the following column was calculated for the tweets over a total of 28 days;
Tweets Published, Engagements, Retweets, Reply, Impressions and Media Engagements 
*/

	SELECT SUM([Tweets published]) AS 'Sum Published', SUM([engagements]) AS 'Sum Engagements', 
  SUM([retweets]) AS 'Sum Retweet', SUM([replies]) AS 'Sum Reply', SUM([impressions]) AS 'Sum Impressions',
  SUM([likes]) AS 'Sum Like', SUM([media engagements]) AS 'Sum Media'
    FROM [Case Study].[dbo].[daily_tweet_activity]

/* The total tweets published is 83 in a month and that number needs to be higher in order to get more impressions.
The total engagements per 28 days is 17196, the total retweets per month is 1799. The total replies per 28 days is 2235,
The total impressions per month is 833239 and this numer meeds to be improved to a total of 1.6 million per 28 days for the least impressions. 
The sum of like and media engagements is 3457 and 1366 respestively. 
*/

/* Weekday with the least impressions. 
*/

	SELECT MIN(impressions) AS 'MIN Impressions', MAX(impressions) AS 'Max Impressions'
	   FROM [Case Study].[dbo].[daily_tweet_activity] 
	   GROUP BY [Weekday] 

/* The weekday with the least impressions is a Thursday while the weekday with the most impressions is a Tuesday.
*/


	SELECT MIN([media engagements]) AS 'Min Media Engagements', MAX([media engagements]) AS 'Max Media Engagements'
	FROM [Case Study].[dbo].[daily_tweet_activity] 
	GROUP BY [Weekday]
/* The weekday with the minimum media engagement is Tueday and Friday which is probably a time to not post media. 
The weekday with the most media engagements is Thursday which can boost engagements for that day. 
*/

/* Finding the Weekday with most engagements
*/

SELECT MIN([engagements]) AS 'Min Engagements', MAX([engagements]) AS 'Max Engagements'
	FROM [Case Study].[dbo].[daily_tweet_activity] 
	GROUP BY [Weekday]

/* The weekday with the minimum engagement is a Thursday and the weekday with the maximum engagements is a Tuesday.
*/


/* High Level Recommendations
1. Per the analysis made, any average of 3 tweets are made very day with an average of 29758.53 impressios per day which means that each tweet gets up to 9,919.51 impressions on average. 
To be able to qualifiy for Twitter bule, you need  up to 5,000,000 impressions in 3 month which equate to about 60k impressions per day.
To increase the impressions per day, 6 tweets on average will be published per day to get a total impressions of 60k. It is also imortant to take note that
tweets go viral and one tweet can have the total of one day's impressions but in the absence of that, it is reasonble to go with 6 tweets per day which wil in turn
total about 168 tweets per month to equate to 1.6 million impressions per month and equate 5 million in 3 months.

2. The day with the maximum impression is a Tuesday and it is also the day for the most engagements. It is im[ortnat to ppst more on Tuesdays,
as this day willdrive mre impressions and engagements. 

3. The day with the most media impressions is a Thursday and as we have seen that Thursday is rth day with the least impressions it would be best to ost more media on Thurdsay. 
So this will drive more engagement into the day and also get more media engagement. 

These are my recommedations for the Twitter Analysis for be able to qualify for the Twitter Blue payment. 
Thank you. 
*/