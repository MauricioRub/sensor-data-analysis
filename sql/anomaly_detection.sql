--Dataset: sensores_dataset
--Scope: exploratory + operational analysis

--=======================================================
--Anomaly detection in energy consumption
--=======================================================

-- Objective:
--Detect abrupt changes in energy consumption between consecutive measurements.

--------------------------------------------------------
--Total energy consumption by zone
--------------------------------------------------------

SELECT 
	zona,
	SUM(consumo_kwh) AS total_consumption 
FROM sensores_dataset 
GROUP BY zona
ORDER BY total_consumption DESC; 

--------------------------------------------------------
--Top consumption spikes
--------------------------------------------------------

SELECT 
	timestamp, sensor_id, edificio, zona,consumo_kwh
FROM sensores_dataset
ORDER BY consumo_kwh DESC
LIMIT 10;

--------------------------------------------------------
--Top 3 spikes by sensor
--------------------------------------------------------

SELECT 
	sensor_id,
	ranking,
	timestamp,
	consumo_kwh 
FROM (
	SELECT
		sensor_id, timestamp, consumo_kwh,
		ROW_NUMBER() OVER (PARTITION BY sensor_id ORDER BY consumo_kwh DESC
		) AS rank
	FROM sensores_dataset
) top_consumption
WHERE ranking <=3
ORDER BY sensor_id ASC, rank ASC;

--------------------------------------------------------
--Unusual patterns, detect jumps greater than 50 units
--------------------------------------------------------

SELECT 
	timestamp,
	sensor_id,
	zona,
	consumo_kwh,
	previous_consumption,
	consumo_kwh - previous_consumption AS consumption_change
FROM (
	SELECT		
		sensor_id,
		timestamp,
		zona,
		consumo_kwh,
		LAG(consumo_kwh) OVER (PARTITION BY sensor_id ORDER BY timestamp) AS previous_consumption
	FROM sensores_dataset
) unusual_spikes
WHERE  previous_consumption IS NOT NULL AND ABS(consumo_kwh - previous_consumption) > 50
ORDER BY ABS(consumo_kwh - previous_consumption) DESC;

--------------------------------------------------------
--BONUS: dynamic anomaly detection
--------------------------------------------------------

SELECT	*
FROM (
	SELECT 
		timestamp,
		sensor_id,
		zona,
		consumo_kwh,
		AVG(consumo_kwh) OVER (PARTITION BY sensor_id) AS sensor_average
	FROM sensores_dataset
) dynamic_anomaly
WHERE consumo_kwh > sensor_average * 1.5
ORDER BY consumo_kwh DESC;
