# 🚖 Uber Ride Analysis

## 📌 Executive Summary
Analyzed **150,000 booking transactions** using MySQL and Power BI to diagnose a **₹2.44 Crore revenue leakage** caused by a 38% unfulfilled booking rate. Identified critical supply-side bottlenecks—primarily driven by driver cancellations running **2.6x higher than rider cancellations** and pickup turnaround times exceeding customer tolerance thresholds. Designed an operational dispatch and driver retention strategy projected to recover **₹48.8 Lakhs in uncaptured Gross Merchandise Value (GMV)**.

---

## 🎯 Business Problem
Across 150K trip requests, only **62% (93,000 trips)** were successfully completed. The remaining **38% (57,000 trips)** failed to generate revenue, leaving an estimated **₹2.44 Crore in gross bookings unrealized**.

### Key Business Objectives:
* **Quantify Revenue Leakage:** Calculate the exact financial cost of unfulfilled rides across vehicle tiers and high-demand corridors.
* **Diagnose Supply vs. Demand Friction:** Isolate why 27,000 rides were rejected by drivers and determine how pickup wait times (Avg VTAT) trigger customer drop-offs.
* **Identify Allocation Bottlenecks:** Map geographic micro-zones where 10,500 rides failed due to "No Driver Found".
* **Deliver Actionable Business Interventions:** Provide executive leadership with operational levers (dispatch capping, driver cancellation policies, and fleet repositioning) to recapture lost GMV.

---

## 🔍 Key Data Insights 
* **Scale & Completion Baseline:** The dataset contains **150,000 bookings**, with **93,000 trips completed (62%)** generating **₹47.3M (₹4.73 Crore)** in total revenue at an average fare of **₹508**.
* **Revenue Leakage:** The overall unfulfilled rate is **38% (57,000 rides)**, with 48,000 lost bookings causing an estimated **₹2.44 Crore in unrealized Gross Merchandise Value (GMV)**.
* **Driver Cancellations Outpace Rider Drops:** Drivers cancelled **27,000 rides** (18% of total volume)—nearly **2.6x higher** than customer cancellations (10,500 rides)—accounting for **₹1.37 Crore** (over 56%) of total unfulfilled revenue.
* **The 12.5-Minute Wait-Time Cliff:** Completed rides maintained an average vehicle turnaround time (Avg VTAT) of **8.5 minutes**, but customer cancellations increased sharply when VTAT reached **12.5 minutes** (+47%), with nearly half of customers citing that the driver was stationary or asked them to cancel.
* **Zero-Allocation Clusters:** **10,500 bookings (7%)** failed immediately with *"No Driver Found"* (representing **₹53.3 Lakhs** in lost GMV), heavily concentrated in recurring suburban hubs like Saket, Khandsa, and Barakhamba Road.
* **Operational Recovery Scope:** Addressing driver drop-offs and dispatch delays provides an immediate opportunity to recover **~₹48.8 Lakhs** in top-line revenue by targeting a 20% reduction in unfulfilled demand.
---


##  Power BI Dashboard

The Power BI dashboard contains five analytical sections:

### 1. Overall
Provides a high-level view of:

- Completed Bookings
- Cancellation Rate
- Monthly booking and revenue trends

### 2. Vehicle Type
Analyzes booking and revenue performance across different vehicle categories.

### 3. Revenue
Examines revenue trends, booking value, and fare performance.

### 4. Cancellation
Analyzes cancellation rates and cancellation reasons.

### 5. Ratings
Provides insights into customer and driver ratings.

---

## Dashboard Preview

### Overall Dashboard

![Overall Dashboard](images/01overall.png)

### Vehicle Type Analysis

![Vehicle Type Analysis](images/02vehicle_type.png)

### Revenue Analysis

![Revenue Analysis](images/03revenue.png)

### Cancellation Analysis

![Reason Analysis](images/04reason.png)

### Ratings Analysis

![Rating Analysis](images/05rating.png)

---


---
## 💡 Strategic Solutions & Business Levers
1. **Dynamic Dispatch Radius Capping:** Constrain allocation radiuses during high-volume periods to ensure vehicle arrival times stay within the safe 8.5-minute window.
2. **Driver Cancellation Policy & Cooldowns:** Implement reliability scoring and cooldown rules for repeated driver-initiated cancellations to eliminate off-platform haggling.
3. **Automated Inactivity Detection:** Reassign trips automatically if an assigned driver remains stationary for more than 3 minutes.
4. **Predictive Fleet Redistribution:** Guide idle drivers into recurring zero-driver clusters prior to peak volume windows.

---

## 📈 Projected Business Impact
* **Target Recovery:** Recapturing 20% of unfulfilled demand (9,600 trips).
* **Revenue Reclaimed:** **+₹48.8 Lakhs** directly added to top-line booking value without additional customer acquisition spend.
* **Fulfillment Lift:** Projected to shift baseline platform fulfillment from **62% to ~68%**

---

##  Project Structure

```text
Uber-Business-Analysis-SQL-PowerBI/
│
├── images/
│   ├── 01overall.png
│   ├── 02vehicle_type.png
│   ├── 03revenue.png
│   ├── 04reason.png
│   ├── 05ratings.png
│ 
│
├── 01_Data_Validation.sql
├── 02_Booking_Analysis.sql
├── 03_Revenue_Analysis.sql
├── 04_Customer_Analysis.sql
├── 05_Cancellation_Analysis.sql
├── 06_Location_Time_Analysis.sql
├── 06_Advanced_SQL.sql
│
└── Uber_dashboard.pbix
