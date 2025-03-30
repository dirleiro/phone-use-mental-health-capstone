# Google Data Analytics Capstone: Social Media Usage vs Emotional Well-Being
Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)
# Introduction
For the past few months, I have been pursuing the Google Data Analytics certificate on Coursera, completing eight courses that strengthened my skills in the six-stage data analysis process (Ask, Prepare, Process, Analyze, Share, Act) and technical tools like Excel, SQL, Tableau, and R. For my capstone, I chose Path B, analyzing a 1,000-user dataset on social media usage and emotional well-being across platforms like Instagram, X, and LinkedIn, focusing on adults aged 21-35. This project allowed me to apply my learning to explore a topic I’m passionate about — how digital habits shape our emotions in a real-world context.
# Background
In today’s hyper-connected world, social media is unavoidable. In 2025, the average user spends over 145 minutes daily on platforms like Instagram, X, and LinkedIn, shaping how we connect and feel. Research highlights a dual impact: connection can boost happiness, but comparison and overload often fuel anxiety or sadness. As a data analyst at MindSpace, a fictional mental health campaign company, I’m tasked with uncovering these patterns to promote balanced digital habits. I chose this topic because I’ve noticed how scrolling Instagram lifts my mood while X leaves me drained, and I’m eager to analyze a 1,000-user dataset to reveal broader trends.
# Stage 1: Ask
The business task set by our company is to investigate how daily social media usage duration and engagement metrics influence users’ emotional well-being, identifying patterns to promote healthier digital habits.

**Key Questions**

* How does daily usage time correlate with dominant emotions?
* Which platforms are associated with positive vs negative emotions?
* Are there demographic differences (age, gender) in emotional responses to social media?

**Stakeholders and how they will leverage our findings**

* MindSpace: To focus on insights and recommendations that help MindSpace design campaigns to promote mental well-being through social media.

**Objectives**

