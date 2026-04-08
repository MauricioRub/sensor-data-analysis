# sensor-data-analysis
End-to-end data analysis project using sensor data to identify anomalies and detect potential leaks.

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

## Tools
- SQL (DBeaver)
- GIT & GitHub
  
## Status
Project in progress.
