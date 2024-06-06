SELECT DISTINCT Tweets.*
FROM Tweets
WHERE TweetID IN (
    SELECT Likes.TweetID
    FROM Likes
    WHERE Likes.LikeByUserName IN (
        SELECT Following.FollowerUserName
        FROM Following
        WHERE Following.FollowedUserName = 'ImranKhan'
    )
);


SELECT DISTINCT Users.UserName
FROM Users
WHERE UserName IN (
    SELECT UserName
    FROM UserInterests
    WHERE InterestID IN (
        SELECT InterestID
        FROM Interests
        WHERE Description = 'Politics'
    )
);

SELECT DISTINCT Likes.LikeByUserName
FROM Likes
WHERE Likes.TweetID IN (
    SELECT Tweets.TweetID
    FROM Tweets
    WHERE Tweets.UserName = 'DonaldTrump'
);


SELECT DISTINCT Tweets.*
FROM Tweets
WHERE TweetID IN (
    SELECT Likes.TweetID
    FROM Likes
    WHERE Likes.LikeByUserName IN (
        SELECT UserInterests.UserName
        FROM UserInterests
        WHERE UserInterests.InterestID IN (
            SELECT InterestID
            FROM Interests
            WHERE Description = 'Politics'
        )
        INTERSECT
        SELECT UserInterests.UserName
        FROM UserInterests
        WHERE UserInterests.InterestID IN (
            SELECT InterestID
            FROM Interests
            WHERE Description = 'Sports'
        )
    )
);


SELECT UserName
FROM Users
WHERE UserName NOT IN (
    SELECT DISTINCT FollowerUserName
    FROM Following
);

SELECT DISTINCT LikeByUserName
FROM Likes
WHERE TweetID IN (
    SELECT TweetID
    FROM Tweets
    WHERE [Text] LIKE '%#MasseCritique%'
);


SELECT DISTINCT Tweets.*
FROM Tweets
WHERE TweetID IN (
    SELECT Likes.TweetID
    FROM Likes
    WHERE LikeByUserName IN (
        SELECT UserName
        FROM Users
        WHERE Country = 'USA'
    )
);

SELECT DISTINCT UserName
FROM UserInterests
WHERE InterestID IN (
    SELECT InterestID
    FROM Interests
    WHERE Description = 'Movies'
)
AND UserName IN (
    SELECT UserName
    FROM UserInterests
    WHERE InterestID IN (
        SELECT InterestID
        FROM Interests
        WHERE Description = 'Sports'
    )
);


SELECT DISTINCT Tweets.*
FROM Tweets
WHERE TweetID IN (
    SELECT Likes.TweetID
    FROM Likes
    WHERE LikeByUserName IN (
        SELECT FollowedUserName
        FROM Following
        WHERE FollowerUserName = 'Ali123'
    )
);

SELECT UserName
FROM Users
WHERE UserName NOT IN (
    SELECT DISTINCT LikeByUserName
    FROM Likes
);


SELECT DISTINCT Tweets.*
FROM Tweets
WHERE TweetID IN (
    SELECT Likes.TweetID
    FROM Likes
    WHERE LikeByUserName IN (
        SELECT UserName
        FROM UserInterests
        WHERE InterestID IN (
            SELECT InterestID
            FROM Interests
            WHERE Description = 'Education'
        )
    )
);