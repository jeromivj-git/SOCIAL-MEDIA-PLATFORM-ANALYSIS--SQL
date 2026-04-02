# 📱 Social Media Platform – SQL Project

## 📌 Project Overview
This project focuses on designing and analyzing a social media platform database using SQL. It simulates real-world functionalities such as users, posts, likes, comments, followers, and notifications, and demonstrates how relational databases manage and analyze user activity efficiently.

---

## 🎯 Objectives
- Design a relational database for a social media platform  
- Establish relationships using primary and foreign keys  
- Analyze user engagement using SQL queries  
- Extract meaningful insights from structured data  
- Understand real-world database design concepts  

---

## 🗂️ Database Schema

### Tables Included:
- Users  
- Posts  
- Comments  
- Likes  
- Followers  
- Notifications  

---

## 📊 Table Structure

### Users
| Column Name | Data Type | Description |
|------------|----------|-------------|
| user_id | INT | Primary Key |
| user_name | VARCHAR | User Name |
| email | VARCHAR | Email Address |

### Posts
| Column Name | Data Type | Description |
|------------|----------|-------------|
| post_id | INT | Primary Key |
| user_id | INT | Foreign Key |
| caption | TEXT | Post Caption |
| posted_at | DATETIME | Post Time |

### Comments
| Column Name | Data Type | Description |
|------------|----------|-------------|
| comment_id | INT | Primary Key |
| post_id | INT | Foreign Key |
| user_id | INT | Foreign Key |
| comment_text | TEXT | Comment Content |
| commented_at | DATETIME | Comment Time |

### Likes
| Column Name | Data Type | Description |
|------------|----------|-------------|
| like_id | INT | Primary Key |
| post_id | INT | Foreign Key |
| user_id | INT | Foreign Key |
| liked_at | DATETIME | Like Time |

### Followers
| Column Name | Data Type | Description |
|------------|----------|-------------|
| follower_id | INT | Foreign Key |
| following_id | INT | Foreign Key |
| follow_date | DATETIME | Follow Date |

### Notifications
| Column Name | Data Type | Description |
|------------|----------|-------------|
| user_id | INT | Foreign Key |
| message | TEXT | Notification Message |
| created_at | DATETIME | Created Time |

---

## 🔗 Relationships
- Users → Posts (One-to-Many)  
- Posts → Comments (One-to-Many)  
- Users → Likes (One-to-Many)  
- Users → Followers (Many-to-Many)  
- Users → Notifications (One-to-Many)  

---

## 🔍 Analysis

### 📌 Descriptive Analysis
- Total number of users, posts, likes, and comments  
- Identification of most active users  
- Average followers per user  
- Daily activity trends  

### 📌 Diagnostic Analysis
- Reasons behind high-performing posts  
- Differences in user engagement  
- Impact of content type on interactions  
- Analysis of follower growth trends  

### 📌 Predictive Analysis
- Prediction of future user engagement  
- Estimation of post popularity  
- Forecasting follower growth  
- Identification of potential influencers  

### 📌 Prescriptive Analysis
- Best time to post content  
- Content strategy recommendations  
- Methods to improve user engagement  
- Notification optimization strategies  

---

## 🛠️ Tools Used
- SQL (MySQL / PostgreSQL)  
- Relational Database Concepts  

---

## 🚀 Features
- Structured relational database design  
- Use of primary and foreign keys  
- Real-world social media simulation  
- SQL joins, aggregations, and analysis  
- Insightful data-driven results  

---

## 📈 Conclusion
This project demonstrates how SQL can be effectively used to design and analyze a social media platform database. It provides insights into user behavior, engagement patterns, and content performance, helping in better decision-making and system optimization.

---

## ⭐ Support
If you like this project, give it a ⭐ on GitHub!
