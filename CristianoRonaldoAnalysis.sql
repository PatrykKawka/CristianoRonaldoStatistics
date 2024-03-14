select * from CristianoRonaldoPreperedStatistics

--Create VIEW GoalsPerClub AS
SELECT Club, COUNT(*) as GoalsScored
FROM CristianoRonaldoPreperedStatistics
GROUP BY Club

--Create VIEW GoalsPerCompetitionInEachClub AS 
SELECT Competition, Club, COUNT(*) as GoalsScoredPerCompetition
FROM CristianoRonaldoPreperedStatistics
GROUP BY Club, Competition

-- Create VIEW MostGoalsVsOpponents AS
SELECT Opponent, COUNT(*) as Goals
FROM CristianoRonaldoPreperedStatistics
GROUP BY Opponent

-- Create VIEW TOP 3 Opponents AS
SELECT TOP 3 WITH TIES Opponent, COUNT(*) as Goals
FROM CristianoRonaldoPreperedStatistics
GROUP BY Opponent
ORDER BY COUNT(*) DESC