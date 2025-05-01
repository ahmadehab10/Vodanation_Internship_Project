# Movies Dashboard Project

## Project Background

As part of my **Vodanation Internship** in the CVM Analytics team, I was tasked with analyzing a complex movie dataset from TMDB. The entertainment industry, where this dataset originates, is driven by metrics such as box office revenue, viewer ratings, and genre popularity. The dataset spanned over 4,800 movies, covering releases from 1916 to 2017.

From a data analyst’s perspective, the project aimed to transform nested JSON arrays into usable tables, uncover trends in movie performance, and design a dynamic dashboard that supports insights-driven storytelling.

**Insights and recommendations are provided on the following key areas:**
- **Revenue and Profit Drivers**  
- **Genre Distribution and Popularity**  
- **Runtime Trends and Distributions**  
- **Budget-Profit Relationship**

---

## Data Structure & Initial Checks

The dataset is stored in a single table called **`tmdb_5000_movies`**, which contains metadata about 4,804 movies.

### Key columns include:
- `id` – Unique identifier for each movie  
- `genres` – JSON array of genre IDs and names  
- `keywords` – JSON array of descriptive tags  
- `production_companies` – JSON array with company names and IDs  
- `production_countries` – JSON array of ISO codes and country names  
- `spoken_languages` – JSON array of language codes and names  
- `budget`, `revenue`, `runtime`, `release_date`, `popularity`, `vote_average`, `vote_count` – numeric/metric values  
- `original_title`, `title`, `tagline`, `overview`, `status` – descriptive fields  
- `homepage` – Official website URL (if available)  
- `original_language` – ISO 639-1 language code

**Initial Checks and Cleaning:**
- Handled JSON array columns using normalization.
- Removed unnecessary columns to streamline analysis.
- Ensured correct data types for numeric and date columns.
- Verified completeness and consistency before importing to MySQL.

---

## Executive Summary

### Overview of Findings

The analysis uncovered key trends in movie production and performance. High revenue and profit were concentrated among action and franchise films like *Avatar* and *Furious 7*. Drama was the most produced genre. Budgets and profits showed a positive correlation, though not strongly linear. Movie production saw consistent growth from the 1980s to early 2010s before tapering.

**Top Takeaways:**
- High-budget action and sci-fi movies tend to drive top-line revenue.  
- Drama dominates in quantity but not necessarily in profitability.  
- Budget is a partial predictor of profit, but other factors (e.g., franchise, genre, timing) matter.  

---

## Insights Deep Dive

### Revenue and Profit Drivers:
- **Top 5 movies by revenue and profit** include *Avatar*, *Titanic*, and *The Avengers*, each grossing well above 1.5B in revenue.  
- Movies with budgets above 200M showed disproportionately high returns, especially within franchises.  
- Average rating across all movies hovered around 6.1.

### Genre Distribution and Popularity:
- **Drama** leads with 2.3K movies, followed by Comedy and Thriller.  
- Genres like Action and Sci-Fi were fewer but more revenue-intensive.  
- Romance and Thriller were more balanced between quantity and profit.

### Runtime Trends and Distributions:
- The most common movie length was between 90–110 minutes.  
- Outliers existed above 200 minutes but were rare.  
- Shorter movies (< 80 mins) were less profitable on average.

### Budget-Profit Relationship:
- A **positive correlation** exists between budget and profit, but with high variance.  
- Most profitable films had mid-to-high budgets and belonged to known franchises.  
- Outliers showed that budget alone does not guarantee profit.

---

## Recommendations

Based on the insights and findings above, we recommend the content strategy and production planning teams consider the following:

- **Invest in high-budget, franchise-based productions** for maximum revenue potential.  
- **Balance the portfolio** by continuing to produce lower-budget dramas for volume and niche audiences.  
- **Use genre and runtime filters** to identify opportunities in underproduced but profitable segments.  
- **Monitor rating-performance alignment** to assess long-term brand equity and viewer satisfaction.  
- **Further segment audience preferences** by genre, era, and runtime for targeted marketing.

---

## Assumptions and Caveats

- JSON arrays were normalized assuming correct ID-to-name mappings based on TMDB documentation.  
- Some production companies and crew data had missing or incomplete entries and were excluded.  
- Profit calculations assumed revenue and budget were in consistent currency and adjusted for inflation.  
- Ratings are user-generated and may contain bias or skew due to popularity effects.

---


## Dashboard Preview

![Dashboard Preview](https://github.com/user-attachments/assets/b5c83b2c-a8dc-4d41-99b6-1ed49a70709e)


---

