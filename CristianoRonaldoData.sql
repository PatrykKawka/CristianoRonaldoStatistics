-- CREATE TABLE AND PREPERE DATA FROM .CSV FILE
SELECT Season, Competition, Matchday, CAST(Date as date) as Date, Club, Opponent, CONCAT(
SUBSTRING(Result, 1,CHARINDEX(':', Result)-1),
':',
CASE WHEN
	LEN(
		SUBSTRING(
				Result, 
				CHARINDEX(':', Result),
				CHARINDEX(':', Result)+1
				)) = 2 
	THEN 
		RIGHT(
			SUBSTRING(
				Result, 
				CHARINDEX(':', Result),
				CHARINDEX(':', Result)+1),1)
	ELSE 
		RIGHT(
			SUBSTRING(
				Result, 
				CHARINDEX(':', Result),
				CHARINDEX(':', Result)+1
				),1)
END) as Result,
COALESCE(Playing_Position, 'NoData') as Position,[Minute], COALESCE([Type], 'NoData') as TypeOfGoal, COALESCE(Goal_assist, 'NoAssists') as GoalAssistant, CONCAT(
SUBSTRING(ShotAt, 1,CHARINDEX(':', ShotAt)-1),
':',
CASE WHEN
	LEN(
		SUBSTRING(
				ShotAt, 
				CHARINDEX(':', ShotAt),
				CHARINDEX(':', ShotAt)+1
				)) = 2 
	THEN 
		RIGHT(
			SUBSTRING(
				ShotAt, 
				CHARINDEX(':', ShotAt),
				CHARINDEX(':', ShotAt)+1),1)
	ELSE 
		RIGHT(
			SUBSTRING(
				ShotAt, 
				CHARINDEX(':', ShotAt),
				CHARINDEX(':', ShotAt)+1
				),1)
END) as ShotAt
INTO CristianoRonaldoPreperedStatistics
FROM CristianoRonaldoStatistics
