# Eniac Brazil Logistics Strategy Analysis  
## Evaluating Magist as a Logistics Partner for Premium Tech Products

**Tools Used:** SQL | MySQL | Tableau | Prezi | Business Analytics  
**Dataset:** Magist Logistics Dataset Snapshot (2018)

---

#  Project Overview

This project evaluates whether Eniac, a premium Apple-focused e-commerce company, should partner with Magist to support logistics operations during expansion into the Brazilian market.

Eniac sells high-value Apple-compatible products through its own website. Because of this premium positioning, delivery reliability plays a critical role in customer satisfaction and brand reputation.

The objective of this project was to analyze delivery performance, delays, product characteristics, sales value distribution, and customer reviews to determine whether Magist’s logistics performance meets premium expectations.

**Project completed:** April 2026  
**Dataset type:** Snapshot of Magist operational data  
**Market context:** Brazilian e-commerce logistics performance in **2018**

---

#  About Eniac

Eniac is a premium online marketplace focused on Apple products and accessories.

Key characteristics:

- Customers purchase directly through Eniac’s website  
- Average order value: **€710**  
- Average item price: **€514**  
- Focus on premium customer experience  
- High expectations for delivery reliability  

---

#  About Magist

Magist is a Brazilian logistics and order management provider supporting multiple online sellers.

Key characteristics:

- Average item price on Magist: **€120.65**  
- Focus on lower-value goods  
- Logistics optimized for general consumer products  

➡️ This creates a **value mismatch** with Eniac’s premium products.

---

#  Business Objective

Eniac aims to:

- Enter the Brazilian market within **1 year**
- Maintain premium delivery standards
- Protect brand reputation
- Ensure customer satisfaction

**Main business question:**

Can Magist’s logistics performance support premium delivery expectations?

The analysis reflects logistics performance based on a **snapshot of Magist operations in 2018**, prior to COVID-19 disruptions.

---

#  Dataset Information

**Dataset Source:**  
Magist logistics dataset (educational snapshot version).

**Dataset Characteristics:**

- **99,441 total orders**
- **32,951 products**
- **3,095 sellers**
- **74 product categories**
- Snapshot representing logistics operations around **2018**

**Main Tables Used:**

- orders  
- order_items  
- products  
- sellers  
- order_reviews  
- order_payments  
- customers  

---

#  Key Findings

## Delivery Performance

- On-time orders: **88,649**
- Delayed orders: **7,827**
- Overall delay rate: **7.3%**

Average delivery time:

- Overall delivery time: **12 days**
- Tech delivery time: **13 days**

Additional delivery risks:

- Some deliveries took **up to 1 month**
- **24 tech orders exceeded 150 days**

 Delivery variability presents significant risk for premium logistics.

---

## Customer Review Breakdown

Rating distribution:

- ⭐ 5-star reviews: **36,175**
- ⭐ 4-star reviews: **12,971**
- ⭐ 3-star reviews: **4,515**
- ⭐ 2-star reviews: **986**
- ⭐ 1-star reviews: **2,603**

 Lower ratings indicate customer dissatisfaction risks.

---

## Sales Value Breakdown

Total sales value:

**€13.6 Million**

Tech product sales:

**€1.3 Million**

Tech share of total sales:

**~9.9%**

 Magist is primarily a general-product marketplace.

---

## Tech Product Market Insights

- Tech products sold: **11,161**
- Tech sellers: **386**
- Total sellers: **3,095**
- Tech sellers share: **12.47%**

 Limited specialization in tech logistics.

---

## Drivers of Delivery Delays

Variables analyzed:

- Product weight  
- Product length  
- Product height  
- Product width  

Key insight:

 Larger and heavier products show **higher delay risk**.

---

## Extreme Delivery Cases

- **24 tech orders exceeded 150 days delivery time**

 Even rare extreme delays represent serious brand risk.

---

# 📈 Visualisations

