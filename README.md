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
  

## Data Visualization & Business Intelligence


Power BI was used to turn the cleaned data into interactive dashboards focused on data quality, anomaly detection, and financial impact.

### KPI Monitoring

Key metrics were created to track overall performance:

- Total Consumption vs Clean Consumption
- Noise Percentage (1.63%)
- Cost of data issues and potential savings

---

### Anomaly Analysis

- High consumption peaks were identified across sensors
- Initial approaches using average and standard deviation were tested but did not perform well due to variability and extreme values
- A more robust method based on Interquartile Range (IQR) was used to detect high peaks more accurately
- Analysis by zone and shift shows the Night Shift as the most unstable period
- Scatter analysis suggests weak correlation between consumption and pressure, supporting the idea of sensor inconsistencies
---

### Financial Impact

- Estimated financial risk from anomalies (~$21.29k)
- Simulated mitigation scenarios with potential savings (~$9.29k)
- Waterfall chart used to show cost optimization

---

### Interactive Features

- Dynamic slicers for:
  - Kwh Price
  - Maintenance Cost
- Allows simple what-if analysis based on different cost assumptions

---

### Dynamic Filtering

The dashboard allows filtering by zone to focus the analysis.

For example, when selecting Zona_A:

- Financial impact changes noticeably
- Different sensors appear as higher risk
- Patterns become more localized

This helps move from general insights to more targeted decisions.

---

## Final Conclusion

This project shows how data quality issues can affect both analysis and decision-making.

Some anomalies initially looked like real consumption problems, but further analysis suggests they are mostly related to sensor inconsistencies.

By combining SQL, Excel, and Power BI, it was possible to:

- Identify sensors with unreliable data
- Estimate the financial impact of these issues
- Explore possible improvements through scenario analysis

The main takeaway is that data quality should be monitored as part of the analysis, especially when it affects high-consumption records.

## Tools

- SQL (DBeaver)
- Microsoft Excel
- GIT & GitHub
- Microsoft Power BI
  
## Status
Project in progress.
