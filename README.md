![image](https://github.com/user-attachments/assets/c2835305-e2c1-45eb-b6c5-c3e0b25ce385)

# A Dashboard Analysis with SQL & Tableau
# Background
- Road accidents remain a significant public safety concern, leading to injuries, fatalities, and economic losses. Understanding the patterns and causes of these accidents is crucial for improving road safety measures and reducing accident rates. This project aims to analyze road accident data using SQL for data exploration & manipulation, and Tableau for visualization. By exploring factors such as accident frequency, weather conditions, road surfaces, vehicle types, and speed limits, this analysis provides valuable insights into accident trends. The goal is to help policymakers, urban planners, and transportation authorities make data-driven decisions to enhance road safety and minimize risks for drivers and pedestrians.

---

### Exploratory Data Analysis
## 1. What happened?
![image](https://github.com/user-attachments/assets/39e6245f-7f33-41d7-b006-f457630a459f)
- The data shows that there are over 300k total accidents in the United Kingdom, affecting more than 400k victims. This raises concerns about whether the accidents occur due to road conditions, weather conditions, road type, or other factors.

## 2. Is there a particular month when accidents occur most often?
![image](https://github.com/user-attachments/assets/b46742c3-6110-4b81-b407-4766186e8eae)
![image](https://github.com/user-attachments/assets/9efb6a89-5d92-45eb-b666-525163270c10)
- November is the month with the most accidents and the most victims. The number of accidents is correlated with the number of victims where the more accidents the more victims there will be.

## 3. Is there a relationship between weather conditions and accidents that occur?
![image](https://github.com/user-attachments/assets/1a7d7126-a771-49b7-9f1d-14f54c47d3c8)
![image](https://github.com/user-attachments/assets/b3ba859d-20ad-4553-bd41-fdc2da9da78a)
- Despite seasonal variations, accidents predominantly occur under normal weather conditions. This suggests that weather is not a primary factor influencing accident frequency.

## 4. How about the road surface conditions?
![image](https://github.com/user-attachments/assets/4e270034-a953-4338-82ae-2db1a2a1a38c)
![image](https://github.com/user-attachments/assets/6654ad4b-a342-455c-86fd-f5577e82428d)
- Most accidents still occur on normal (dry) road conditions, reinforcing the idea that road surface conditions may not be the primary cause of accidents.

## 5. Can speed limits affect the number of accidents?
![image](https://github.com/user-attachments/assets/c9e05e18-c595-4c79-9199-9b0f811d82c3)
![image](https://github.com/user-attachments/assets/75e97d5e-12c1-4506-b9e3-7cbc36154025)
- The speed limit of 30 is the speed limit with the highest total accidents. Even the level of injuries is higher when the speed limit is 30. This could indicate that urban areas with pedestrian activity are more prone to accidents.

## 6. Are there certain times when accidents occur?
![image](https://github.com/user-attachments/assets/7ba60395-11c0-437e-bf5c-252f1477dc82)
![image](https://github.com/user-attachments/assets/4d080bc3-0bc4-4e6c-a886-4e80165668ac)
- I divide the accident hours into time periods, namely midnight 00.00-05.59, morning 06.00-11.59, afternoon 12.00-15.59 and evening 16.00-23.59. Evening (16:00 - 23:59) has the highest accident count. This could be due to drivers feeling tired after work or increased traffic congestion during rush hours.

## 7. Will new regulations on road types start to apply?
![image](https://github.com/user-attachments/assets/dde26420-e94a-43d5-8883-5b964633f773)
![image](https://github.com/user-attachments/assets/cf99bd34-87c3-43d4-bb25-3691ec433207)
- The "single carriageway" type of road is the type of road with the highest total accidents. This could be due to higher traffic density and fewer lane divisions leading to increased collision risks.

## 8. Which city has the most total accidents?
![image](https://github.com/user-attachments/assets/24494379-6b45-4985-9439-e298ff1d2df7)
![image](https://github.com/user-attachments/assets/11b6f548-eb73-4975-938a-c5805f089c48)
- Birmingham city becomes the city with the highest total accidents.

---

# Conclusion
- Most accidents occur in normal weather and dry road conditions, suggesting that driver behavior is a crucial factor.
- November sees the highest number of accidents, indicating potential seasonal trends that need further investigation.
- Speed limits impact accident rates, with the 30 mph speed limit showing the highest accident occurrences and injury levels.
- Evening hours (16:00 - 23:59) have the highest accident rates, likely due to driver fatigue and increased congestion.
- Single carriageways contribute the most to accidents, highlighting the need for better infrastructure planning.
- Birmingham records the highest number of accidents, making it a priority area for road safety interventions.

---

# Tools Used  
- SQL: Data exploration & manipulation  
- Tableau: Data visualization & dashboard creation 
