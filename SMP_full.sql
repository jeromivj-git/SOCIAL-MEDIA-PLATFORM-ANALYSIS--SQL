-- challenge 1-posts table with constarints
create database smp;
use smp;
-- users table creation
create table users (user_id int primary key auto_increment,user_name varchar(20));
-- Alter users table to include email column
alter table users add email varchar(50);

create table posts (
					post_id int primary key auto_increment,
                    user_id int,
					caption text,
                    posted_at datetime default current_timestamp,
                    foreign key(user_id) references users(user_id)
                    );
                    
     -- challenge 2-Followers table
     
     create table followers(
							follower_id int,
							following_id int,
							follow_date datetime default current_timestamp,
                            foreign key(follower_id) references users(user_id),
                            foreign key(following_id) references users(user_id)
							);
                            
-- challenge 3- insert sample data -insert 5 users and 5 posts
insert into users (user_name)
values('Jeromi') ,
	  ('Jency'),
	  ('Xavier'),
      ('Beula'),
      ('Jude');
      insert into users(user_name) values('Vennba');
      insert into users(user_name) values('Andrews');
	  insert into users(user_name) values('Ani');
      
     select * from users; 
     
     update users set user_name='Jordan' where user_id=7;
     update users set user_name='Albert' where user_id=8;
     update users set user_name='Jeltin Jeromi' where user_id=6;
	update users set user_name='Beula Charles' where user_id=9;
	update users set user_name='Jeromi' where user_id=1;
      -- insert emailID after alteration with update query for all existing users
      
      UPDATE users
SET email = CASE 
    WHEN user_id = 1 THEN 'jeromi1985@gmail.com'
    WHEN user_id = 2 THEN 'jency987@gmail.com'
    WHEN user_id = 3 THEN 'xavieralbert@gmail.com'
     WHEN user_id = 4 THEN 'beulaj456.c@gmail.com'
    WHEN user_id = 5 THEN 'jude123@gmail.com'
    WHEN user_id = 6 THEN 'jeromi444@gmail.com'
    WHEN user_id = 7 THEN 'jencyjordan@gmail.com'
    WHEN user_id = 8 THEN 'albert_jac@gmail.com'
     WHEN user_id = 9 THEN 'beula555@gmail.com'
   END
WHERE user_id IN (1,2,3,4,5,6,7,8,9);
      
     -- insert in posts
     
INSERT INTO posts (user_id, caption)
VALUES (1, 'Enjoying a sunny day at the beach'),
	   (2, 'Learning SQL is fun!'),
	   (3, 'Just finished reading a great book'),
	   (4, 'Working on my data analytics project'),
	   (5, 'Weekend vibes with family');
       insert into posts(user_id,caption)values(6,'God is with me');
       insert into posts(user_id,caption)values(7,'How to live healthy');
       insert into posts(user_id,caption)values(7,'Enjoy every minute');
       insert into posts(user_id,caption)values(7,'Do not turn back');
       insert into posts(user_id)values(1);  -- inserting null captions in posts table
       insert into posts(user_id)values(2);  -- inserting null captions in posts table
       insert into posts(user_id)values(3);  -- inserting null captions in posts table
       insert into posts(user_id)values(6);  -- inserting null captions in posts table
       
       -- updations in posts and users table
      update posts set posted_at="2026-02-14 15:12:34" where post_id=5;
      update posts set posted_at="2025-09-14 15:12:34" where post_id=11;
      update users set user_name='Beula.J.C' where user_id=4;
      update users set email='Beula.J.C@hotmail.com' where user_id=4;
      update users set email='Jeromi111@yahoo.com' where user_id=1;
      insert into posts(user_id,caption,posted_at) values(1,'Live long life',"2026-01-14 12:34:23");
select * from posts;
-- challenge 1
-- filter Retrieve all users whose username starts with “a”.
select * from users where user_name like'a%'; -- begins with a
select * from users where user_name like'%a'; -- ends with a
select * from users where user_name like'%be%'; -- be anywhere in the name
select * from users where user_name like'_e%'; -- e in sec position
select * from users where user_name like'a_%'; -- starts with a and are atleast 2 char in length
select * from users where user_name like'a__'; -- starts with a and exactly 3 letters
select * from users where user_name like'a%s'; -- starts with a ends with s

-- challenge 2
-- Get posts posted BETWEEN '2026-01-01' AND '2026-03-31'.
select * from posts where posted_at between '2026-01-01'and '2026-03-31';
-- Challenge 3-null checks - Find posts that have NULL captions.
select * from posts where caption is null;
-- not null checks - Find posts that have captions.
select * from posts where caption is not null;

