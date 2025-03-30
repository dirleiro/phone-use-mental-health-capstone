# Install and load required libraries
pkgs <- c("tidyverse", "gridExtra", "knitr")
invisible(lapply(pkgs, function(pkg) if (!require(pkg, character.only = TRUE)) install.packages(pkg)))
lapply(pkgs, library, character.only = TRUE)

# Load dataset
data <- read.csv("train.csv")

# Define color palette for emotions (intuitive, colorblind-friendly)
emotion_colors <- c("Sadness" = "#1F77B4", "Anger" = "#D62728", "Anxiety" = "#FF7F0E",
                    "Boredom" = "#7F7F7F", "Neutral" = "#17BECF", "Happiness" = "#2CA02C")

# Define emotion order
emotion_order <- c("Sadness", "Anger", "Anxiety", "Boredom", "Neutral", "Happiness")

# Daily Usage by Dominant Emotion: Boxplot of Usage Time By Emotion
p_usage_emotion <- ggplot(data, aes(x = factor(dominant_emotion, levels = emotion_order), 
                                    y = daily_usage_time_minutes, fill = dominant_emotion)) +
  geom_boxplot(outlier.shape = 8, outlier.size = 2) +
  scale_fill_manual(values = emotion_colors) +
  theme_minimal() +
  labs(title = "From Sadness to Happiness: The Time We Spend Online", x = "", y = "Daily Usage (Minutes)") +
  theme(legend.position = "none", plot.title = element_text(hjust = 0.5, size = 14),
        axis.text.x = element_text(angle = 45, hjust = 1))

print(p_usage_emotion)
ggsave("usage_time_by_emotion.png", p_usage_emotion, width = 8, height = 6, dpi = 300)

# Emotion Distribution by Platform: Percentage of emotions per platform
platform_emotion <- data %>%
  group_by(platform, dominant_emotion) %>%
  summarise(count = n(), .groups = "drop") %>%
  group_by(platform) %>%
  mutate(percentage = count / sum(count) * 100,
         dominant_emotion = factor(dominant_emotion, levels = emotion_order))

p_platform_emotion <- ggplot(platform_emotion, aes(x = platform, y = percentage, fill = dominant_emotion)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = emotion_colors) +
  theme_minimal() +
  theme(panel.grid.major.y = element_line(color = "grey90")) +
  labs(title = "The Emotional Landscape of Social Networks", x = "", y = "Percentage (%)", fill = "Dominant Emotion") +
  theme(plot.title = element_text(hjust = 0.5, size = 14), axis.text.x = element_text(angle = 45, hjust = 1))

print(p_platform_emotion)
ggsave("emotion_by_platform.png", p_platform_emotion, width = 8, height = 6, dpi = 300)

# Define custom theme for engagement plots
custom_theme <- theme_minimal() +
  theme(legend.position = "none", plot.title = element_text(hjust = 0.5, size = 12),
        axis.text.x = element_text(angle = 45, hjust = 1))

# Function to create boxplots for engagement metrics
create_boxplot <- function(data, y_var, y_label) {
  ggplot(data, aes(x = factor(dominant_emotion, levels = emotion_order), 
                   y = !!sym(y_var), fill = dominant_emotion)) +
    geom_boxplot(outlier.shape = 8, outlier.size = 2) +
    scale_fill_manual(values = emotion_colors) +
    labs(title = "", x = "", y = y_label) +
    custom_theme
}

# Create individual engagement plots
p_likes <- create_boxplot(data, "likes_received_per_day", "Likes Per Day")
p_posts <- create_boxplot(data, "posts_per_day", "Posts Per Day")
p_comments <- create_boxplot(data, "comments_received_per_day", "Comments Per Day")
p_messages <- create_boxplot(data, "messages_sent_per_day", "Messages Per Day")

# Arrange and save engagement plots
engagement_grid <- arrangeGrob(p_likes, p_posts, p_comments, p_messages, ncol = 2,
                               top = "Emotions in Engagement: How We React Online")
grid.arrange(engagement_grid)
ggsave("engagement_metrics.png", engagement_grid, width = 10, height = 8, dpi = 300)

# Emotion Distribution by Age Group: Percentage of emotions per age group
age_emotion <- data %>%
  group_by(age_group, dominant_emotion) %>%
  summarise(count = n(), .groups = "drop") %>%
  group_by(age_group) %>%
  mutate(percentage = count / sum(count) * 100,
         dominant_emotion = factor(dominant_emotion, levels = emotion_order))

p_age_emotion <- ggplot(age_emotion, aes(x = age_group, y = percentage, fill = dominant_emotion)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = emotion_colors) +
  theme_minimal() +
  theme(panel.grid.major.y = element_line(color = "grey90")) +
  labs(title = "How Feelings Shift Over Time", x = "", y = "Percentage (%)", fill = "Dominant Emotion") +
  theme(plot.title = element_text(hjust = 0.5, size = 14))

print(p_age_emotion)
ggsave("emotion_by_age_group.png", p_age_emotion, width = 8, height = 6, dpi = 300)

# Emotion Distribution by Gender: Percentage of emotions per gender
gender_emotion <- data %>%
  group_by(gender, dominant_emotion) %>%
  summarise(count = n(), .groups = "drop") %>%
  group_by(gender) %>%
  mutate(percentage = count / sum(count) * 100,
         dominant_emotion = factor(dominant_emotion, levels = emotion_order))

p_gender_emotion <- ggplot(gender_emotion, aes(x = gender, y = percentage, fill = dominant_emotion)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = emotion_colors) +
  theme_minimal() +
  theme(panel.grid.major.y = element_line(color = "grey90")) +
  labs(title = "Gendered Emotions in the Digital World", x = "", y = "Percentage (%)", fill = "Dominant Emotion") +
  theme(plot.title = element_text(hjust = 0.5, size = 14))

print(p_gender_emotion)
ggsave("emotion_by_gender.png", p_gender_emotion, width = 8, height = 6, dpi = 300)

# Summary Statistics Table: Mean metrics by dominant emotion
summary_stats <- data %>%
  group_by(dominant_emotion) %>%
  summarise(Avg_Usage_Time = mean(daily_usage_time_minutes),
            Avg_Posts = mean(posts_per_day),
            Avg_Likes = mean(likes_received_per_day),
            Avg_Comments = mean(comments_received_per_day),
            Avg_Messages = mean(messages_sent_per_day)) %>%
  arrange(factor(dominant_emotion, levels = emotion_order))

print(summary_stats)
kable(summary_stats, caption = "Summary Statistics by Dominant Emotion", digits = 1)
