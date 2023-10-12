/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [business]
      ,[year_founded]
      ,[category]
      ,[category_code]
      ,[country_code]
      ,[country]
      ,[continent]
  FROM [Case Study].[dbo].[oldest_business_joined]


/* Top 5 oldest business still existing */
SELECT TOP 5 business, year_founded, category, country
FROM [Case Study].[dbo].[oldest_business_joined]
ORDER BY year_founded ASC

/* JAPAN - 578, AUSTRIA - 803, GERMANY - 862, FRANCE - 864, UNITED KINGDOM - 886. Construction is the oldest category of busines still existing. Oldest Categories still existing is Cafes Restaurant and Bars - 803 in Austria, Distilers Vintners & Breweries - 862 in Germany, Manufacturing - 886 UK and France*/

/* Categories with most businesses */
SELECT DISTINCT category, business,
COUNT(business) OVER (PARTITION BY category) AS Count_of_Category
FROM dbo.oldest_business_joined

SELECT COUNT(business) AS count_of_business, category
FROM dbo.oldest_business_joined
GROUP BY category 
ORDER BY count_of_business DESC

/* Banking & Finance - 37, Distillers Vinters and Breweries - 22, Aviation and Transport - 19, Postal Service - 16, Manufacturing & Production = 15 */

SELECT COUNT (business) AS count_of_business, continent 
FROM dbo.oldest_business_joined
GROUP BY continent

/* Africa is the continent with most oldest business still existing with 50 businesses and Oceania is the continent with the lowest businesses still existing at 3 businesses. */

SELECT COUNT (DISTINCT category) AS count_of_category, continent
FROM dbo.oldest_business_joined
GROUP BY continent
ORDER BY count_of_category DESC

/* Asia has the most categories at 17 while Oceania has the lowest at 2 */

/* Oldest Business and Category Per Continent */

WITH RankedBusinesses AS (
  SELECT
    business,
    continent,
    year_Founded,
	category,
    ROW_NUMBER() OVER(PARTITION BY continent ORDER BY year_founded ASC) AS RowNum
  FROM
    [Case Study].dbo.oldest_business_joined
)

SELECT
  business,
  continent,
  year_founded,
  category
FROM
  RankedBusinesses
WHERE
  RowNum = 1
  ORDER BY year_founded


  WITH RankedCategories AS (
  SELECT
    continent,
    year_Founded,
	category,
    ROW_NUMBER() OVER(PARTITION BY continent ORDER BY year_founded ASC) AS RowNum
  FROM
    [Case Study].dbo.oldest_business_joined
)

SELECT
  Distinct continent,
  year_founded,
  category
FROM
  RankedCategories
WHERE
  RowNum = 1
   ORDER BY year_founded


WITH RankedBusinesses AS (
  SELECT
    business,
    year_Founded,
	category,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY year_founded ASC) AS RowNum
  FROM
    [Case Study].dbo.oldest_business_joined
)

SELECT
  Distinct category,
  year_founded,
  business
FROM
  RankedBusinesses
WHERE
  RowNum = 1
   ORDER BY year_founded