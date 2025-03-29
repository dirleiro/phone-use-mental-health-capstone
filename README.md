# Google Data Analytics Capstone: Social Media Usage vs Emotional Well-Being
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
# Introduction
For the past few of months, I have been pursuing the Google Data Analytics certificate on Coursera, completing eight courses that strenghtened my skills in the six-stage data analysis process (Ask, Prepare, Process, Analyze, Share, Act) and technical tools like Excel, SQL, Tableau, and R. For my capstone, I chose Path B, analyzing a 1,000-user dataset on social media usage and emotional well-being across platforms like Instagram, X, and LinkedIn, focusing on adults aged 21-35. This project allowed me to apply my learning to explore a topic I’m passionate about — how digital habits shape our emotions in a real-world context.
# Background
In today’s hyper-connected world, social media is unavoidable. In 2025, the average user spends over 145 minutes daily on platforms like Instagram, X, and LinkedIn, shaping how we connect and feel. Research highlights a dual impact: connection can boost happiness, but comparison and overload often fuel anxiety or sadness. As a data analyst at MindSpace, a fictional mental health campaign company, I’m tasked with uncovering these patterns to promote balanced digital habits. I chose this topic because I’ve noticed how scrolling Instagram lifts my mood while X leaves me drained, and I’m eager to analyze a 1,000-user dataset to reveal broader trends.
# Stage 1: Ask
The business task set by our company is to investigate how daily social media usage duration and engagement metrics influence users’ emotional well-being, identifying patterns to promote healthier digital habits.

**Key Questions**

* How does daily usage time correlate with dominant emotions?
* Which platforms are associated with positive vs negative emotions?
* Are there demographic differences (age, gender) in emotional responses to social media?

**Stakeholders and how they will leverage our findings**

* MindSpace: To craft targeted campaigns using platform-specific insights.
* Mental Health Professionals: To guide clients based on usage-emotion links 
* Individuals: To adjust habits with data-driven recommendations.  
* Platform Representatives : To enhance well-being features using emotional trends.

**Objectives**

* Analyze usage time and engagement to establish emotional correlations.
* Identify platforms and behaviors linked to positive or negative emotions.  
* Provide actionable recommendations to improve well-being, supporting MindSpace’s mission.
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

I was surprised seeing that higher usage time was associated with higher happiness. When I started the analysis, I expected that users would experience more negative emotions, the more they got to use their social media.

As a next step, I created a stacked bar chart, containing the % of each emotion on each platform.

![image](https://github.com/user-attachments/assets/a8f563f5-2b30-4680-aef7-d22f347f562e)

Instagram fosters the highest Happiness (40%), followed by Snapchat (30%), while X has the highest Anger (30%) and Sadness (25%).

Instagram and Snapchat’s focus on visual storytelling, filters, and casual interactions likely promotes positive emotions, whereas X’s real-time, debate-driven environment may expose users to contentious or distressing content, leading to more negative emotions.

After comparing social platforms, I proceeded with comparing the different engagement metrics with the dominant emotions.

![image](https://github.com/user-attachments/assets/f149b04b-383d-453b-a0f3-7fb134530beb)

Happiness drives the highest engagement across all metrics, with medians of 40 likes, 4 posts, 25 comments, and 30 messages per day, showing that happy users are the most active. Positive emotions likely encourage users to share more content, interact with others, and engage in social behaviors, as Happiness fosters a sense of connection and reward on platforms.

Anger leads to the most comments among negative emotions (median 20 comments), while Boredom consistently has the lowest engagement (medians of 15 likes, 1 post, 10 comments, 10 messages). Angry users may post provocative content that sparks debates, leading to more comments, whereas bored users lack motivation to engage, resulting in minimal activity.

![image](https://github.com/user-attachments/assets/86d1a492-e81f-463f-8dc4-f5aed28a0a5b)

The 21–25 age group reports the highest Happiness (30%) and the lowest negative emotions (Sadness, Anger, Anxiety at 10% each), while Happiness decreases with age (20% for 26–30 and 31–35). Younger users (21–25) may be more carefree, using platforms for entertainment and social connection, while older users face more life stressors (e.g., career, relationships), reducing Happiness and increasing negative emotions.

The 26–30 age group has the highest Anxiety (25%), and the 31–35 age group has the highest Sadness (25%) and Boredom (20%). The 26–30 group might experience anxiety due to life transitions (e.g., job changes, relationships), while the 31–35 group’s Sadness and Boredom could stem from reflection or feeling disconnected as they age.

![image](https://github.com/user-attachments/assets/1d49517e-c657-4f5d-9027-c79a116df6dc)

Non-binary users report the highest Sadness (25%) and Anxiety (20%) with the lowest Happiness (10%), indicating a more negative emotional experience. Non-binary users may face societal challenges, discrimination, or lack of inclusive content on platforms, contributing to higher negative emotions and lower Happiness.

Female users have the highest Happiness (25%) and the lowest Anger (10%), while male users report more Anger (15%) than female and non-binary users (10% each). Female users might engage more with Happiness-driven platforms like Instagram, while male users may be more exposed to or participate in contentious interactions (e.g., debates on X), leading to higher Anger.

Table: Summary Statistics by Dominant Emotion

|dominant_emotion | Avg_Usage_Time| Avg_Posts| Avg_Likes| Avg_Comments| Avg_Messages|
|:----------------|--------------:|---------:|---------:|------------:|------------:|
|Sadness          |           83.8|       3.1|      33.0|         12.8|         21.0|
|Anger            |           90.0|       3.7|      38.2|         18.5|         22.4|
|Anxiety          |           95.6|       3.0|      40.1|         15.3|         23.9|
|Boredom          |           63.9|       1.6|      15.4|          7.0|         14.1|
|Neutral          |           77.8|       2.4|      27.8|         10.9|         18.5|
|Happiness        |          150.5|       5.7|      75.6|         26.9|         32.7|

Happiness has the highest averages across all metrics: 150.5 minutes of usage time, 5.7 posts, 75.6 likes, 26.9 comments, and 32.7 messages per day, reinforcing its role as the primary driver of engagement. Happy users are likely motivated by positive reinforcement (e.g., likes, comments) and social connection, leading to prolonged and active engagement on platforms.

Boredom has the lowest averages (63.9 minutes, 1.6 posts, 15.4 likes, 7.0 comments, 14.1 messages), while Anger leads in comments (18.5) among negative emotions. Boredom’s low engagement reflects a lack of motivation to interact, while Anger’s high comments suggest that angry users post content that provokes reactions, possibly due to controversial or emotional topics.






