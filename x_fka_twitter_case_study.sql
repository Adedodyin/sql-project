/* The 'daily_tweet_activity' table was imported into a database and the top 1000 rows were selected to give a preview of the data. 
The table has 15 columns from the date of Tweets published to media engagements on each tweet as shown below: */

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
The average of the following columns was taken; 'Tweets Published', 'Engagements', 'Retweets', 'Replies', 'Impressions'
  'likes' and 'media engagements' */

  SELECT AVG([Tweets published]) AS ' Avg Published', AVG([engagements]) AS 'Avg Engagements', 
  AVG([retweets]) AS 'Avg Retweet', AVG([replies]) AS 'Avg Reply', AVG([impressions]) AS 'AVg Impressions',
  AVG([likes]) AS 'Avg Like', AVG([media engagements]) AS 'Avg Media'
    FROM [Case Study].[dbo].[daily_tweet_activity]

/* The Average number of tweets published in a day is 2.94 which is approximately 3 tweets per day that need to be improved to get more impressions.
The average engagement per day is 614.14 which is low and needs to be brought up to get more impressions. 
The average retweets in a day are 64.25 and the average replies in a day is 79.82. 
The average impressions per day are 29758.53 and it needs to be improved as the daily impressions need to be about 60000 in a day to get paid for Twitter Blue.
The average like day is 123.46 and the average media engagement per day is 48.7
*/

	
/* Finding the sum of Tweets Published, Engagements, Retweets, Reply, Impressions, and Media Engagements */

	SELECT SUM([Tweets published]) AS 'Sum Published', SUM([engagements]) AS 'Sum Engagements', 
  SUM([retweets]) AS 'Sum Retweet', SUM([replies]) AS 'Sum Reply', SUM([impressions]) AS 'Sum Impressions',
  SUM([likes]) AS 'Sum Like', SUM([media engagements]) AS 'Sum Media'
    FROM [Case Study].[dbo].[daily_tweet_activity]

/* The total number of tweets published is 83 in a month and that number needs to be higher in order to get more impressions.
The total engagements per 28 days are 17196, and the total retweets per month is 1799. The total number of replies per 28 days is 2235,
The total impressions per month are 833239 and this number needs to be improved to a total of 1.6 million per 28 days for the last impressions. 
The sum of likes and media engagements is 3457 and 1366 respectively. */

/* Finding the Weekday with the least impressions. */
	SELECT MIN(impressions) AS 'MIN Impressions', MAX(impressions) AS 'Max Impressions'
	   FROM [Case Study].[dbo].[daily_tweet_activity] 
	   GROUP BY [Weekday] 

/* The weekday with the least impressions is a Thursday while the weekday with the most impressions is a Tuesday. */

/* Finding the Weekday with the most media engagement. */
	
	SELECT MIN([media engagements]) AS 'Min Media Engagements', MAX([media engagements]) AS 'Max Media Engagements'
	FROM [Case Study].[dbo].[daily_tweet_activity] 
	GROUP BY [Weekday]
/* The weekday with the minimum media engagement is Tuesday and Friday which is probably a time to not post media. 
The weekday with the most media engagements is Thursday which can boost engagements for that day. */

/* Finding the Weekday with the most engagements */

SELECT MIN([engagements]) AS 'Min Engagements', MAX([engagements]) AS 'Max Engagements'
	FROM [Case Study].[dbo].[daily_tweet_activity] 
	GROUP BY [Weekday]

/* The weekday with the minimum engagement is a Thursday and the weekday with the maximum engagement is a Tuesday. */
