---Checking Data---
SELECT TOP 50 * FROM roadaccidents

---Carriageway_Hazards mostly is none data---
SELECT COUNT(*) AS total_rows, SUM(CASE WHEN "Carriageway_Hazards" IS NULL THEN 1 ELSE 0 END) AS null_count, SUM(CASE WHEN "Carriageway_Hazards" = 'None' THEN 1 ELSE 0 END) AS none_count FROM roadaccidents

SELECT COALESCE(NULLIF("Carriageway_Hazards", 'None'), 'NULL') AS Hazards, COUNT(*) FROM roadaccidents
GROUP BY COALESCE(NULLIF("Carriageway_Hazards", 'None'), 'NULL')

---Drop Unnecessary Colomn---
ALTER TABLE roadaccidents DROP COLUMN Carriageway_Hazards

---Fill missing values with most frequent values---
WITH Surfacecondition AS (
    SELECT TOP 1 Road_Surface_Conditions 
    FROM roadaccidents 
    GROUP BY Road_Surface_Conditions 
    ORDER BY COUNT(*) DESC
)
UPDATE roadaccidents
SET Road_Surface_Conditions = (SELECT Road_Surface_Conditions FROM Surfacecondition) WHERE Road_Surface_Conditions IS NULL

WITH Roadtype AS (
    SELECT TOP 1 Road_Type 
    FROM roadaccidents 
    GROUP BY Road_Type 
    ORDER BY COUNT(*) DESC
)
UPDATE roadaccidents
SET Road_Type = (SELECT Road_Type FROM Roadtype) WHERE Road_Type IS NULL

UPDATE roadaccidents
SET Weather_Conditions = 
    CASE 
        WHEN Road_Surface_Conditions = 'Dry' THEN 'Fine no high winds'
        WHEN Road_Surface_Conditions = 'Wet or damp' THEN 'Raining no high winds'
        WHEN Road_Surface_Conditions = 'Frost or ice' THEN 'Snowing no high winds'
        WHEN Road_Surface_Conditions = 'Snow' THEN 'Snowing with high winds'
        WHEN Road_Surface_Conditions = 'Flood over 3cm' THEN 'Raining with high winds'
        ELSE Weather_Conditions
    END
WHERE Weather_Conditions IS NULL

UPDATE roadaccidents
SET Weather_Conditions = 'Other'
WHERE Weather_Conditions IS NULL;


---Extract Year and Month---
ALTER TABLE roadaccidents 
ADD Year_Accident INT, Month_Accident VARCHAR(20)

UPDATE roadaccidents
SET Year_Accident = YEAR(Accident_Date),
    Month_Accident = DATENAME(MONTH, Accident_Date)

SELECT YEAR(Accident_Date) AS Year, MONTH(Accident_Date) AS Month FROM roadaccidents

---Change the name of colomn---
EXEC sp_rename 'roadaccidents.Accident_Severity', 'Accident_Injuries', 'COLUMN';
EXEC sp_rename 'roadaccidents.Time', 'Hour_Of_Accident', 'COLUMN';

---Analysis---
---Month trend---
SELECT 
    Month_Accident, 
    COUNT(*) AS total_accidents,
	SUM(Number_of_Casualties) as total_casualties
FROM roadaccidents
GROUP BY Month_Accident
ORDER BY total_accidents, total_casualties DESC;

---Weather Conditions and Accidents---
WITH Weather_Categorized AS (
    SELECT 
        CASE 
            WHEN Weather_Conditions IN ('Fine + high winds', 'Fine no high winds') THEN 'Normal'
            WHEN Weather_Conditions IN ('Fog or mist', 'Snowing + high winds', 'Snowing no high winds', 'Snowing with high winds') THEN 'Snow / Fog'
            WHEN Weather_Conditions = 'Other' THEN 'Others'
            WHEN Weather_Conditions IN ('Raining + high winds, Raining no high winds') THEN 'Rain'
            ELSE 'Unknown'
        END AS weather_category
    FROM roadaccidents
)
SELECT weather_category, COUNT(*) AS total_accidents
FROM Weather_Categorized
GROUP BY weather_category
ORDER BY total_accidents DESC;

---Road Surface Conditions and Accidents---
SELECT 
    Road_Surface_Conditions, 
    COUNT(*) AS total_accidents,
	SUM(Number_of_Casualties) as total_casualties
FROM roadaccidents
GROUP BY Road_Surface_Conditions
ORDER BY total_accidents, total_casualties DESC;

---Road Types and Accidents---
SELECT Road_Type, COUNT(*) AS total_accidents
FROM roadaccidents
GROUP BY Road_Type
ORDER BY total_accidents DESC;

SELECT TOP 5 Local_Authority_District, COUNT(*) AS total_accidents
FROM roadaccidents
GROUP BY Local_Authority_District
ORDER BY total_accidents DESC;

---Speed Limits and Accident Severity---
SELECT 
    speed_limit, 
    COUNT(*) AS total_accidents
FROM roadaccidents
GROUP BY speed_limit
ORDER BY speed_limit;

-- Accidents by Hour of Accident
WITH Time_Categorized AS (
    SELECT 
        CASE 
            WHEN DATEPART(HOUR, hour_of_accident) BETWEEN 0 AND 5 THEN 'Midnight (00:00-05:59)'
            WHEN DATEPART(HOUR, hour_of_accident) BETWEEN 6 AND 11 THEN 'Morning (06:00-11:59)'
            WHEN DATEPART(HOUR, hour_of_accident) BETWEEN 12 AND 15 THEN 'Afternoon (12:00-15:59)'
            WHEN DATEPART(HOUR, hour_of_accident) BETWEEN 16 AND 23 THEN 'Evening (16:00-23:59)'
        END AS time_period
    FROM roadaccidents
)
SELECT time_period, COUNT(*) AS accident_count
FROM Time_Categorized
GROUP BY time_period
ORDER BY accident_count DESC;
