# Google Data Analytics Capstone: Social Media Usage vs Emotional Well-Being
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
# Introduction
For the past couple of months, I have been attending and studying for the Google Data Analytics certificate offered on Coursera. A total of 8 courses where I enchanced my knowledge on the six stages of the data analysis process (**ask,prepare,process,analyze,share,act**), technical tools (**Excel,SQL,Tableau,R**) and how to use each one of them depending on the circumstances. At the end of the course, it is recommended by Google to create a Capstone Project to practice and use the knowledge achieved on a real-life scenario. There are 2 different paths to take. Path A involved using 2 different datasets with specific tasks,provided by Google. Path B involved researching and finding a dataset that matched the student's interests. I decided to walk down Path B and I have completed my Capstone Project on the **Social Media Usage vs Emotional Well-Being Case Study**.
# Background
In today’s hyper-connected world, social media has become an inescapable part of daily life. As of 2025, billions of people scroll, post, and engage online, with platforms like Instagram, X, and LinkedIn shaping how we communicate, work, and feel. Yet, this digital immersion comes with a cost. Research increasingly links excessive social media use to shifts in mental health—sometimes boosting happiness through connection, other times fueling anxiety, sadness, or boredom through comparison and overload. Understanding these patterns is more urgent than ever as usage times climb, particularly among younger adults navigating a post-pandemic, screen-saturated reality.

I am a data analyst at MindSpace, a fictional mental health campaign company dedicated to raising awareness about social media’s impact on emotional well-being. Our mission is to empower individuals with insights to balance their digital habits. I chose this topic for my Path B capstone because I’ve seen firsthand how scrolling can shift my mood, and I’ll be analyzing a dataset of 1,000 users habits and emotions across different platforms to uncover broader trends.
# Stage 1: Ask
The business task set by our company is to investigate how social media usage influences users emotional well-being while identifying patterns than can promote healthier digital habits.

The stakeholders and how they will leverage our findings: 

* MindSpace: To design targeted awareness campaigns.
* Mental Health Professionals: To advise clients on managing social media for better emotional health 
* Individuals: To adjust their digital habits with actionable insights.
* Platform Representatives : To enhance user experience and well-being features.

The objectives include:

* Analyzing the relationship between social media usage patterns and dominant emotions to establish clear connections.  
* Identifying specific platforms or behaviors linked to positive or negative emotional outcomes, pinpointing areas of opportunity or concern.  
* Providing actionable recommendations for promoting healthier digital habits, based on the analysis, to improve users emotional well-being and support MindSpace’s goals.
# Stage 2: Prepare
The dataset used for this analysis is the [Social Media Usage and Emotional Well-Being](https://www.kaggle.com/datasets/emirhanai/social-media-usage-and-emotional-well-being/data) dataset, sourced from Kaggle and created by AI Inventor, Emirhan Bulut. It contains 1,000 records of anonymized user data across various social media platforms, including Instagram, X and LinkedIn. The dataset includes the following key columns:
* User ID: A unique identifier for each user.
* Age: The user’s age (ranging from 21 to 35).
* Gender: Categorized as Male, Female, or Non-Binary.
* Platform: The social media platform the user primarily engages with.
* Daily Usage (minutes): Minutes spent daily on the platform (40-200 minutes).
* Posts_Per_Day: Number of posts made daily (1-8).
* Likes_Received_Per_Day: Daily likes received (5-110).
* Comments_Received_Per_Day: Daily comments received (2-40).
* Messages_Sent_Per_Day: Daily messages sent (8-50).
* Dominant_Emotion: The user’s self-reported primary emotion (Happiness, Anger, Anxiety, Sadness, Neutral, Boredom).

This dataset’s mix of quantitative usage metrics and qualitative emotional outcomes directly supports MindSpace’s goal of exploring social media’s impact on emotional well-being.

The dataset is provided in three CSV files — train.csv (1,000 rows), test.csv, and val.csv — designed for training, testing, and validation. For the purpose of this analysis, I’ll use train.csv.

Regarding credibility, the dataset is hosted on Kaggle, a trusted data science platform. The dataset was meticulously crafted by Emirhan Bulut to simulate survey responses where users reported daily usage and emotions. While this design suits my educational capstone, its synthetic nature and lack of real-world collection details limit its authenticity. Potential biases include self-reported emotions (subjective accuracy), a narrow age range (21-35), and uneven platform representation (e.g, more Instagram users), which I’ll consider during analysis.




