# Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset
This project uses a synthetic grocery dataset to analyse customer demographics, spending behaviour, and promotional engagement. Techniques such as EDA, PCA, K-Means clustering, and t-tests are applied to segment customers and provide data-driven marketing strategy insights.
# Project Overview
This project explores customer segmentation and marketing strategy analysis using a synthetic dataset of a hypothetical grocery business operating both online and offline. The goal is to identify customer groups, uncover purchasing and promotional engagement patterns, and provide actionable recommendations for targeted marketing.

The analysis begins with Exploratory Data Analysis (EDA) to examine demographic and behavioural features, followed by Principal Component Analysis (PCA) to reduce dimensionality and highlight key factors influencing behaviour. K-Means Clustering is then applied to segment customers based on income, spending, and demographic patterns. Finally, Independent Samples T-tests are conducted to evaluate the effectiveness of promotional campaigns across segments.

These steps reveal insights into customer preferences, loyalty, and responsiveness to offers, enabling strategic recommendations such as loyalty programme design, premium product targeting, and cost-effective promotions for value-conscious buyers.
# Data Dictionary
This synthetic dataset captures customer demographics, household details, purchasing behaviour, and promotional engagement for a hypothetical grocery business operating online and offline. It provides a comprehensive view of customer profiles, shopping channels, and campaign responses, enabling segmentation and marketing strategy analysis.
## Customer Information
1. Customer_ID: Unique identifier for each customer
2. Year_Birth: Customer’s year of birth
3. Education_Level: Highest education level attained
4. Marital_Status: Marital status (Single, Married, Divorced, etc.)
5. Annual_Income: Estimated yearly household income (£)
6. Kidhome: Number of children in the household
7. Teenhome: Number of teenagers in the household
8. Dt_Customer: Date of enrolment with the company
9. Last_Interaction: Days since the last customer interaction (purchase, visit, or call)
10. Feedback_Complaint: Complaint raised in the last 2 years (1 = Yes, 0 = No)
## Product Spending
1. Spend_Wine: Amount spent (£) on premium wine in the last 2 years
2. Spend_OrganicFood: Amount spent (£) on organic vegetables and fruits in the last 2 years
3. Spend_Meat: Amount spent (£) on meat and fish in the last 2 years
4. Spend_WellnessProducts: Amount spent (£) on wellness products (supplements, skincare, etc.) in the last 2 years
5. Spend_Treats: Amount spent (£) on small treats (chocolates, candies, etc.) in the last 2 years
6. Spend_LuxuryGoods: Amount spent (£) on luxury items (e.g., jewellery, gold) in the last 2 years
## Promotion Engagement
1. Promo_Purchases: Number of purchases made during promotions
2. Accepted_Offer1–5: Accepted offers from Campaigns 1–5 (1 = Yes, 0 = No)
3. Response_Latest: Accepted the latest campaign (1 = Yes, 0 = No)
## Shopping Channels
1. Purchases_Online: Purchases made through the website
2. Purchases_Catalog: Purchases made via catalogue orders
3. Purchases_Store: Purchases made in physical retail stores
4. Visits_OnlineLastMonth: Number of website visits in the last month
# Exploratory Data Analysis
Exploratory Data Analysis (EDA) is a crucial step in analysing customer datasets, as it helps uncover insights, patterns, and trends that guide further analysis. Here, boxplots and histograms are used to illustrate the central tendency and distribution of numerical features. Correlation analysis and pair plots help identify relationships between them. Bar plots are utilised for categorical variables to examine their frequency distribution. 
## Central Tendency, Variance and Spread of Numerical Variables
![Boxplots for Numerical Variables](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Boxplots%20for%20Numerical%20Variables.jpg)

The box plots reveal the presence of multiple outliers, primarily in product spending at the higher end. These outliers suggest that a small number of loyal customers make significantly high purchases. Additionally, outliers in birth years and a single extreme outlier in income level indicate potential errors in data entry during registration. These anomalies should be addressed before proceeding with further analysis. Examining central tendencies, the mean spending on wine and meat is the highest.