-- Challenge 4 — IN Clause
-- Find users whose email domain is in:(@gmail.com, @hotmail.com, @yahoo.com) 
SELECT *
FROM users
WHERE SUBSTRING_INDEX(email,'@',-1) IN ('gmail.com');
SELECT *
FROM users
WHERE SUBSTRING_INDEX(email,'@',-1) IN ('yahoo.com');
SELECT *
FROM users
WHERE SUBSTRING_INDEX(email,'@',-1) IN ('hotmail.com');

-- remove duplicate names mistakenly inserted.
delete from users where user_id between 13 and 19;
delete from users where user_id between 10 and 23;
delete from users where user_id=24;
------------------------------------------------------------------------------------------------------------------------------------------
-- session 31 coding challenge  -- order by , group by ,limit,having
-- challenge 1 -Top active users (Sort users by number of posts(desc) limit 5 )

-- active users with join
SELECT u.user_name, COUNT(p.post_id) AS total_posts
FROM users u
JOIN posts p ON u.user_id = p.user_id
GROUP BY u.user_id, u.user_name
ORDER BY total_posts DESC
LIMIT 5;

 -- top active users
select user_name,count(post_id) as Total_posts 
from users u ,pposts p  where u.user_id =p.user_id  
group by user_name order by total_posts desc limit 5;
select * from posts;
-- Challenge 2 — Group by Posts Per Day
-- Group posts by DATE(posted_at) and return:date
-- total posts
-- Only show days with more than 10 posts (HAVING)

select date(posted_at) as POST_DATE , count(posted_at) as Total_Posts
 from posts
 group by date(posted_at) 
 having Total_Posts>10;
 -------------------------------------------------------------------------------------------------------------------------------------
-- SESSION 32 – JOINS, UNION, BUILT-IN FUNCTIONS
-- Challenge 1 — Comments Table
-- Create:comments ,comment_id (PK),post_id (FK),user_id (FK),comment_text,commented_at,likes,like_id (PK),post_id (FK),user_id (FK),liked_at
create table Comments(comment_id int primary key auto_increment,
					 post_id int,
					 user_id int,
					comment_text text,
					commented_at datetime default current_timestamp,
                    foreign key(user_id)references users(user_id),
                    foreign key(post_id)references posts(post_id)
                    );
                    
create table  likes(like_id int  primary key auto_increment,
					liked_at datetime default current_timestamp,
                    post_id int ,
                    user_id int,
                    foreign key(user_id)references users(user_id),
                    foreign key(post_id)references posts(post_id)
                    );
                    
insert into comments(comment_id,
					 post_id ,
					 user_id,
					comment_text
					)
                    values(1,1,1,'woderful');  
                    select * from Comments;
                    
                    insert into comments(
					 post_id ,
					 user_id,
					comment_text
					)
                    values(1,1,'awesome'); 
                    
                    insert into comments(
					 post_id ,
					 user_id,
					comment_text
					)
                 values
				(2,4,'Very useful post'),
				(2,5,'thank u so much for this post'),
                (7,6,'wonderrful message'),
                (10,3,'nice poast'),
			    (11,2,'awesome');
                  
                    select * from posts;
                    select * from comments;
                    select * from likes;
                    select * from users;
              

insert into likes(post_id,user_id)values(1,2);      
insert into likes(post_id,user_id)values(1,2),(2,4),(3,5),(6,7),(4,8),(7,3);    
            
-- Challenge 2 — JOIN Report
-- Display:
-- post_id, username, caption, total likes, total comments.   

    SELECT 
    p.post_id,
    u.user_name,
    p.caption,
    COUNT(DISTINCT l.like_id) AS Total_Likes,
    COUNT(DISTINCT c.comment_id) AS Total_Comments
FROM posts p
JOIN Users u ON p.user_id = u.user_id
LEFT JOIN likes l ON p.post_id = l.post_id
LEFT JOIN Comments c ON p.post_id = c.post_id
GROUP BY p.post_id, u.user_name, p.caption;

/*Challenge 3 — Built-in Functions
Show usernames in UPPER case.
Extract month name from posted_at.
Return the length of each caption.*/

SELECT 
    UPPER(u.user_name) AS UserName_Upper,
    MONTHNAME(p.posted_at) AS Post_Month,
    LENGTH(p.caption) AS Caption_Length
