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
# Stage 3: Process
For this process, I'll use **Excel** for initial exploration and basic cleaning due to its accessibility and familiarity. Moreover, it is efficient for handling 1,000 rows.

Before cleaning, I am familiarizing myself with the data to find any inconsistencies.

![image](https://github.com/user-attachments/assets/86f2a85c-0dfb-4a22-8d52-da92c6f0eeb1)

* There's text in row 1285 which should be deleted before our next step so that the dataset doesn't get messed up.
* There are blank rows between each populated row. I am selecting columns A to J and then I am using the quick keys (Ctrl + G) to open the Go To tab. I click Special, select Blanks and click ok. All the blank cells are now selected. Right click, delete, shift cells up and all the blank spaces are gone.
* Age column contains some rows with gender and vice versa. I created 2 new columns - 1 for Age and 1 for Gender, which I used in order to correct the wrongly distributed data. For Age column, I used the formula =IF(ISNUMBER(B2),B2,C2) where B2 is Age_Old and C2 is Gender_Old. If the result is a number, then that number will be returned. Otherwise, we will have the value from Gender_Old column return, which is our Age. Similarly, in the Gender column we are using =IF(ISTEXT(C2),C2,B2) formula to get all the correct inputs in our Gender column. I dragged the formulas down to get the data for all the rows. Finally, I copied the 2 new columns and pasted as values over the old columns, replacing Age and Gender with the correct values.
* I renamed Twitter to X in the Platform column. Then I proceeded with renaming every column and removing caps, making it easier for my next steps.
* I created a new column called daily_usage_time_hours which was daily_usage_time_minutes divided by 60.
* I created a new column called age_group using the formula blah where i divided the users in 3 different groups using the =IF(AND(B2>=21,B2<=25),"21-25",IF(AND(B2>=26,B2<=30),"26-30","31-35")) formula.
* I copy-pasted as values all the columns that contained formulas.
* I verified the number of rows and validated that my new columns are consistent.
* The dataset is clean and ready to be used.

![image](https://github.com/user-attachments/assets/b74b4507-71d0-4dc1-9fcb-3701a81e4a7a)

# Stage 4: Analyze
As I have the most experience with Excel, I decided to continue my analysis using R tool. It was a great opportunity for me to test what I learned from the Data Analytics course.

My first step was to check how daily usage time reflects on the emotions.

![image](https://github.com/user-attachments/assets/49b2d299-b3e2-48b3-ae5e-6862944fb1a9)

I was quite surprised seeing that higher usage time meant higher happiness. When I started the analysis, I expected that users would experience more negative emotions, the more they got to use their social media.

As a next step, I created a stacked bar chart, containing the % of each emotion on each platform.

![image](https://github.com/user-attachments/assets/a8f563f5-2b30-4680-aef7-d22f347f562e)

Instagram has the highest percentage of users reporting Happiness (40%), making it the platform most associated with positive emotions. This could be due to its focus on visual content, filters, and aspirational lifestyles, which often evoke positive feelings.

On the contrary, X has the highest levels of Anger (30%) and Sadness (25%), with Happiness at a mere 10%. This suggests that X may be a platform where users encounter more contentious or distressing content, possibly due to its focus on real-time news, debates, and polarizing discussions.







