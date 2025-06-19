# Social Media Analytics (SQL)

This project contains a set of SQL queries designed to analyze social media data. The dataset includes posts with metadata such as sentiment, platform, likes, retweets, timestamps, and user information.

## 📊 Features

- Total post count and sentiment breakdown
- Most active users and top-performing posts
- Sentiment trends by time and platform
- Hashtag frequency analysis
- Engagement insights by hour and country

## 🧾 Dataset Structure

The `media` table includes the following columns:

- `unnamed` (INT) – Primary key
- `text` (TEXT) – Content of the post
- `sentiment` (TEXT) – Sentiment label (e.g., Positive, Negative, Neutral)
- `timestamp` (DATE)
- `users` (VARCHAR) – Username
- `platform` (TEXT) – Platform name
- `hashtags` (TEXT) – Space-separated hashtags
- `retweets` (INT)
- `likes` (INT)
- `country` (TEXT)
- `year`, `month`, `day`, `hour` (INT) – Date/time breakdown

## 📌 How to Use

1. Run the SQL script `social media.sql` in your preferred SQL environment (e.g., PostgreSQL, MySQL).
2. The script includes:
   - Table creation
   - 20 pre-written queries to explore and analyze the dataset

## 📈 Example Analyses

- Top 5 most liked posts
- Sentiment trends by hour
- Most frequent hashtags
- Engagement peak hours

## 🛠 Requirements

- SQL-compatible database (tested with PostgreSQL)
- Basic SQL knowledge

## 📬 Contact

For questions or collaboration, feel free to reach out!

