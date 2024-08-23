------Question 1-------

SELECT brewery_name, MAX(beer_abv) from beer_reviews
GROUP BY brewery_name 
ORDER BY MAX(beer_abv) DESC
LIMIT 1

-------Question 2 -------
SELECT 
    brewery_name,
    beer_name,
    beer_style,
    COUNT(beer_beerid) AS review_count,
    AVG((review_overall + review_aroma + review_palate + review_taste + review_appearance) / 5.0) AS average_review
FROM 
    beer_reviews
GROUP BY 
    brewery_name, beer_name, beer_style
HAVING 
    AVG((review_overall + review_aroma + review_palate + review_taste + review_appearance) / 5.0) > 4.5
ORDER BY 
    review_count DESC, average_review DESC
LIMIT 3;

------Question 4-------

SELECT 
    beer_name,
    beer_style,
    MAX(review_appearance),
    MAX(review_aroma),
    MAX(review_overall),
    COUNT(beer_beerid) AS review_count,
    COUNT(DISTINCT review_profilename) AS reviewers
    FROM beer_reviews
GROUP BY 
    brewery_name, beer_name, beer_style
ORDER BY 
    review_count DESC, review_overall DESC, review_appearance DESC, review_aroma DESC
LIMIT 1;