Charts and dashboards were created using Tableau to support analysis of delivery performance and delay patterns.

Visualisations include:

- Delivery performance comparison  
- Customer review distribution  
- Tech delivery time comparison  
- Delay rate visualisation  

All visualisation files are stored in:


charts/


---

#  Presentation

Full presentation:

`presentation/eniac_brazil_logistics_strategy_presentation.pdf`

Online version:

(https://prezi.com/view/CUZOOmy98nwU1v48ozGc/?referral_token=QcoEMklnB3FN)

---

#  Presentation Structure

The presentation is divided into two main sections:

---

## Main Presentation (Executive Summary)

This section focuses on key business insights and strategic recommendations.

Main slides include:

- Business context and expansion objective  
- Value comparison between Eniac and Magist  
- Delivery performance overview  
- Identification of premium logistics risks  
- Strategic recommendation against using Magist  

This section summarizes the most critical insights for executive decision-making.

---

## Appendix (Detailed Technical Analysis)

The appendix contains deeper analytical insights supporting the recommendation.

Appendix includes:

- Sales value vs tech sales value comparison  
- Delivery delay benchmarking  
- Customer review distribution analysis  
- Delivery time analysis for tech products only  
- Extreme delay case analysis (>150 days deliveries)  
- Product size impact on delivery delays  
- Tech seller distribution analysis  
- Additional supporting charts and detailed metrics  

This section provides transparency and validation of the analytical process.

---

#  Alternative Supplier Evaluation

## Recommended Alternative: DHL Supply Chain

Key strengths:

- Global logistics provider  
- Active in Brazil since **1978**  
- Experience handling high-value electronics  
- Structured logistics infrastructure  
- Comprehensive customer service support  

 Better alignment with premium delivery expectations.

---

#  Technologies Used

**Programming:**

- SQL (MySQL)

**Data Analysis Tools:**

- MySQL Workbench  
- Tableau (Data Visualization)

**Presentation Tools:**

- Prezi (Business Presentation)

**Techniques Applied:**

- Delivery time analysis  
- Delay pattern detection  
- Sales segmentation  
- Product dimension analysis  
- Business strategy evaluation  
- Data visualization  
- Data storytelling  

---

#  Project Files


eniac-brazil-logistics-magist-evaluation/

README.md

eniac_magist_logistics_analysis.sql

presentation/
eniac_brazil_logistics_strategy_presentation.pdf


---

#  SQL Analysis

All data exploration and business analysis queries were written in SQL.

Key analyses included:

- Order volume analysis  
- Delivery delay calculations  
- Tech category analysis  
- Product size delay analysis  
- Customer review distribution  
- Sales segmentation  

SQL file:

`eniac_magist_logistics_analysis.sql`

---

#  Final Recommendation

**Magist should not be used as the primary logistics partner.**

Main reasons:

- **7.3% delayed orders**
- Average delivery time: **12–13 days**
- Some deliveries take **up to 1 month**
- **24 extreme delays (>150 days)**
- Large value mismatch (**€514 vs €120**)
- Risk to premium customer experience

Recommended strategy:

- Use premium logistics providers such as **DHL Supply Chain**
- Use temporary logistics support during early testing
- Maintain strict delivery reliability standards

This recommendation is based on **Magist logistics performance snapshot data from 2018**.

---

#  Future Work

Further analysis could include:

- Regional delivery comparison  
- Monthly delay trend tracking  
- Customer complaint text analysis  
- Logistics cost benchmarking  

---

#  Project Information

Project completed: **April 2026**  
Project duration: **1 week**

Skills demonstrated:

- SQL data analysis  
- Business problem solving  
- Logistics performance evaluation  
- Strategic recommendation development  
- Data storytelling  
- Data visualization using Tableau  

---

#  Contact

Name: Abdul Rahman Abssi  
Email: abssiabdulrahman@gmail.com