![Histograms for Numerical Variables](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Histograms%20for%20Numerical%20Variables.jpg)

The histograms for birth years and income suggest that these variables would follow a normal distribution if outliers were excluded. In contrast, both spending and purchase frequency exhibit right-skewed distributions, indicating that most customers spend and purchase at lower levels. 

![Pair Plot (left) and Correlation Heatmap (right) for Numerical Variables](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Pair%20Plot%20and%20Correlation%20Heatmap%20for%20Numerical%20Variables.jpg)

The pair plot shows that customers across different age groups are evenly distributed across most features, except for promotional purchases, where middle-aged customers have the highest engagement. Promotional purchases also tend to be higher across the mid-range of other features, suggesting that middle-aged families with moderate spending are more likely to take advantage of promotions. Aligning with the correlation heatmap, a strong positive correlation is observed between spending and purchases, along with a moderately high positive correlation between income and both spending and purchases. This highlights a clear relationship between income and purchasing behaviour. 
## Distribution of Categorical Variables
![Bar Plots for Categorical Variables](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Barplots%20for%20Numerical%20Variables.jpg)

The bar charts indicate that most customers are graduates and married. Very few customers have two children or two teenagers. Regarding the company's marketing efficiency, most customers preferred the latest campaign and are comfortable with in-store visits.
# Factor Analysis using PCA
Factor analysis helps uncover underlying patterns in customer purchasing behaviour and preference for offers. By applying Principal Component Analysis (PCA), these factors can be reduced to a smaller set of components, making interpretation more efficient and insightful. 

![Correlation Heatmap for Product Spending (left) and Offer Acceptances (right)](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Correlation%20Heatmap%20for%20Product%20Spending%20and%20Offer%20Acceptances.jpg)

The correlation heatmaps reveal that purchasing behaviour is more strongly correlated than offer acceptance. Both charts indicate positive correlations among most factors. Notably, customers' spending on meat, wine, organic food, and wellness products exhibits strong correlations, suggesting similar purchasing patterns. In contrast, the moderate correlation among offer acceptances suggests a reluctance to engage with multiple, varied offers.

![Scree Plot and Components Importance for Spending Behaviour (left) and Offer Acceptances (right)](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Scree%20Plot%20and%20Components%20Importance%20for%20Spending%20Behaviour%20and%20Offer%20Acceptances.jpg)

After performing PCA, six components were generated for both factor sets. The scree plots, which depict the individual variances explained by each component, indicate that 79% of the variance can be captured using three components for spending and four for offers. This suggests they are the optimal factors to represent the full sample, further supported by the levelling off observed in the scree plots.

![Biplot and Component Loadings for Spending Behaviour (left) and Offer Acceptances (right)](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Biplot%20and%20Component%20Loadings%20for%20Spending%20Behaviour%20and%20Offer%20Acceptances.jpg)

Applying Varimax rotation enhances the interpretability of component loadings. In spending patterns, high loadings on RC1 for organic food (0.80), wellness products (0.78), and treats (0.81) suggest that customers tend to purchase these items together. Similarly, wine (0.91) and meat (0.67) are often bought together, while luxury goods (0.94) appear to be purchased independently.   

For offer preferences, the third (0.70) and fourth (0.90) offers appeal to one customer group, while the second (0.50) and latest (0.85) offers attract a different segment. Meanwhile, the first (0.88) and fifth (0.95) offers each appeal to distinct individual groups. 

