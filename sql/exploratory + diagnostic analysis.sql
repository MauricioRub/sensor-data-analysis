
--==================================================
-- ANOMALY DETECTION IN ENERGY CONSUMPTION
--==================================================

--Objective:
-- Detect abnormal consumption patterns in sensor data

----------------------------------------------------

--NULL Exploration
----------------------------------------------------

SELECT 
	COUNT(*) AS total_rows,
	COUNT(consumo_kwh) AS non_null_consumption
FROM sensores_dataset;

----------------------------------------------------

SELECT * 
FROM sensores_dataset
WHERE consumo_kwh is NULL; 

----------------------------------------------------

SELECT 
	COUNT(*) AS total,
	COUNT(sensor_id) AS sensor_id_not_null,
	COUNT(timestamp) AS timestamp_not_null,
	COUNT(zona) AS zona_not_null,
	COUNT(edificio) AS edificio_not_null,
	COUNT(temperatura) AS temperatura_not_null,
	COUNT(presion) AS presion_not_null,
	COUNT(flujo) AS flujo_not_null
FROM sensores_dataset;

----------------------------------------------------

--Counting identified nulls
----------------------------------------------------

SELECT 
	COUNT(*) AS total_rows,
	COUNT(*) - COUNT (temperatura) AS temperatura_nulls,
	COUNT(*) - COUNT (presion) AS presion_nulls
FROM sensores_dataset;

----------------------------------------------------

--Duplicates
----------------------------------------------------

SELECT 
	sensor_id,
	timestamp,
	COUNT(*) AS duplicates
FROM sensores_dataset
GROUP BY sensor_id, timestamp
HAVING COUNT(*) >1;

----------------------------------------------------

--Distribution
----------------------------------------------------

SELECT
	MIN(consumo_kwh),
	MAX(consumo_kwh),
	AVG(consumo_kwh)
FROM sensores_dataset;

----------------------------------------------------

-- Invalid values
----------------------------------------------------

SELECT * 
FROM sensores_dataset
WHERE consumo_kwh < 0;

SELECT	
	MIN(consumo_kwh) AS min_value,
	MAX(consumo_kwh) AS max_value,
	AVG(consumo_kwh) AS avg_value
FROM sensores_dataset; 

----------------------------------------------------

-- top 10 higher spikes
----------------------------------------------------

SELECT *
FROM sensores_dataset
ORDER BY consumo_kwh DESC 
LIMIT 10;

----------------------------------------------------

--spikes with context
----------------------------------------------------

SELECT 
	timestamp,
	sensor_id,
	consumo_kwh,
	temperatura,
	presion
FROM sensores_dataset
ORDER BY consumo_kwh DESC
LIMIT 10;

----------------------------------------------------

SELECT 
	timestamp,
	sensor_id,
	zona,
	consumo_kwh,
	temperatura,
	presion,
	flujo,
	AVG(consumo_kwh) OVER () AS avg_consumo_kwh,
	AVG(temperatura) OVER () AS avg_temperatura,
	AVG(presion) OVER () AS avg_presion,
	AVG(flujo) OVER () AS avg_flujo
FROM sensores_dataset
ORDER BY consumo_kwh DESC
LIMIT 10;
----------------------------------------------------

-- Clean dataset (filtered analysis)
----------------------------------------------------
SELECT *
FROM sensores_dataset
WHERE consumo_kwh BETWEEN 0 AND 50;
----------------------------------------------------

-- Anomaly classification
----------------------------------------------------
SELECT
	timestamp,
	sensor_id,
	zona,
	consumo_kwh,
	AVG(consumo_kwh) OVER (PARTITION BY sensor_id) AS avg_consumo_sensor_kwh,
	CASE		
		WHEN consumo_kwh > AVG(consumo_kwh) OVER (PARTITION BY sensor_id) * 3 THEN 'Anomaly' ELSE 'Normal'
	END AS classification
FROM sensores_dataset
ORDER BY consumo_kwh DESC;
	
----------------------------------------------------

-- Observations
----------------------------------------------------

-- High consumption spikes (5x-6x above average) were detected.

-- Temperature does not show abnormal deviations and is unlikely to be the primary driver for these spikes.

-- Pressure and flow do not show consistent correlation, which contradicts expected behavior.

-- A significant portion of high consumption events occurs in Zona_B, suggesting potential localized sensor issues or data inconsistencies.

----------------------------------------------------

-- Conclusion:
----------------------------------------------------

-- Anomalies detected are more likely caused due to sensor errors or data quality issues rather than actual increases in energy consumption.
----------------------------------------------------

--Notes:
----------------------------------------------------

-- Data cleaning was applied after initial exploration.
-- Results may vary when using filtered dataset.
