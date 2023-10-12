/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [business]
      ,[year_founded]
      ,[category_code]
      ,[country_code]
  FROM [Case Study].[dbo].[businesses$]

/* VIEWING DATA FROM ALL 3 TABLES */
SELECT *
FROM [Case Study].dbo.businesses$

SELECT * 
FROM [Case Study].dbo.categories$

SELECT *
FROM [Case Study].dbo.countries$

	
/* JOINING ALL TABLES */
SELECT business, year_founded, category,business_1.category_code,business_1.country_code, country, continent
FROM [Case Study].dbo.businesses$ business_1
INNER JOIN [Case Study].dbo.categories$ category_1
ON business_1.category_code = category_1.category_code
INNER JOIN [Case Study].dbo.countries$ country_1
ON business_1.country_code = country_1.country_code

/* VIEWING THE JOINED TABLES */
SELECT TOP (1000) [business]
      ,[year_founded]
      ,[category]
      ,[category_code]
      ,[country_code]
      ,[country]
      ,[continent]
  FROM [Case Study].[dbo].[oldest_business_joined]


/* FINDING THE TOP 5 OLDEST BUSINESSES STILL EXISTING */
SELECT TOP 5 business, year_founded, category, country
FROM [Case Study].[dbo].[oldest_business_joined]
ORDER BY year_founded ASC

/* FINDING THE CATEGORIES WITH MOST BUSINESSES (2 SETS OF CODE)*/
SELECT DISTINCT category, business,
COUNT(business) OVER (PARTITION BY category) AS Count_of_Category
FROM dbo.oldest_business_joined

SELECT COUNT(business) AS count_of_business, category
FROM dbo.oldest_business_joined
GROUP BY category 
ORDER BY count_of_business DESC

/* FINDING THE CONTINENTS WITH THE MOST OLD BUSINESSES STILL EXISTING */
SELECT COUNT (business) AS count_of_business, continent 
FROM dbo.oldest_business_joined
GROUP BY continent

/* FINDING THE CONTINENTS WITH THE MOST CATEGORIES STILL EXISTING */
SELECT COUNT (DISTINCT category) AS count_of_category, continent
FROM dbo.oldest_business_joined
GROUP BY continent
ORDER BY count_of_category DESC

/* FINDING THE OLDEST BUSINESS AND CATEGORY PER CONTINENT */
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

/* FINDING THE OLDEST BUSINESS PER CATEGORY */
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
