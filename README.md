# Sensor-data-analysis
End-to-end data analysis project using sensor data to identify anomalies, evaluate data quality, and assess potential operational and financial impact.

## SQL analysis

This project includes SQL-based analysis to:
- Identify energy consumption by zone
- Detect peak consumption events
- Analyze anomalies using window functions (LAG, ROW_NUMBER)
- Explore dynamic anomaly detection using averages

 ### SQL Exploratory + diagnostic analysis

 **Scope:** Exploratory + Diagnostic analysis

### Objectives
- Identify abnormal consumption patterns
- Detect potential anomalies in sensor data
- Evaluate data quality issues

### Key Steps
- Null value analysis
- Duplicate detection
- Distribution and range validation
- Identification of extreme consumption spikes
- Contextual analysis using temperature, pressure, and flow
- Data cleaning (filtered dataset)
- Anomaly classification using windows functions

### Key Findings
- High consumption spikes (5x-6x above average) were detected
- Temperature does not appear to drive anomalies
- Pressure and flow do not show expected correlation
- A large portion of anomalies occurs in Zona_B
- Anomalies are likely caused by sensor inconsistencies rather than real consumption

### Data Quality Notes
- Missing values were found in temperature and pressure
- No duplicate records detected
- Extreme values significantly impact analysis results

### Notes
- Data cleaning was applied after initial exploration
- Results may vary when using filtered data

## Excel Analysis

- Missing values were handled using average per sensor (imputation)
- Created "data_quality" column (IMPUTED vs REAL)
- Created "quality_flag" (1 = imputed, 0 = original)
- Evaluated data quality by sensor and zone
- Identified sensors with highest imputation rates
- Analyzed consumption associated with imputed records

## Data Model

A star schema was implemented:

- "fact_readings" - main measurements
- "dim_sensor" - zone information
- "dim_time" - time attributes (day, hour, shift)


## Tools
- SQL (DBeaver)
- Microsoft Excel
- GIT & GitHub
  
## Status
Project in progress.