FROM posts p
JOIN Users u ON p.user_id = u.user_id;
------------------------------------------------------------------------------------------------------------------------------------

                   
use smp;
/* Challenge 1 — User Defined Function
Create a function:
GetUserEngagement(user_id)
Returns total likes + comments made by the user.*/

delimiter //
create function GetUserEngmt(id int)
returns varchar(100)
deterministic
begin
	declare count_likes int;
    declare count_comments int;
		select count(*) into count_likes from likes where user_id=id;
        select count(*) into count_comments from comments where user_id=id;
        return concat ('likes:',count_likes,',Comments:',count_comments);
                 
end //
delimiter ;

select user_id,user_name,GetUserEngmt(user_id) as Total_Like_Comments from users;
SELECT GetUserEngmt(1);

DROP FUNCTION IF EXISTS GetUserEngmt;

/*Challenge 2 — Subquery
Find users who have more followers than the average follower count.*/

SELECT u.user_name,
       COUNT(f.follower_id) AS Total_followers
FROM users u
LEFT JOIN followers f 
    ON u.user_id = f.following_id
GROUP BY u.user_id, u.user_name
HAVING COUNT(f.follower_id) > (
    SELECT AVG(followers_count)
    FROM (
        SELECT COUNT(*) AS followers_count
        FROM followers
        GROUP BY following_id
    ) as t
);

/* Challenge 3 — Stored Procedure
Stored procedure to retrieve all posts for a given username.*/

delimiter //
create procedure retrieve_posts1(IN uname varchar(50))
begin
    select p.user_id,u.user_name,p.caption 
    from users u 
    inner join posts p 
    on u.user_id=p.user_id
    where u.user_name=uname ;
end //
delimiter ;
call retrieve_posts1('jeromi');
DELIMITER //

select * from users;
select * from posts;

    
DROP PROCEDURE IF EXISTS retrieve_posts1;


select * from users;
select * from followers;
insert into followers values(1,2,"2024-04-12"),(1,3,"2024-03-15");
insert into followers values(1,5,"2024-04-12"),(1,6,"2024-03-15"),(2,6,"2023-02-12");
------------------------------------------------------------------------------------------------------------------------------
/*SESSION 34 – VIEWS & TRIGGERS
Challenge 1 — View
Create a view post_summary showing:
post_id
username
caption
total likes
total comments
Challenge 2 — Trigger
Trigger on likes table:
When a user likes a post, insert a row into a new table:
notifications (user_id, message, created_at)*/
select * from likes;
use smp;

CREATE VIEW post_summary AS
SELECT 
    p.post_id,
    u.user_name,
    p.caption,
    IFNULL(l.total_likes, 0) AS total_likes,
    IFNULL(c.total_comments, 0) AS total_comments
FROM posts p
LEFT JOIN users u 
    ON u.user_id = p.user_id

LEFT JOIN (
    SELECT post_id, COUNT(*) AS total_likes
    FROM likes
    GROUP BY post_id
) l ON p.post_id = l.post_id

LEFT JOIN (
    SELECT post_id, COUNT(*) AS total_comments
    FROM comments
    GROUP BY post_id
) c ON p.post_id = c.post_id;

drop view post_summary;
select * from post_summary;



---------------------------------------------------------------
-- challenge 2

CREATE TABLE notifications (
    user_id INT,
    message VARCHAR(255),
    created_at DATETIME
);


DELIMITER //

CREATE TRIGGER after_like_insert
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
    DECLARE post_owner INT;

    -- Find post owner
    SELECT user_id INTO post_owner
    FROM posts
    WHERE post_id = NEW.post_id;

    -- Insert notification
    INSERT INTO notifications(user_id, message, created_at)
    VALUES (
        post_owner,
        CONCAT('Your post was liked by user ', NEW.user_id),
        NOW()
    );
END //
DELIMITER ;


SET SQL_SAFE_UPDATES = 0;
DELETE FROM notifications WHERE user_id = 101;

SET SQL_SAFE_UPDATES = 1;
INSERT INTO likes (like_id, user_id, post_id)
VALUES (10, 2, 10);
INSERT INTO likes(like_id,user_id, post_id)
VALUES (11,5, 6);
select * from likes;
select * from posts;
delete from likes where like_id=102;
delete from notifications where user_id=1;
SELECT * FROM notifications;
------------------------------------------------------------------------------------------------------------
/*SESSION 36 – FINAL PROJECT: SOCIAL MEDIA ANALYTICS
Complete end-to-end analysis:
Final Challenges
Top influencers (users with highest total engagement)
Virality report (posts with unusually high engagement)
User activity timeline (daily/weekly posting patterns)
Follower growth (who gained the most followers recently)
Trending hashtags (most used hashtags in last 30 days)*/
use smp;

