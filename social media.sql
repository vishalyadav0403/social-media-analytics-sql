DROP TABLE IF EXISTS media
--CREATE TABLE 
CREATE TABLE media(
    unnamed INT PRIMARY KEY,
	text TEXT,
	sentiment TEXT,
	timestamp DATE,
	users VARCHAR(45),
	platform TEXT,
	hashtags TEXT,
	retweets INT,
	likes INT,
	country TEXT,
	year INT,
	month INT,
	day INT,
	hour INT
);

SELECT * FROM media

--1.How many posts are in the dataset?
SELECT COUNT(*) FROM media

--2.What are the distinct sentiment values?
SELECT DISTINCT sentiment FROM media

--3.How many posts are labeled as 'Positive'?
SELECT COUNT(*) FROM media WHERE sentiment = 'Positive'

--4.List all unique platforms used.
SELECT DISTINCT platform FROM media LIMIT 3

--5.Show the number of posts from each country.
SELECT country, COUNT(*) post_count FROM media GROUP BY country

--6.Which user has posted the most?
SELECT users, COUNT(*) post_count FROM media GROUP BY users ORDER BY post_count DESC LIMIT 1

--7.What is the average number of likes per post?
SELECT AVG(likes) AS average_likes FROM media

--8.Which sentiment type has the highest average retweets?
SELECT sentiment, AVG(RETWEETS) AS avg_retweets FROM media 
GROUP BY sentiment ORDER BY avg_retweets DESC

--9.Get the top 5 most liked posts.
SELECT * FROM media ORDER BY likes DESC LIMIT 5

--10.How many posts were made in the evening (between 18 and 23 hours)?
SELECT COUNT(*) FROM media WHERE hour BETWEEN 18 AND 23

--11.What day of the month has the highest post frequency?
SELECT day, COUNT(*) AS post_count FROM media GROUP BY day ORDER BY post_count DESC LIMIT 1

--12.What's the trend of sentiment across hours (grouped sentiment count per hour)?
SELECT hour, sentiment, COUNT(*) AS sentiment_count
FROM media GROUP BY hour, sentiment ORDER BY hour,sentiment

--13.List the top 3 platforms by average likes per post.
SELECT platform, AVG(likes) AS avg_likes FROM media
GROUP BY platform ORDER BY avg_likes DESC LIMIT 3 

--14.Which hashtag appears most frequently? (Assumes hashtags are space-separated)
WITH all_hashtags AS(
   SELECT unnest(string_to_array(hashtagS,' ')) AS tag
   FROM media
)
SELECT tag, COUNT(*) AS tag_count FROM all_hashtags 
GROUP BY tag 
ORDER BY tag_count DESC 
LIMIT 1

--15.How does sentiment distribution vary by platform?
SELECT platform, sentiment, COUNT(*) AS count
FROM media GROUP BY platform, sentiment ORDER BY platform, sentiment

--16.Which user has the highest average likes per post? (minimum 2 posts)
SELECT users, AVG(LIKES) AS avg_likes, COUNT(*) AS post_count
FROM media GROUP BY users 
HAVING COUNT(*) >=2
ORDER BY avg_likes DESC LIMIT 1

--17.Which country has the most negative sentiment posts?
SELECT country, COUNT(*) AS negative_posts
FROM media WHERE sentiment = 'Negative'
GROUP BY country ORDER BY negative_posts DESC LIMIT 1

--18.Find sentiment percentage breakdown for the whole dataset.
SELECT sentiment,
 round(COUNT(*)* 100.0 / (SELECT COUNT(*) FROM media),2) AS percentage
 FROM media GROUP BY sentiment

--19.Which hour has the highest engagement (likes + retweets combined)?
SELECT hour, SUM(likes + retweets) AS engagement 
FROM media GROUP BY hour ORDER BY engagement DESC LIMIT 1

--20.Extract top 5 posts with highest likes having sentiment as 'Positive'.
SELECT * FROM media WHERE sentiment = 'Positive'
ORDER BY likes DESC LIMIT 5


















