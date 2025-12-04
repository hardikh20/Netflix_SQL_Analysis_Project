SQL Analysis of Content Performance and Viewer Trends

Project Overview:
This project simulates a Netflix-style streaming data environment and performs SQL-based analysis to understand what kind of content drives the highest engagement, viewership, and completion rates.

Goal:
Analyze viewing patterns, genres, ratings, and audience behavior to extract meaningful business insights that support decision-making for a streaming platform.

Dataset:
Source: Kaggle – Netflix Movies and TV Shows Dataset

The dataset includes:
Show ID, Title, Type (Movie/TV Show)
Director, Cast, Country
Date Added, Release Year, Rating, Duration, Genre, Description

Additional simulated tables were created for:
Users → viewer profiles (country, plan type, device, signup date)
Watch Events → viewing activity (duration, completion status, watch date, etc.)

Database Design
Table	Description:
netflix_titles	Contains metadata about movies and TV shows
users	Holds simulated user account information
watch_events	Tracks what each user watched, duration, and completion rate

Database Name: netflix_project

Business Problems Solved (15 Key SQL Queries)
#	Business Question
1	Which type of content (Movies or TV Shows) dominates the platform?

2	Which genres have the most titles?

3	Which countries produce the most content?

4	Which ratings are most common?

5	Which directors have created the most content?

6	How many titles were released each year?

7	Which genres are watched most by users?

8	Which titles have the highest average watch duration?

9	What percentage of content is completed by users?

10	Do users watch more on weekends or weekdays?

11	Which countries have the most active viewers?

12	Which plan type watches more on average?

13	Which users are inactive (haven’t watched anything)?

14	What is the average gap between release and watch date?

15	Which genres are growing or declining year over year?


Key Insights:
Movies dominate with ~70% share; TV Shows form ~30%.

Dramas, Comedies, and Documentaries are top-performing genres.

India, USA, and UK lead in both content production and viewing.

TV-MA is the most frequent rating, followed by PG.

Premium users watch 2–3× longer than Basic users.

70% of started content is completed — strong engagement.

Evenings and weekends are peak viewing times.

Drama and Crime genres are trending upward in recent years.



Tools & Technologies:

Tool	Purpose
MySQL   Workbench	Database creation, SQL analysis
Excel	Visualization, results export, report creation
Kaggle	Dataset source
GitHub	Project hosting and version control


Folder Structure:

Netflix_SQL_Project
│
├── sql
│   ├── netflix_project.sql
│   ├── netflix_users_watch_events.sql
│   └── netflix_analysis.sql
│
├── results
│   ├── Q01_Content_Type.csv
│   ├── Q02_Genres.csv
│   ├── ...
│   └── Q15_Genre_Trends.csv
│
├── dashboard
│   └── netflix_summary_results.xlsx
│
└── docs
    ├── netflix_analysis_summary.docx
    └── netflix_analysis_summary.pdf

Learning Outcomes

Gained hands-on experience in:

Writing SQL queries for real-world business problems
Performing data cleaning, aggregation, and joins
Using GROUP BY, CASE, DATE functions, and subqueries
Exporting data for visualization and reporting
Documenting a full data analysis project workflow

Conclusion
This project demonstrates a complete SQL-based data analysis pipeline — from data import and cleaning to business insight generation and reporting.
It reflects how a Data Analyst transforms raw data into actionable insights to help businesses make data-driven decisions.

👨‍💻 Author

Hardik Harchilkar
Aspiring Data Analyst
Project Date: 11 November 2025

🔗 linkedin.com/in/hardikharchilkar
