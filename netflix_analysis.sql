USE netflix_project;

-- Business Problems

-- 1️.Which type of content (Movies or TV Shows) dominates the platform?
SELECT type, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY type
ORDER BY total_titles DESC;

-- 2️.Which genres (listed_in) have the most titles?
SELECT listed_in AS genre, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY genre
ORDER BY total_titles DESC
LIMIT 10;

-- 3️.Which countries produce the most content?
SELECT country, COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- 4️.Which ratings are most common (e.g., TV-MA, PG)?
SELECT rating, COUNT(*) AS total_count
FROM netflix_titles
WHERE rating IS NOT NULL
GROUP BY rating
ORDER BY total_count DESC;

-- 5️.Which directors have created the most content?
SELECT director, COUNT(*) AS total_titles
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- 6.How many titles were released each year?
SELECT release_year, COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year DESC;

-- 7️.Which genres are watched most by users?
SELECT n.listed_in AS genre, COUNT(*) AS total_views
FROM watch_events w
JOIN netflix_titles n ON w.show_id = n.show_id
GROUP BY genre
ORDER BY total_views DESC
LIMIT 10;

-- 8️.Which titles have the highest average watch duration?
SELECT n.title, AVG(w.watch_duration_minutes) AS avg_watch_time
FROM watch_events w
JOIN netflix_titles n ON w.show_id = n.show_id
GROUP BY n.title
ORDER BY avg_watch_time DESC
LIMIT 10;

-- 9️.What percentage of content is completed by users?
SELECT 
    (COUNT(*) * 100 / 
    (SELECT COUNT(*) FROM watch_events)) AS completion_rate
FROM watch_events
WHERE completed = 'Yes';

-- 10.Do users watch more on weekends or weekdays?
-- (Assuming we have a valid 'watch_date' column)
SELECT 
    DAYNAME(watch_date) AS day_of_week,
    COUNT(*) AS total_views
FROM watch_events
GROUP BY day_of_week
ORDER BY total_views DESC;


-- 11. Which countries have the most active viewers?
SELECT u.country, COUNT(*) AS total_views
FROM watch_events w
JOIN users u ON w.user_id = u.user_id
GROUP BY u.country
ORDER BY total_views DESC
LIMIT 10;

-- 12. Which plan type (Basic/Standard/Premium) watches more on average?
SELECT u.plan_type, AVG(w.watch_duration_minutes) AS avg_watch_time
FROM watch_events w
JOIN users u ON w.user_id = u.user_id
GROUP BY u.plan_type
ORDER BY avg_watch_time DESC;

-- 13. Which users are inactive (haven’t watched anything)?
SELECT u.user_id, u.name, u.country
FROM users u
LEFT JOIN watch_events w ON u.user_id = w.user_id
WHERE w.event_id IS NULL;

-- 14. What is the average gap between release and watch date?
SELECT 
    n.title,
    AVG(YEAR(w.watch_date) - n.release_year) AS avg_year_gap
FROM watch_events w
JOIN netflix_titles n ON w.show_id = n.show_id
WHERE w.watch_date IS NOT NULL
GROUP BY n.title
ORDER BY avg_year_gap ASC
LIMIT 10;

-- 20️.Which genres are growing or declining year over year?
SELECT 
    n.listed_in AS genre,
    YEAR(w.watch_date) AS watch_year,
    COUNT(*) AS total_views
FROM watch_events w
JOIN netflix_titles n ON w.show_id = n.show_id
GROUP BY genre, watch_year
ORDER BY genre, watch_year;