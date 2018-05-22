--- Fastest rising players -- over 3 years
--- Players whose AB/HR score has lowered the most over the past 3 years
SELECT 
	master.nameGiven AS First_Name,
	master.nameLast AS Last_Name,
	master.playerID AS playerID,
	b.ABHR2014 AS ABHR2014,
	b.ABHR2015 AS ABHR2015,
	b.ABHR2016 AS ABHR2016,
	(b.ABHR2016 - b.ABHR2014) AS Cumulative_decrease_3years
FROM(
	SELECT *
	FROM(
		SELECT
			Batting.AB AS AB2014,
			Batting.HR AS HR2014,
			Batting.HBP AS HBP2014,
			Batting.SF AS SF2014,
			Batting.H AS H2014,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2014,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2014,
			Batting.playerID
		FROM Batting 
		WHERE Batting.HR > 2
		AND Batting.yearID = 2014
		) fourteen
	INNER JOIN(
	SELECT *
	FROM (
		SELECT 
			Batting.AB AS AB2016,
			Batting.HR AS HR2016,
			Batting.HBP AS HBP2016,
			Batting.SF AS SF2016,
			Batting.H AS H2016,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2016,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2016,
			Batting.playerID
		FROM Batting 
		WHERE Batting.HR > 2
		AND Batting.yearID = 2016
		) sixteen
	INNER JOIN (
	SELECT 
			Batting.AB AS AB2015,
			Batting.HR AS HR2015,
			Batting.HBP AS HBP2015,
			Batting.SF AS SF2015,
			Batting.H AS H2015,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2015,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2015,
			Batting.playerID
	FROM Batting 
	WHERE Batting.HR > 2
	AND Batting.yearID = 2015
	) fifteen
	ON sixteen.playerID  = fifteen.playerID
	) a
	ON fourteen.playerID  = a.playerID)
	b
INNER JOIN master 
ON master.playerID = b.playerID 
ORDER BY  (b.ABHR2016 - b.ABHR2014) ASC
LIMIT 10
;

--- Players whose OBP score has increased the most over the past 3 years
SELECT 
	master.nameGiven AS First_Name,
	master.nameLast AS Last_Name,
	master.playerID AS playerID,
	b.OBP2014 AS OBP2014,
	b.OBP2015 AS OBP2015,
	b.OBP2016 AS OBP2016,
	((b.OBP2016 - b.OBP2014)) AS Cumulative_increase_3years
FROM(
	SELECT *
	FROM(
		SELECT
			Batting.AB AS AB2014,
			Batting.HR AS HR2014,
			Batting.HBP AS HBP2014,
			Batting.SF AS SF2014,
			Batting.H AS H2014,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2014,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2014,
			Batting.playerID
		FROM Batting 
		WHERE Batting.HR > 2
		AND Batting.yearID = 2014
		) fourteen
	INNER JOIN(
	SELECT *
	FROM (
		SELECT 
			Batting.AB AS AB2016,
			Batting.HR AS HR2016,
			Batting.HBP AS HBP2016,
			Batting.SF AS SF2016,
			Batting.H AS H2016,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2016,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2016,
			Batting.playerID
		FROM Batting 
		WHERE Batting.HR > 2
		AND Batting.yearID = 2016
		) sixteen
	INNER JOIN (
	SELECT 
			Batting.AB AS AB2015,
			Batting.HR AS HR2015,
			Batting.HBP AS HBP2015,
			Batting.SF AS SF2015,
			Batting.H AS H2015,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2015,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2015,
			Batting.playerID
	FROM Batting 
	WHERE Batting.HR > 2
	AND Batting.yearID = 2015
	) fifteen
	ON sixteen.playerID  = fifteen.playerID
	) a
	ON fourteen.playerID  = a.playerID)
	b
INNER JOIN master 
ON master.playerID = b.playerID 
ORDER BY  (b.OBP2016 - b.OBP2014) DESC
LIMIT 10
;

