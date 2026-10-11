--  OptiaHQ Capstone Project

/* Question 1
Which are the 10 most profitable films of all time? Show title, year, and Profit.
*/

SELECT original_title AS title, release_year AS year, profit AS total_profit

FROM public.sql_dataset
WHERE moneydataok = 'yes'

ORDER BY 3 DESC
LIMIT 10;

/* Question 2
Using Primary Genre: how many films, what average Profit, 
and what average rating does each genre have?
Which three genres would you back with studio money, and why?
*/

SELECT primary_genres, 
		COUNT (*) AS film_count, 
		ROUND(AVG(profit), 2) AS average_profit,
		ROUND(AVG(vote_average),2) AS average_rating
		
FROM public.sql_dataset
WHERE moneydataok = 'yes'
GROUP BY primary_genres
ORDER BY average_profit DESC;

/* Question 3
Compare the four Budget Bands: how many films sit in each, 
and what are the average revenue and average Profit?
Do bigger budgets mean bigger profits? 
*/

SELECT budget_band,
		COUNT (*) AS film_count,
		ROUND(AVG(revenue_adj), 2) AS average_revenue,
		ROUND(AVG(profit), 2) AS average_profit

FROM public.sql_dataset
WHERE moneydataok = 'yes'
GROUP BY budget_band
ORDER BY
		CASE budget_band
        WHEN ' Under 10M ' THEN 1
        WHEN ' 10M to 50M ' THEN 2
        WHEN ' 50M to 100M ' THEN 3
        WHEN ' Over 100M ' THEN 4
    END;

/* Question 4
By Decade: how many valid films were released, 
and what was the average Profit? Which decade was best for the average film, 
and what might explain the trend?
*/

SELECT decade,
		COUNT (*) AS film_count,
		ROUND(AVG(profit), 2) AS average_profit

FROM public.sql_dataset
WHERE moneydataok = 'yes'
GROUP BY decade
ORDER BY decade;

/* Question 5
Which directors made at least 3 valid films and delivered the highest total Profit?
Show their film count, average rating, and total Profit for the top 10.
*/

SELECT director,
		COUNT (*) AS film_count,
		ROUND (AVG (vote_average), 2) AS average_rating,
		SUM (profit) AS total_profit

FROM public.sql_dataset
WHERE moneydataok = 'yes'
GROUP BY director
HAVING COUNT(*) >= 3
ORDER BY total_profit DESC
LIMIT 10;

/* Question 6
Using Runtime Band: how do average rating and average Profit change as films get longer?
Is the best band for ratings the same as the best band for Profit?
*/

SELECT runtime_band,
		COUNT (*) AS film_count,
		ROUND(AVG(vote_average), 2) AS average_rating,
		ROUND(AVG(profit), 2) AS average_profit

FROM public.sql_dataset
WHERE moneydataok = 'yes'
GROUP BY runtime_band
ORDER BY 
	CASE runtime_band
		WHEN 'Under 90' THEN 1
		WHEN '90 to 110' THEN 2
		WHEN '110 to 130' THEN 3
		WHEN '130 to 150' THEN 4
		WHEN 'Above 150' THEN 5
	END;

/* Question 7
Are popular films actually good films?
Compare the average popularity of highly rated films (vote_average 7 or more)
with poorly rated films (below 6). Then look at a scatter of popularity vs rating. 
What does this mean for how much a studio should trust hype?
*/
SELECT 	CASE
		WHEN vote_average >=7 THEN 'High rating group'
		WHEN vote_average <6 THEN 'Low rating group'
		ELSE 'Middle rating group'
	END AS rating_group,
		COUNT (*) AS film_count,
		AVG(popularity) AS average_popularity

FROM public.sql_dataset
GROUP BY CASE
		WHEN vote_average >=7 THEN 'High rating group'
		WHEN vote_average <6 THEN 'Low rating group'
		ELSE 'Middle rating group'
		END
ORDER BY 3 DESC;

/* Question 8
Ratings from a handful of voters are unreliable. 
Among films with at least 500 votes, which 10 have the highest vote_average? 
Use the full dataset, not just money-valid rows. Why is the vote count filter important?
*/
SELECT original_title,
		vote_count,
		vote_average
	
FROM public.sql_dataset
WHERE vote_count >=500
ORDER BY vote_average DESC,vote_count DESC
LIMIT 10;