The PCA factor analysis reveals distinct underlying patterns in both purchasing behaviour and offer engagement. Customers tend to have preferences for multiple product categories, as seen in their spending habits on related items. Similarly, offers are not exclusive to single customer segments as multiple offers can appeal to the same individuals. These insights highlight the interconnected nature of purchasing tendencies and promotional effectiveness, providing a clearer understanding of consumer behaviour.
# Cluster Analysis
Gaining deeper customer insights is essential for enhancing campaign efficiency and implementing targeted marketing strategies. Conducting cluster analysis on customer data is particularly effective, as it incorporates diverse, uncontrollable attributes that enable meaningful segmentation. Including total spending in the analysis further helps differentiate customers based on loyalty, allowing for more tailored and strategic engagement. To perform the analysis, age and income groupings were established to provide more refined insights and better identify customer patterns.

![Elbow Chart](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Elbow%20Chart.jpg)

Multiple iterations of K-means Clustering were performed using varying K values, and the elbow chart was plotted to determine the optimal number of clusters. The chart, along with the within-sum-of-squares (WSS) for each K, illustrates that as the number of clusters increases, the distance within observations decreases, with smaller cluster sizes reducing overall variance. Based on the chart's interpretation, the elbow point at K=3 (WSS=10,107.18) is identified as the optimal number of clusters.

![Cluster Plot (top) and Cluster Details (bottom) at K=3](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Cluster%20Plot%20and%20Cluster%20Details%20at%20K%3D3.jpg)

Choosing three clusters (K=3) results in a well-defined split, with two distinct clusters at either end or a central group of 949 customers. The WSS for clusters one (2,926) and three (2,837) is lower than for cluster two (4,345), indicating tighter clustering in the former.  

The cluster centres provide key insights into customer characteristics. Cluster one has lower Year_Birth (-0.55) and Education_Level (-0.31) scores, suggesting a younger demographic with lower educational attainment. In contrast, higher Marital_Status scores in clusters two (0.02) and three (0.03) indicate a prevalence of individuals who are ‘Together’ or ‘Widowed’. The lower Marital_Status score in cluster one (-0.06) suggests a higher proportion of married or divorced individuals, typically older, which aligns with the higher number of kids (0.82).   

Annual_Income closely follows Spend_Total, confirming that higher-income customers, primarily in cluster three, tend to spend the most. These findings form the basis for the following customer segmentations, using the widely used framework:

![Customer Segmentations](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/tables/Customer%20Segmentations.jpg)

The table above offers a clear framework for effectively targeting each segment by aligning geographic, demographic, psychographic, and behavioural insights with personalised marketing strategies. This approach enhances customer engagement and improves conversion rates. A deeper analysis of each segment’s purchasing behaviour and product-specific spending will provide further insights into customer preferences and spending patterns.

![Customer Count by Cluster and Income Level, and Customer Count by Cluster and Income Level](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Customer%20Count%20by%20Cluster%20and%20Income%20Level%2C%20and%20Total%20Spending%20by%20Product%20and%20Cluster.jpg)

Analysing income distribution across clusters reveals that most SECB and SEC1 customers fall into the Affluent Consumers category, while those at the lower end belong to the ValueConscious Buyers segment. Product-wise spending highlights that Affluent Consumers are the highest spenders, driven primarily by significant expenditure on meat and wine. Both Affluent Consumers and Moderate Spenders show a strong preference for premium consumables, as reflected in their high spending on wine. In contrast, ValueConscious Buyers prioritise meat, aligning with their focus on meeting essential physiological needs. These insights from the tables clearly demonstrate the influence of income level on purchasing behaviour.

# Independent Samples T-test
A t-test is a valuable tool in marketing for comparing two groups to determine whether differences are statistically significant. An independent samples t-test can be used to evaluate the effectiveness of a campaign across different segments. By analysing segment-wise mean purchases during promotions, it helps identify which segments have made significantly higher purchases.

![Promo Purchases Distribution based on Customer Segments](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Promo%20Purchases%20Distribution%20based%20on%20Customer%20Segments.jpg)

By plotting the histograms of Promo_Purchases grouped by customer segments, we can see the spread of each segment’s purchases during promotion. All the distributions are right skewed indicating that most customers to tend to avail the offers 1-2 times. Currently, the distribution shows the mean purchases for the Moderate spenders to be the highest. Combinations of t-tests on the segments will explain how significant the difference is. 