--- Fastest rising players -- over 2 years
--- Players whose AB/HR score has lowered the most over the past 2 years
SELECT 
	master.nameGiven AS First_Name,
	master.nameLast AS Last_Name,
	master.playerID AS playerID,
	b.ABHR2015 AS ABHR2015,
	b.ABHR2016 AS ABHR2016,
	(b.ABHR2016 - b.ABHR2015) AS Cumulative_decrease_2years
	FROM(
	SELECT *
	FROM (
		SELECT 
			Batting.AB AS AB2016,
			Batting.HR AS HR2016,
			Batting.HBP AS HBP2016,
			Batting.SF AS SF2016,
			Batting.H AS H2016,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2016,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2016,
			Batting.playerID
		FROM Batting 
		WHERE Batting.HR > 2
		AND Batting.yearID = 2016
		) sixteen
	INNER JOIN (
	SELECT 
			Batting.AB AS AB2015,
			Batting.HR AS HR2015,
			Batting.HBP AS HBP2015,
			Batting.SF AS SF2015,
			Batting.H AS H2015,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2015,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2015,
			Batting.playerID
	FROM Batting 
	WHERE Batting.HR > 2
	AND Batting.yearID = 2015
	) a
	ON sixteen.playerID  = a.playerID)
	b
INNER JOIN master 
ON master.playerID = b.playerID 
ORDER BY  (b.ABHR2016 - b.ABHR2015) ASC
LIMIT 10
;

--- Players whose OBP score has increased the most over the past 2 years
SELECT 
	master.nameGiven AS First_Name,
	master.nameLast AS Last_Name,
	master.playerID AS playerID,
	b.OBP2015 AS OBP2015,
	b.OBP2016 AS OBP2016,
	((b.OBP2016 - b.OBP2015)) AS Cumulative_increase_2years
	FROM(
	SELECT *
	FROM (
		SELECT 
			Batting.AB AS AB2016,
			Batting.HR AS HR2016,
			Batting.HBP AS HBP2016,
			Batting.SF AS SF2016,
			Batting.H AS H2016,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2016,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2016,
			Batting.playerID
		FROM Batting 
		WHERE Batting.HR > 2
		AND Batting.yearID = 2016
		) sixteen
	INNER JOIN (
	SELECT 
			Batting.AB AS AB2015,
			Batting.HR AS HR2015,
			Batting.HBP AS HBP2015,
			Batting.SF AS SF2015,
			Batting.H AS H2015,
			(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR2015,
			((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP2015,
			Batting.playerID
	FROM Batting 
	WHERE Batting.HR > 2
	AND Batting.yearID = 2015
	) a
	ON sixteen.playerID  = a.playerID)
	b
INNER JOIN master 
ON master.playerID = b.playerID 
ORDER BY  (b.OBP2016 - b.OBP2015) DESC
LIMIT 10
;

--- Teams in order of how much they win in comparison to how much they cost
SELECT 
	Teams.teamID AS teamID,
	Teams.name AS Name,
	Salaries.Total_Salaries AS Total_Salaries,
	Salaries.Average_Salary AS Average_Salary,
	Salaries.Number_Players AS Number_Players,
	(CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT)) AS winPERloss_ratio,
	(CAST(Salaries.Total_Salaries AS FLOAT) / (CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT))) AS SalPERwinPERlossratio
FROM (
	SELECT 
		Salaries.teamID AS teamID, 
		COUNT(Salaries.playerID) AS Number_Players,  
		AVG(Salaries.salary) AS Average_Salary, 
		SUM(Salaries.salary) AS Total_Salaries
FROM Salaries
WHERE Salaries.yearID = 2016
GROUP BY Salaries.teamID
ORDER BY  SUM(Salaries.salary) DESC
) Salaries
INNER JOIN Teams
ON Teams.teamID = Salaries.teamID
WHERE Teams.yearID = 2016
ORDER BY (CAST(Salaries.Total_Salaries AS FLOAT) / (CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT))) 
LIMIT 10
;