/* 1.Top influencers (users with highest total engagement)*/

WITH engagement AS (
    SELECT 
        p.user_id,
        COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS total_engagement
    FROM posts p
    LEFT JOIN likes l ON p.post_id = l.post_id
    LEFT JOIN comments c ON p.post_id = c.post_id
    GROUP BY p.post_id,p.user_id
)
SELECT 
    u.user_id,
    u.user_name,
    SUM(e.total_engagement) AS total_engagement
FROM engagement e
JOIN users u ON u.user_id = e.user_id
GROUP BY u.user_id, u.user_name
ORDER BY total_engagement DESC
LIMIT 10;
select* from likes;
select * from comments;
select * from users;
select*from posts;

-------------------------------------------------------------------------
/*2.Virality report (posts with unusually high engagement)*/
WITH post_engagement AS (
    SELECT 
        p.post_id,
        p.user_id,
        p.caption,
        COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS total_engagement
    FROM posts p
    LEFT JOIN likes l ON p.post_id = l.post_id
    LEFT JOIN comments c ON p.post_id = c.post_id
    GROUP BY p.post_id, p.user_id, p.caption
)
SELECT 
    u.user_id,
    u.user_name,
    pe.post_id,
    pe.caption,
    pe.total_engagement
FROM post_engagement pe

 JOIN users u ON pe.user_id = u.user_id
WHERE pe.total_engagement > (
    SELECT AVG(total_engagement) FROM post_engagement
)
ORDER BY pe.total_engagement DESC;
-------------------------------------------------------------------------------
/*3. User activity timeline (daily/weekly posting patterns)*/

select u.user_id,p.post_id,u.user_name,p.caption,date(p.posted_at) as Date_of_Post 
from users u
join posts p on u.user_id=p.user_id
group by u.user_id,u.user_name,p.post_id,p.caption,date(p.posted_at)
order by  user_id,post_id;
 
 select p.post_id, u.user_id,u.user_name,p.caption,YEAR(p.posted_at) as Year_of_Post, WEEK(p.posted_at) as Week_of_Post from users u
  join posts p on u.user_id=p.user_id
 group by u.user_id,u.user_name,p.post_id,p.caption,year(p.posted_at),week(p.posted_at),date(p.posted_at) order by user_id,post_id ;
 
 ---------------------------------------------------------------------------------

/* 4.Follower growth (who gained the most followers recently)*/
WITH gained_followers AS (
    SELECT 
        following_id AS user_id,
        COUNT(*) AS new_followers
    FROM followers
    WHERE follow_date >= CURDATE() - INTERVAL 30 DAY
    GROUP BY following_id
)
SELECT u.user_id, u.user_name, gf.new_followers
FROM gained_followers gf
JOIN users u ON u.user_id = gf.user_id
ORDER BY new_followers DESC;

-- update followers set follow_date="2026-01-07 12:30:00"where follower_id=1 and following_id=5;

select * from followers;
insert into followers values(2,3,"2026-03-14"),(5,3,"2026-03-11"),(6,3,"2026-03-13");
----------------------------------------------------------------------

/* 5. Trending hashtags*/
SELECT 
    TRIM(
        SUBSTRING_INDEX(
            SUBSTRING_INDEX(CONCAT(p.caption, ' '), '#', -1),
            ' ',
            1
        )
    ) AS Hashtag,
    COUNT(*) AS Usage_count
FROM posts p
WHERE p.caption LIKE '%#%'
GROUP BY hashtag
ORDER BY usage_count DESC limit 5;

select * from posts;
UPDATE posts
SET caption = CASE post_id
    WHEN 1 THEN 'Loving this weather #nature'
    WHEN 2 THEN 'Delicious food time #food '
    WHEN 3 THEN 'Writing clean queries brings real clarity  #sql'
    WHEN 4 THEN 'Workout done #fitness '
    WHEN 5 THEN 'Coding all night  #developer'
    WHEN 6 THEN 'Weekend vibes #fun '
    WHEN 7 THEN 'Morning coffee ☕  #fresh'
    WHEN 8 THEN 'Sunset view #nature '
    WHEN 9 THEN 'Debugging in silence feels like meditation #sql'
    WHEN 10 THEN 'Reading books #knowledge'
    WHEN 11 THEN 'Beach day #nature'
END
WHERE post_id IN (1,2,3,4,5,6,7,8,9,10,11);






