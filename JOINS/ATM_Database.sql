--use master
--go
--drop  database ATM
--go
--Create database ATM
--go
--use ATM
--go

--create table [User](
--[userId] int primary key,
--[name] varchar(20) not null,
--[phoneNum] varchar(15) not null,
--[city] varchar(20) not null
--)
--go

--create table CardType(
--[cardTypeID] int primary key,
--[name] varchar(15),
--[description] varchar(40) null
--)
--go
--create Table [Card](
--cardNum Varchar(20) primary key,
--cardTypeID int foreign key references  CardType([cardTypeID]),
--PIN varchar(4) not null,
--[expireDate] date not null,
--balance float not null
--)
--go


--Create table UserCard(
--userID int foreign key references [User]([userId]),
--cardNum varchar(20) foreign key references [Card](cardNum),
--primary key(cardNum)
--)
--go
--create table [Transaction](
--transId int primary key,
--transDate date not null,
--cardNum varchar(20) foreign key references [Card](cardNum),
--amount int not null
--)


--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (1, N'Ali', N'03036067000', N'Narowal')
--GO
--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (2, N'Ahmed', N'03036047000', N'Lahore')
--GO
--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (3, N'Aqeel', N'03036063000', N'Karachi')
--GO
--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (4, N'Usman', N'03036062000', N'Sialkot')
--GO
--INSERT [dbo].[User] ([userId], [name], [phoneNum], [city]) VALUES (5, N'Hafeez', N'03036061000', N'Lahore')
--GO


--INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now')
--GO
--INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later')
--GO

--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1234', 1, N'1770', CAST(N'2022-07-01' AS Date), 43025.31)
--GO
--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1235', 1, N'9234', CAST(N'2020-03-02' AS Date), 14425.62)
--GO
--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1236', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52)
--GO
--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1237', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3)
--GO
--INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1238', 2, N'9004', CAST(N'2020-09-02' AS Date), 34025.12)
--GO

--INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1234')
--GO
--INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1235')
--GO
--INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'1236')
--GO
--INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (3, N'1238')
--GO
--Insert  [dbo].[UserCard] ([userID], [cardNum]) VALUES (4, N'1237')

--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (1, CAST(N'2017-02-02' AS Date), N'1234', 500)
--GO
--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (2, CAST(N'2018-02-03' AS Date), N'1235', 3000)
--GO
--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (3, CAST(N'2020-01-06' AS Date), N'1236', 2500)
--GO
--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (4, CAST(N'2016-09-09' AS Date), N'1238', 2000)
--GO
--INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount]) VALUES (5, CAST(N'2020-02-10' AS Date), N'1234', 6000)
--GO


Select * from [User]
Select * from UserCard
Select * from [Card]
Select * from CardType
Select * from [Transaction]

----task 1
--select cardTypeID,count(distinct userId) from UserCard join Card on UserCard.cardNum = Card.cardNum group by cardTypeID;



--task 2

--select name,UserCard.cardNum
--from UserCard
--join [User] on UserCard.userID=[User].userId
--join [Card] on UserCard.cardNum=[Card].cardNum
--where balance >=20000 and balance<=40000


--task 3 a

--select userId from [User] except select userId from UserCard

--task 3 b
--select name from [User] left join UserCard on [User].userId=[UserCard].userID where cardNum is NULL;


--task 4 a

--Select cardNum, [CardType].name,[User].name
--from UserCard except
--sele

--task 4 b
--select [UserCard].cardNum,CardType.name,[User].name from UserCard
--Join [User] on UserCard.userID=[User].userId
--Join [Card] on UserCard.cardNum = [Card].cardNum
--Join CardType on [Card].cardTypeID = CardType.cardTypeID
--join [Transaction] on UserCard.cardNum = [Transaction].cardNum
--where transDate<getdate()


--5
--SELECT CardType.name AS CardTypeName, COUNT(*) AS TotalCards
--FROM [Card]
--JOIN [CardType] ON [Card].cardTypeID = [CardType].cardTypeID
--JOIN [UserCard] ON [Card].cardNum = [UserCard].cardNum
--JOIN [Transaction] ON [Card].cardNum = [Transaction].cardNum
--WHERE YEAR([Transaction].transDate) BETWEEN 2015 AND 2017
--GROUP BY CardType.name
--HAVING SUM([Transaction].amount) > 6000;


--6
--Select [User].userId, [User].name, phoneNum, city, [Card].cardNum, CardType.name as CardTypeName
--From [User]
--Join UserCard on [User].userId = UserCard.userID
--Join [Card] on UserCard.cardNum = [Card].cardNum
--Join CardType on CardType.cardTypeID = [Card].cardTypeID
--Where [Card].expireDate between GETDATE() and DATEADD(month, 3, GETDATE())

--7 
SELECT [User].[userId], [User].[name]
FROM [User]
JOIN (
    SELECT [UserCard].[userID], SUM([Card].[balance]) AS total_balance
    FROM [UserCard]
    JOIN [Card] ON [UserCard].[cardNum] = [Card].[cardNum]
    GROUP BY [UserCard].[userID]
) AS user_balance ON [User].[userId] = user_balance.[userID]
WHERE user_balance.total_balance >= 5000;


--8
--SELECT c1.cardNum AS Card1, c2.cardNum AS Card2 FROM [Card] c1
--JOIN [Card] c2 ON c1.cardNum < c2.cardNum
--WHERE YEAR(c1.expireDate) = YEAR(c2.expireDate)

--9
--SELECT u1.userId AS UserId1, u1.name AS Name1, u2.userId AS UserId2, u2.name AS Name2 FROM [User] u1
--JOIN [User] u2 ON u1.userId < u2.userId
-- -- Ensures that each pair is considered only once
-- WHERE LEFT(u1.name, 1) = LEFT(u2.name, 1) -- First characters are the same

--10
SELECT u.userId, u.name
FROM [User] u
WHERE EXISTS (
    SELECT 1
    FROM [UserCard] uc1
    JOIN [Card] c1 ON uc1.cardNum = c1.cardNum
    JOIN [CardType] ct1 ON c1.cardTypeID = ct1.cardTypeID
    WHERE uc1.userId = u.userId AND ct1.name = 'Credit'
)
AND EXISTS (
    SELECT 1
    FROM [UserCard] uc2
    JOIN [Card] c2 ON uc2.cardNum = c2.cardNum
    JOIN [CardType] ct2 ON c2.cardTypeID = ct2.cardTypeID
    WHERE uc2.userId = u.userId AND ct2.name = 'Debit'
);

--11
SELECT
    u.city AS CityName,
    COUNT(u.userId) AS NumberOfUsers,
    SUM(t.amount) AS TotalAmount
FROM
    [User] u
JOIN
    [UserCard] uc ON u.userId = uc.userId
JOIN
    [Card] c ON uc.cardNum = c.cardNum
JOIN
    [Transaction] t ON c.cardNum = t.cardNum
GROUP BY
    u.city;