--- Players in order of how good their stats are in comparison to how much they cost
-- With OBP stat
SELECT 
	master.nameGiven AS First_Name,
	master.nameLast AS Last_Name,
	master.playerID AS playerID,
	a.Salary AS Salary,
	a.OBP AS OBP,
	a.OBP_Salary_ratio AS OBP_Salary_ratio
FROM(
SELECT 
	Batting.playerID AS playerID,
	Batting.ABHR AS ABHR,
	Batting.OBP AS OBP,
	Salaries.salary AS Salary,
	(CAST(Batting.OBP AS FLOAT) / CAST(Salaries.salary AS FLOAT)) AS OBP_Salary_ratio
FROM(
	SELECT 
		Batting.AB AS AB,
		Batting.HR AS HR,
		Batting.HBP AS HBP,
		Batting.SF AS SF,
		Batting.H AS H,
		(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR,
		((CAST(Batting.H AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT)) * 100 / (CAST(Batting.AB AS FLOAT) + CAST(Batting.BB AS FLOAT) + CAST(Batting.HBP AS FLOAT) + CAST(Batting.SF AS FLOAT))) AS OBP,
		Batting.playerID
	FROM Batting 
	WHERE Batting.HR > 2
	AND Batting.yearID = 2016
	) Batting
INNER JOIN Salaries
ON Salaries.playerID = Batting.playerID
WHERE Salaries.yearID = 2016
) a
INNER JOIN Master
ON a.playerID = Master.playerID
ORDER BY OBP_Salary_ratio DESC
LIMIT 10
;

--- Players in order of how good their stats are in comparison to how much they cost
-- With AB/HR stat
SELECT 
	master.nameGiven AS First_Name,
	master.nameLast AS Last_Name,
	master.playerID AS playerID,
	a.Salary AS Salary,
	a.ABHR AS ABHR,
	a.HRAB_Salary_ratio AS HRAB_Salary_ratio
FROM(
SELECT 
	Batting.playerID AS playerID,
	Batting.ABHR AS ABHR,
	Batting.HRAB AS HRAB,
	Salaries.salary AS Salary,
	(CAST(Batting.HRAB AS FLOAT) / CAST(Salaries.salary AS FLOAT)) AS HRAB_Salary_ratio
FROM(
	SELECT 
		Batting.AB AS AB,
		Batting.HR AS HR,
		(CAST(Batting.AB AS FLOAT) / CAST(Batting.HR AS FLOAT)) AS ABHR,
		(CAST(Batting.HR AS FLOAT) / CAST(Batting.AB AS FLOAT)) AS HRAB,
		Batting.playerID
	FROM Batting 
	WHERE Batting.HR > 2
	AND Batting.yearID = 2016
	) Batting
INNER JOIN Salaries
ON Salaries.playerID = Batting.playerID
WHERE Salaries.yearID = 2016
) a
INNER JOIN Master
ON a.playerID = Master.playerID
ORDER BY HRAB_Salary_ratio DESC
LIMIT 10
;

--- Fastest growing Teams
--- 2 years period
SELECT 
			c.teamID AS teamID,
			c.name AS Name,
			c.W2016 AS W2016,
			c.L2016 AS L2016,
			c.winPERloss_ratio2016 AS winPERloss_ratio2016,
			c.W2015 AS W2015,
			c.L2015 AS L2015,
			c.winPERloss_ratio2015 AS winPERloss_ratio2015,
			(CAST(c.winPERloss_ratio2016 AS FLOAT) - CAST(c.winPERloss_ratio2015 AS FLOAT)) AS Increase_ratio_2years
FROM(
	SELECT 
			a.teamID AS teamID,
			a.name AS Name,
			a.W2016 AS W2016,
			a.L2016 AS L2016,
			a.winPERloss_ratio2016 AS winPERloss_ratio2016,
			b.W2015 AS W2015,
			b.L2015 AS L2015,
			b.winPERloss_ratio2015 AS winPERloss_ratio2015
	FROM(
		SELECT 
			Teams.teamID AS teamID,
			Teams.name AS Name,
			Teams.W AS W2016,
			Teams.L AS L2016,
			(CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT)) AS winPERloss_ratio2016
		FROM Teams 
		WHERE yearID = 2016
		) a
	INNER JOIN (
		SELECT
			Teams.teamID AS teamID,
			Teams.name AS Name,
			Teams.W AS W2015,
			Teams.L AS L2015,
			(CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT)) AS winPERloss_ratio2015
		FROM Teams 
		WHERE yearID = 2015
		) b
	ON a.TeamID = b.TeamID
	) c