* Analyze usage time and engagement to establish emotional correlations.
* Identify platforms and behaviors linked to positive or negative emotions.  
* Provide actionable recommendations to improve well-being, supporting MindSpace’s mission.
# Stage 2: Prepare
The dataset used, [Social Media Usage and Emotional Well-Being](https://www.kaggle.com/datasets/emirhanai/social-media-usage-and-emotional-well-being/data), was sourced from Kaggle and created by AI Inventor, Emirhan Bulut. It contains 1,000 records of anonymized user data across various social media platforms, including Instagram, X and LinkedIn. The dataset is provided in three CSV files — train.csv (1,000 rows), test.csv, and val.csv — designed for training, testing, and validation. For the purpose of this analysis, I’ll use train.csv. It includes the following key columns:
* User ID: A unique identifier for each user.
* Age: The user’s age (ranging from 21 to 35).
* Gender: Categorized as Male, Female, or Non-Binary.
* Platform: The social media platform the user primarily engages with.
* Daily Usage (minutes): Minutes spent daily on the platform (40-200 minutes).
* Posts_Per_Day: Number of posts made daily (1-8).
* Likes_Received_Per_Day: Daily likes received (5-110).
* Comments_Received_Per_Day: Daily comments received (2-40).
* Messages_Sent_Per_Day: Daily messages sent (8-50).
* Dominant_Emotion: The user’s self-reported primary emotion (Sadness, Anger, Anxiety, Boredom, Neutral, Happiness).

This dataset’s mix of quantitative usage metrics and qualitative emotional outcomes directly supports MindSpace’s goal of linking usage to emotions.

Hosted on Kaggle, the dataset is credible for educational purposes, but its synthetic nature and lack of real-world collection details limit authenticity. Biases include subjective self-reported emotions, a narrow 21-35 age range (excluding older/younger users), and uneven platform representation (e.g., Instagram’s prominence), which may skew emotional trends.
# Stage 3: Process
I used Excel for cleaning due to its accessibility, familiarity, and efficiency for 1,000 rows, though larger datasets might require R or SQL.

**Steps**

1. **Remove Extraneous Text Row**: During initial inspection, I identified text in row 1285 (beyond the intended 1,000 data rows) that appeared to be extraneous or erroneous, such as metadata or a data entry mistake. To prevent this from disrupting subsequent analysis, I selected row 1285, deleted it entirely using Excel’s ‘Delete Row’ function (right-click > Delete), and verified that the dataset retained only the 1,000 valid records. This step ensured no non-data elements interfered with cleaning or analysis. 

![image](https://github.com/user-attachments/assets/86f2a85c-0dfb-4a22-8d52-da92c6f0eeb1)

2. **Removed Blank Rows**: Selected columns A-J, used Ctrl+G > Special > Blanks, and deleted blank rows by shifting cells up, consolidating the dataset.  
3. **Corrected Age/Gender Swaps**: Some rows had age and gender values swapped. Created new columns: ‘Age’ with =IF(ISNUMBER(B2),B2,C2) to keep numbers, and ‘Gender’ with =IF(ISTEXT(C2),C2,B2) to keep text. Copied these as values to replace the original columns, ensuring accurate demographic data.  
4. **Updated Platform Names**: Renamed ‘Twitter’ to ‘X’ in the Platform column for consistency with current branding. 
5. **Standardized Column Names**: Converted column names to lowercase (e.g., ‘daily_usage_time_minutes’) for ease of use in analysis.  
6. **Added Derived Columns**: Created ‘daily_usage_time_hours’ (=daily_usage_time_minutes/60) and ‘age_group’ (=IF(AND(B2>=21,B2<=25),'21-25',IF(AND(B2>=26,B2<=30),'26-30','31-35'))) to enhance analysis. Copied these as values.  
7. **Verified Data Integrity**: Confirmed the dataset retained 1,000 rows and checked new columns for consistency (e.g., no blanks or errors).

The dataset was now clean and ready for analysis.

![image](https://github.com/user-attachments/assets/b74b4507-71d0-4dc1-9fcb-3701a81e4a7a)

# Stage 4: Analyze
While I'm most comfortable with Excel, I chose to perform this analysis in R to leverage its advanced visualization and statistical capabilities, which I learned during the Google Data Analytics course. This was an opportunity to stretch beyond my Excel roots and apply my new R skills. I began by importing the cleaned dataset (train.csv) into R, using the read.csv() function, and then used packages like ggplot2 for visualizations and dplyr for data manipulation.

**Step 1: Daily Usage Time vs Dominant Emotions**

My first step was to explore how daily usage time correlates with users’ dominant emotions. I created a box plot in R using ggplot2 to visualize the distribution of daily usage time (in minutes) across each dominant emotion category (Sadness, Anger, Anxiety, Boredom, Neutral, Happiness).

![image](https://github.com/user-attachments/assets/298350f4-a19f-4a86-9eb4-05ebca6d1fc8)

The box plot reveals how daily social media usage time relates to users’ emotions, with the line inside each box showing the median—the point where half the users spend more time and half spend less. Happiness stands out, with users spending the most time online, slightly above 150 minutes daily, suggesting that social media often brings joy or connection for these users. In contrast, Boredom users spend the least time, around 60 minutes, indicating disengagement. Negative emotions like Anger, Anxiety, and Sadness fall in between, with some anxious users spending much longer, possibly using social media to cope. 

I was surprised that more time online correlated with Happiness, as I expected negative emotions like Anxiety or Sadness to dominate due to comparison or overload. This suggests social media can be a positive outlet for many, though the patterns in negative emotions highlight the need to explore why some users may struggle.

**Step 2: Emotion Distribution Across Platforms**

Building on the usage time analysis, I sought to understand how emotional experiences vary by platform. Using R, I created a stacked bar chart with ggplot2, displaying the percentage of each dominant emotion across the platforms in the dataset (Facebook, Instagram, LinkedIn, Snapchat, Telegram, Whatsapp, X).

![image](https://github.com/user-attachments/assets/772121ec-74a8-451c-aae0-8394d497bf9c)

The chart shows how emotions vary across platforms. Instagram stands out with a strong link to Happiness, suggesting its visual content often brings joy to users. In contrast, X is heavily tied to Anger, likely due to its debate-driven nature. Platforms like Snapchat and Whatsapp lean toward Neutral emotions, indicating they may feel more functional than emotionally charged. LinkedIn shows a mix of Boredom and Anxiety, possibly reflecting professional pressures. 

These patterns suggest MindSpace can promote platforms like Instagram for positive engagement while addressing X’s potential to spark negativity.

**Step 3: Engagement Metrics by Emotion**

Next, I explored how emotions influence online engagement, focusing on likes, posts, comments, and messages per day. I created a set of box plots in R using ggplot2 to visualize these engagement metrics across each dominant emotion.

![image](https://github.com/user-attachments/assets/a5350112-48b4-4f97-8eb3-f79817542bc4)

The chart reveals how emotions shape online interactions. Happiness users are the most active, receiving the most likes, posting frequently, and engaging through comments and messages, suggesting they thrive on social connection. In contrast, Boredom users show the least engagement across all metrics, indicating a lack of interest in interacting. Anger and Anxiety users comment more than others, possibly reflecting heated debates or seeking support. 

For MindSpace, this suggests encouraging active, positive engagement while supporting users who may use comments to express Anger or Anxiety.

**Step 4: Emotion Distribution by Age Group**

Moving forward, I analyzed how emotions shift across age groups. I created a stacked bar chart with ggplot2, displaying the percentage of each dominant emotion across the age groups in the dataset (21-25, 26-30 and 31-35).

![image](https://github.com/user-attachments/assets/bd5ac9b9-6f8e-4a99-b49c-12c758d1e7c7)

Users aged 21–25 overflow with Happiness and show low negativity, embracing social media’s playful side. Happiness declines with age, while Anxiety peaks at 26–30 (perhaps due to career pressures) and Sadness and Boredom rise at 31–35 (possibly from disconnection or fatigue). Research suggests younger users enjoy a "novelty wave" online, while older users face comparison fatigue.

**Step 5: Emotion Distribution by Gender**

Finally, I explored emotional differences across gender groups (male,female and non-binary), using a stacked bar chart to visualize the distribution of dominant emotions.

![image](https://github.com/user-attachments/assets/e2c94ee1-36e6-4e2a-a65e-cc5e6e1ce72a)

Non-binary users report the highest Sadness (25%) and Anxiety (20%) with the lowest Happiness (10%), indicating a more negative emotional experience. Non-binary users may face societal challenges, discrimination, or lack of inclusive content on platforms, contributing to higher negative emotions and lower Happiness.

Female users have the highest Happiness (25%) and the lowest Anger (10%), while male users report more Anger (15%) than female and non-binary users (10% each). Female users might engage more with Happiness-driven platforms like Instagram, while male users may be more exposed to or participate in contentious interactions (e.g., debates on X), leading to higher Anger.

**Summary of Statistical Insights**

The table below consolidated the average metrics across emotions.

|dominant_emotion | Avg_Usage_Time| Avg_Posts| Avg_Likes| Avg_Comments| Avg_Messages|
|:----------------|--------------:|---------:|---------:|------------:|------------:|
|Sadness          |           83.8|       3.1|      33.0|         12.8|         21.0|
|Anger            |           90.0|       3.7|      38.2|         18.5|         22.4|
|Anxiety          |           95.6|       3.0|      40.1|         15.3|         23.9|
|Boredom          |           63.9|       1.6|      15.4|          7.0|         14.1|
|Neutral          |           77.8|       2.4|      27.8|         10.9|         18.5|
|Happiness        |          150.5|       5.7|      75.6|         26.9|         32.7|

These statistics reinforce the emotional trends observed across platforms, age, and gender, highlighting social media’s dual role as a source of joy and a potential stressor.

# Stage 5: Share

My findings were presented to MindSpace senior leadership team through a tailored presentation designed to inform their mental health campaign strategists. These insights highlighted the emotional dynamics of social media usage and set the stage for actionable campaign recommendations.

**Key Insights**

**Happiness drives higher usage time and engagement, especially on Instagram.**
Users experiencing Happiness spend more time online (averaging 150.5 minutes daily) and engage actively, particularly on Instagram, where positivity thrives.  

**Platform-specific emotions vary—Instagram boosts Happiness, X amplifies Anger.**
Instagram fosters joy through visual content, while X’s debate-driven environment heightens Anger, shaping distinct emotional experiences.  

**Age shapes emotional experiences, with younger users thriving and older users facing negativity.**
Younger users (21–25) report high Happiness, while older users (26–35) experience rising Anxiety, Sadness, and Boredom.  

**Gender impacts emotions, with non-binary users showing more Sadness and Anxiety.**
Non-binary users face elevated Sadness and Anxiety, female users lean toward Happiness, and male users exhibit more Anger.

These insights lay the groundwork for sharing findings and making recommendations tailored to each stakeholder group.


# Stage 6: Act

Based on the analysis and shared insights, I developed actionable recommendations for each stakeholder group to leverage the findings and improve emotional well-being.

**Leverage Instagram for Positive Engagement**

Happiness is strongly linked to Instagram, where users spend more time (averaging 150.5 minutes daily for happy users) and engage actively. A recommendation would be to launch a "Happiness Challenge". This would encourage users to share uplifting stories or participate in gratitude challenges (e.g., "Post 3 things that made you smile today") with a branded hashtag like #MindSpaceJoy. 

**Mitigate Anger on X**

X is heavily associated with anger, likely due to its debate-driven environment. This could be tackled by promoting constructive dialogue. Launch a campaign encouraging users to pause and reflect before posting, using a hashtag like #PauseBeforeYouPost or #MindfulX.

**Tailor Campaigns to Age-Specific Emotional Needs**

Younger users (21-25) report high happiness, while older users (26-35) experience increasing anxiety, sadness, and boredom.

Recommendations for each age: 

For ages 21-25: Create celebratory content like a "Digital Joy" series, highlighting fun, creative ways to engage online.

For ages 26-30: Address rising anxiety with campaigns offering stress management tips, such as mindfulness exercises or work-life balance advice.

For ages 31-35: Combat sadness and boredom with content on rediscovering hobbies or managing digital fatigue (e.g., "Unplug & Recharge" tips).

**Address Emotional Challenges for Non-Binary Users**

Non-binary users reported the highest levels of sadness (25%) and anxiety (20%), with the lowest happiness (10%), indicating a more negative emotional experience. It is recommended to create campaigns featuring non-binary role models. This could be achieved by developing a series of social media posts or videos showcasing positive stories and experiences from non-binary individuals to foster a sense of belonging and reduce isolation.

**Measure Campaign Impact**

Tracking the impact of our campaigns is essential to ensure alignment with our goals. This can be achieved by distributing short post-campaign surveys to assess changes in emotional well-being and collect user feedback, alongside establishing clear metrics—such as engagement rates or sentiment shifts—that keep us focused on our mission to promote healthier digital habits

# The End

Thank you for reading my capstone project all the way through. I hope you found it engaging! I’d truly appreciate any feedback you could share to help me refine it further. Wishing you a wonderful day!




