![T-test Results](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/T-test%20Results.jpg)

In the first t-test, the mean purchases for Moderate Spenders (3.14) were found to be higher than those of Value-Conscious Buyers (2.10). The p-value (2.2e-16) < 0.05 confirms that this difference is statistically significant. Similarly, further t-tests comparing each group with the cluster show that the mean purchases of Affluent Consumers (1.30) are significantly lower (p-value < 0.05) than those of the other clusters.   

These findings, combined with previous insights, indicate that Moderate Spenders are highly responsive to offers, as they represent a substantial portion of the sample. Affluent Consumers, belonging to higher income levels, are the least influenced by promotions, as they tend to make purchases regardless of discounts. Meanwhile, Value-Conscious Buyers emerge as a better target group for offers, as they prioritise discounts and bundled deals.
# Recommendations
Target marketing is essential as it aligns a firm's strategy with customer needs rather than its internal perspective, ensuring a realistic, market-focused approach for better product fit and strategic planning. Customer segmentation considers individual characteristics and purchasing behaviour to match the firm's product offerings with customer value, enabling effective strategy development. Therefore, segment-specific target marketing and tailored strategies should be implemented for them to maximise profitability and optimise offerings.

![Total Acceptances by Offer and Cluster (left) and Total Purchases by Cluster and Channel (right)](https://github.com/niloy2974/Customer-Segmentation-and-Marketing-Strategy-Analysis-Using-a-Synthetic-Grocery-Dataset/blob/main/visualisations%20and%20results/Total%20Acceptances%20by%20Offer%20and%20Cluster%2C%20and%20Total%20Purchases%20by%20Cluster%20and%20Channel.jpg)

Both offers and channels are the only controllable constraints for them, allowing them to tailor each segment's approach with the right offer through the most effective channel. They should utilise previous data to assess campaign effectiveness, which clearly indicates that offers three, four, and five were only effective for Affluent Consumers. Therefore, they should focus on promoting similar offers, including both the initial and most recent ones. The following recommendations are suggested for each segment:
## Targeting Affluent Consumers with Premium Offerings
Affluent consumers are highly educated, high-income customers who prioritise quality and are willing to pay a premium for superior products. They should focus on promoting premium offerings, particularly meat and wine, as these were identified as their preferred purchases. Although they take advantage of most offers, their promotional purchases are lower than other segments, as their purchasing decisions are less influenced by price constraints. Given their preference for catalogue shopping, they should strategically feature more premium products in catalogues to enhance engagement and sales. 
## Implementing a Loyalty Programme to Retain Moderate Spenders
Moderate spenders make the highest number of purchases both during and outside promotional periods. While they are not the highest spenders, their frequent buying behaviour makes them the most loyal segment, as loyalty is defined by consistency rather than spending alone. Their high engagement in both physical and online stores further reinforces their loyalty to them. Given their strong preference for offer-based products, introducing a loyalty programme would be highly beneficial. This would not only help retain these customers and encourage repeat purchases through personalised offers but also provide valuable insights into their buying behaviour, enabling them to refine and optimise future promotions.
## Driving Engagement Through Discounts and Bundled Deals for Value Conscious Buyers
Value-conscious buyers have the lowest income and education levels, leading them to prioritise essential needs, particularly affordability and financial security. Their purchasing decisions are heavily influenced by low prices, ensuring they meet necessities before considering other factors. Findings indicate that this segment responds best to discounts and bundled deals. To maximise engagement and sales, they should focus on offering cost-effective promotions, ensuring affordability while maintaining product value. In conclusion, by leveraging data-driven insights and targeted marketing strategies, they can effectively engage its key customer segments, optimise promotional campaigns, and drive revenue growth. Implementing personalised offers and tailored strategies will enhance customer loyalty and improve overall business performance.