INNER JOIN(
	SELECT 
		Teams.teamID AS teamID,
		Teams.name AS Name,
		Teams.W AS W2014,
		Teams.L AS L2014,
		(CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT)) AS winPERloss_ratio2014
		FROM Teams 
		WHERE yearID = 2014
		) d
ON c.teamID = d.teamID
ORDER BY (CAST(c.winPERloss_ratio2016 AS FLOAT) - CAST(c.winPERloss_ratio2015 AS FLOAT)) DESC
LIMIT 10
; 

--- Fastest growing Teams
--- 3 years period
SELECT 
			c.teamID AS teamID,
			c.name AS Name,
			c.W2016 AS W2016,
			c.L2016 AS L2016,
			c.winPERloss_ratio2016 AS winPERloss_ratio2016,
			d.W2014 AS W2014,
			d.L2014 AS L2014,
			d.winPERloss_ratio2014 AS winPERloss_ratio2014,
			(CAST(c.winPERloss_ratio2016 AS FLOAT) - CAST(d.winPERloss_ratio2014 AS FLOAT)) AS Increase_ratio_3years
FROM(
	SELECT 
			a.teamID AS teamID,
			a.name AS Name,
			a.W2016 AS W2016,
			a.L2016 AS L2016,
			a.winPERloss_ratio2016 AS winPERloss_ratio2016,
			b.W2015 AS W2015,
			b.L2015 AS L2015,
			b.winPERloss_ratio2015 AS winPERloss_ratio2015
	FROM(
		SELECT 
			Teams.teamID AS teamID,
			Teams.name AS Name,
			Teams.W AS W2016,
			Teams.L AS L2016,
			(CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT)) AS winPERloss_ratio2016
		FROM Teams 
		WHERE yearID = 2016
		) a
	INNER JOIN (
		SELECT
			Teams.teamID AS teamID,
			Teams.name AS Name,
			Teams.W AS W2015,
			Teams.L AS L2015,
			(CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT)) AS winPERloss_ratio2015
		FROM Teams 
		WHERE yearID = 2015
		) b
	ON a.TeamID = b.TeamID
	) c
INNER JOIN(
	SELECT 
		Teams.teamID AS teamID,
		Teams.name AS Name,
		Teams.W AS W2014,
		Teams.L AS L2014,
		(CAST(Teams.W AS FLOAT) / CAST(Teams.L AS FLOAT)) AS winPERloss_ratio2014
		FROM Teams 
		WHERE yearID = 2014
		) d
ON c.teamID = d.teamID
ORDER BY (CAST(c.winPERloss_ratio2016 AS FLOAT) - CAST(d.winPERloss_ratio2014 AS FLOAT)) DESC
LIMIT 10
; 

--- Fastest growing managers 
-- 3 years increase
SELECT 
		master.nameGiven AS First_Name,
		master.nameLast AS Last_Name,
		master.playerID AS playerID,
		e.teamID2016 AS teamID2016,
		e.teamID2014 AS teamID2014,
		e.W2016 AS W2016,
		e.L2016 AS L2016,
		e.winPERloss_ratio2016 AS winPERloss_ratio2016,
		e.W2014 AS W2014,
		e.L2014 AS L2014,
		e.winPERloss_ratio2014 AS winPERloss_ratio2014,
		(CAST(e.winPERloss_ratio2016 AS FLOAT) - CAST(e.winPERloss_ratio2014 AS FLOAT)) AS Increase_ratio_3years
