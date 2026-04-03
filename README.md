# 📱 Social Media Platform Analytics (SQL Project)

## 🚀 Overview
This project presents the design and analysis of a Social Media Platform Database using SQL. It simulates real-world social media functionality, including user interactions such as posting content, liking, commenting, following, and receiving notifications.

The project focuses on both database design and data analysis, helping to extract meaningful insights such as user engagement, trending content, and influencer identification. It demonstrates how SQL can be used for efficient data management and analytics.

---

## 🎯 Objectives
- Design a structured relational database for a social media platform  
- Implement features like posts, likes, comments, followers, and notifications  
- Perform data analysis to understand user behavior and engagement  
- Apply advanced SQL concepts for real-world problem solving  

---

## ⚠️ Problem Statement
Social media platforms generate massive volumes of data daily, making it difficult to manage and analyze efficiently. Without structured storage and proper analysis, it becomes challenging to identify engagement patterns, trending content, and influential users.

This project solves these challenges by building a relational database using SQL, enabling efficient storage, automated processes, and meaningful analytical insights.

---

## 🛠️ Tech Stack
- Database: MySQL  
- Language: SQL  
- Documentation: MS Word / Markdown  
- Concepts Used: Joins, Subqueries, Views, Triggers, Stored Procedures, Functions  

---

## 🗂️ Database Schema

### 📌 Tables Included
- Users  
- Posts  
- Comments  
- Likes  
- Followers  
- Notifications  

---

### 🔑 Key Relationships
- One user can create multiple posts (1:M)  
- One post can have multiple comments and likes (1:M)  
- Users can follow each other (M:N relationship)  
- Notifications are generated based on user interactions  

---

## 📊 Dataset Description

### 👤 Users Table
| Column Name | Data Type | Description |
|------------|----------|------------|
| user_id | INT | Primary Key |
| user_name | VARCHAR | User Name |
| email | VARCHAR | Email Address |

### 📝 Posts Table
| Column Name | Data Type | Description |
|------------|----------|------------|
| post_id | INT | Primary Key |
| user_id | INT | Foreign Key |
| caption | TEXT | Post Caption |
| posted_at | DATETIME | Post Time |

### 💬 Comments Table
| Column Name | Data Type | Description |
|------------|----------|------------|
| comment_id | INT | Primary Key |
| post_id | INT | Foreign Key |
| user_id | INT | Foreign Key |
| comment_text | TEXT | Comment Content |
| commented_at | DATETIME | Comment Time |

### ❤️ Likes Table
| Column Name | Data Type | Description |
|------------|----------|------------|
| like_id | INT | Primary Key |
| post_id | INT | Foreign Key |
| user_id | INT | Foreign Key |
| liked_at | DATETIME | Like Time |

### 👥 Followers Table
| Column Name | Data Type | Description |
|------------|----------|------------|
| follower_id | INT | Foreign Key |
| following_id | INT | Foreign Key |
| follow_date | DATETIME | Follow Date |

### 🔔 Notifications Table
| Column Name | Data Type | Description |
|------------|----------|------------|
| user_id | INT | Foreign Key |
| message | TEXT | Notification Message |
| created_at | DATETIME | Created Time |

---

## 📊 Analysis

### 🔹 Descriptive Analysis
- The total number of users and posts were calculated to understand platform scale and activity.  
- Engagement metrics such as likes and comments were analyzed to evaluate user interaction.  
- Daily posting activity was tracked to identify behavioral patterns.  
- Hashtag usage was analyzed to detect trending topics.  
- Aggregate summaries were generated for quick insights into the dataset.  

### 🔹 Diagnostic Analysis
- High engagement posts were examined to identify success factors.  
- User activities were compared to detect variations in engagement.  
- Low-performing content was analyzed to determine possible causes.  
- Follower trends were studied to understand their impact on engagement.  
- Data inconsistencies were identified and corrected.  

### 🔹 Predictive Analysis
- Historical data was used to predict future trending posts.  
- User growth trends were analyzed for forecasting.  
- Engagement patterns helped estimate future interactions.  
- Active users were identified for future activity prediction.  
- Potential influencers were detected based on engagement growth.  

### 🔹 Prescriptive Analysis
- Suggested strategies to improve content performance.  
- Recommended optimal posting times for better reach.  
- Proposed engagement techniques to increase interaction.  
- Optimized hashtag usage for improved visibility.  
- Provided actionable recommendations to enhance user experience.  

---

## ⚙️ Advanced Features
- Views for simplified reporting (`post_summary`)  
- Triggers for automated notifications  
- Stored Procedures for dynamic queries  
- User-Defined Functions for engagement calculation  
- Subqueries and CTEs for advanced analytics  

---

## 📈 Key Insights
- Highly active users emerge as top influencers  
- Posts with higher engagement indicate viral content  
- Hashtags improve content discoverability  
- Consistent posting increases user engagement  

---

## 🏁 Conclusion
This project demonstrates how SQL can be used to design and analyze a real-world social media database system. A well-structured schema was created, and advanced SQL techniques were used to extract meaningful insights.

The project highlights the importance of data-driven decision-making and shows how raw data can be transformed into valuable business insights for social media platforms.

---

## 📌 Future Improvements
- Integrate with Power BI or Tableau for visualization  
- Build a frontend application  
- Implement real-time analytics  
- Improve hashtag extraction logic  

---

## ⭐ Support
If you like this project, give it a ⭐ on GitHub!