FROM(
SELECT 
		c.playerID AS playerID,
		c.teamID2016 AS teamID2016,
		d.teamID2014 AS teamID2014,
		c.W2016 AS W2016,
		c.L2016 AS L2016,
		c.winPERloss_ratio2016 AS winPERloss_ratio2016,
		d.W2014 AS W2014,
		d.L2014 AS L2014,
		d.winPERloss_ratio2014 AS winPERloss_ratio2014
FROM(
	SELECT 
		managers.playerID AS playerID,
		managers.teamID AS teamID2016,
		managers.W AS W2016,
		managers.L AS L2016,
		(CAST(managers.W AS FLOAT) / CAST(managers.L AS FLOAT)) AS winPERloss_ratio2016
	FROM managers 
	WHERE yearID = 2016
	) c
INNER JOIN(
		SELECT
			managers.playerID AS playerID,
			managers.teamID AS teamID2014,
			managers.W AS W2014,
			managers.L AS L2014,
			(CAST(managers.W AS FLOAT) / CAST(managers.L AS FLOAT)) AS winPERloss_ratio2014
		FROM managers 
		WHERE yearID = 2014
		) d
ON c.playerID = d.playerID
) e
INNER JOIN Master
ON e.playerID = Master.playerID
ORDER BY (CAST(e.winPERloss_ratio2016 AS FLOAT) - CAST(e.winPERloss_ratio2014 AS FLOAT)) DESC
LIMIT 10
;

--- Fastest growing managers
-- 2 years
SELECT 
		master.nameGiven AS First_Name,
		master.nameLast AS Last_Name,
		master.playerID AS playerID,
		e.teamID2016 AS teamID2016,
		e.teamID2015 AS teamID2015,
		e.W2016 AS W2016,
		e.L2016 AS L2016,
		e.winPERloss_ratio2016 AS winPERloss_ratio2016,
		e.W2015 AS W2015,
		e.L2015 AS L2015,
		e.winPERloss_ratio2015 AS winPERloss_ratio2015,
		(CAST(e.winPERloss_ratio2016 AS FLOAT) - CAST(e.winPERloss_ratio2015 AS FLOAT)) AS Increase_ratio_2years
FROM(
	SELECT 
			b.playerID AS playerID,
			a.teamID2016 AS teamID2016,
			b.teamID2015 AS teamID2015,
			a.W2016 AS W2016,
			a.L2016 AS L2016,
			a.winPERloss_ratio2016 AS winPERloss_ratio2016,
			b.W2015 AS W2015,
			b.L2015 AS L2015,
			b.winPERloss_ratio2015 AS winPERloss_ratio2015
	FROM(
	SELECT 
		managers.playerID AS playerID,
		managers.teamID AS teamID2016,
		managers.W AS W2016,
		managers.L AS L2016,
		(CAST(managers.W AS FLOAT) / CAST(managers.L AS FLOAT)) AS winPERloss_ratio2016
	FROM managers 
	WHERE yearID = 2016
	) a
	INNER JOIN(
		SELECT
			managers.playerID AS playerID,
			managers.teamID AS teamID2015,
			managers.W AS W2015,
			managers.L AS L2015,
			(CAST(managers.W AS FLOAT) / CAST(managers.L AS FLOAT)) AS winPERloss_ratio2015
		FROM managers 
		WHERE yearID = 2015
		)b
	ON b.playerID = a.playerID
) e
INNER JOIN Master
ON e.playerID = Master.playerID
ORDER BY (CAST(e.winPERloss_ratio2016 AS FLOAT) - CAST(e.winPERloss_ratio2015 AS FLOAT)) DESC
LIMIT 10
;

