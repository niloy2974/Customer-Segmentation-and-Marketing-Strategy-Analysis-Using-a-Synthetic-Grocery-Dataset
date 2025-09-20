# Load Packages
library(tidyverse)
library(corrplot)
library(ggplot2)
library(dplyr)
library(tidyr)

#----------------------------------------------------------------------------#

# Create a Dataset for Visualization
visualization.data <- SmartFresh_Retail_Test
visualization.data$Spend_Total <- rowSums(visualization.data[, c(
  "Spend_Wine", 
  "Spend_OrganicFood", 
  "Spend_Meat", 
  "Spend_WellnessProducts", 
  "Spend_Treats", 
  "Spend_LuxuryGoods"
)], na.rm = TRUE)
visualization.data$Purchases_Total <- rowSums(visualization.data[, c(
  "Purchases_Online", 
  "Purchases_Catalog", 
  "Purchases_Store" 
)], na.rm = TRUE)
visualization.data$Education_Level <- as.factor(visualization.data$Education_Level)
visualization.data$Marital_Status <- as.factor(visualization.data$Marital_Status)

#-----------------------------------------------------------------------------#

# Plot the Year_Birth Box Plot
boxplot(visualization.data$Year_Birth, xlab="Years",
        main="Boxplot for Year of Births", horizontal=TRUE)

# Plot the Annual_Income Box Plot
boxplot(visualization.data$Annual_Income, xlab="Annual Income",
        main="Boxplot for Annual Income", horizontal=TRUE)

# Plot the Spend_Wine Box Plot
boxplot(visualization.data$Spend_Wine, xlab="Wine Spending",
        main="Boxplot for Wine Spending", horizontal=TRUE)

# Plot the Spend_OrganicFood Box Plot
boxplot(visualization.data$Spend_OrganicFood, xlab="Organic Food Spending",
        main="Boxplot for Organic Food Spending", horizontal=TRUE)

# Plot the Spend_Meat Box Plot
boxplot(visualization.data$Spend_Meat, xlab="Meat Spending",
        main="Boxplot for Meat Spending", horizontal=TRUE)

# Plot the Spend_WellnessProducts Box Plot
boxplot(visualization.data$Spend_WellnessProducts, xlab="Wellness Product Spending",
        main="Boxplot for Wellness Product Spending", horizontal=TRUE)

# Plot the Spend_Treats Box Plot
boxplot(visualization.data$Spend_Treats, xlab="Treats Spending",
        main="Boxplot for Treats Spending", horizontal=TRUE)

# Plot the Spend_LuxuryGoods Box Plot
boxplot(visualization.data$Spend_LuxuryGoods, xlab="Luxury Goods Spending",
        main="Boxplot for Luxury Goods Spending", horizontal=TRUE)

#-----------------------------------------------------------------------------#

# Plot the Year of Births Histogram
hist(visualization.data$Year_Birth, 
     main="Histogram for Year of Births",
     xlab="Years",
     ylab="Count",
     breaks=30,
     col="lightblue") 

# Plot the Total Annual Income Histogram
hist(visualization.data$Annual_Income, 
     main="Histogram for Annual Income",
     xlab="Annual Income",
     ylab="Count",
     breaks=30,
     col="lightblue") 

# Plot the Total Spending Histogram
hist(visualization.data$Spend_Total, 
     main="Histogram for Total Spending",
     xlab="Spending",
     ylab="Count",
     breaks=30,
     col="lightblue") 

# Plot the Total Purchases Histogram
hist(visualization.data$Purchases_Total, 
     main="Histogram for Total Purchases",
     xlab="Purchases",
     ylab="Count",
     breaks=30,
     col="lightblue") 

#-----------------------------------------------------------------------------#

# Pair Plot
filtered_data <- visualization.data %>%
  filter(!Customer_ID %in% c('7829','1150','11004','9432',
                             '8475','1503','5555','1501',
                             '5336','4931','11181'))
pairs(formula = ~Year_Birth + 
        Annual_Income + 
        Spend_Total +
        Purchases_Total +
        Promo_Purchases,
      data=filtered_data,
      cex=0.5)

#-----------------------------------------------------------------------------#

# Plot the Correlation Heatmap
cor_matrix <- cor(visualization.data[, c(
  'Year_Birth',
  'Annual_Income',
  'Spend_Total',
  'Purchases_Total',
  'Promo_Purchases')],
  use = "complete.obs")
corrplot(cor_matrix, 
         method = 'color',
         addCoef.col = "black",
         tl.col = "red"
         )

#-----------------------------------------------------------------------------#

# Plot the Education Level Bar Plot
ggplot(visualization.data, aes(x = Education_Level)) + 
  geom_bar(fill = "lightblue") +  
  labs(title = "Bar Plot for Education Levels",
       x = "Education Level",
       y = "Count") +
  theme_minimal()

# Plot the Marital Status Bar Plot
ggplot(visualization.data, aes(x = Marital_Status)) + 
  geom_bar(fill = "lightblue") +  
  labs(title = "Bar Plot for Marital Status",
       x = "Marital Status",
       y = "Count") +
  theme_minimal()

# Plot the Kid Home Bar Plot
ggplot(visualization.data, aes(x = Kidhome)) + 
  geom_bar(fill = "lightblue") +  
  labs(title = "Bar Plot for Kids Count",
       x = "Number of Kids",
       y = "Count") +
  theme_minimal()

# Plot the Teen Home Bar Plot
ggplot(visualization.data, aes(x = Teenhome)) + 
  geom_bar(fill = "lightblue") +  
  labs(title = "Bar Plot for Teens Count",
       x = "Number of Teens",
       y = "Count") +
  theme_minimal()

# Plot the Offers Bar Plot
offer_summary <- visualization.data %>%
  summarise(across(c('Accepted_Offer1', 'Accepted_Offer2',
                     'Accepted_Offer3', 'Accepted_Offer4',
                     'Accepted_Offer5', 'Response_Latest'), 
                   sum, na.rm = TRUE)) %>%
  pivot_longer(cols = everything(), 
               names_to = "Offers", 
               values_to = "Total")
ggplot(offer_summary, aes(x = Offers, y = Total)) +
  geom_bar(stat = "identity", fill = 'lightblue') +  
  labs(title = "Total Offer Acceptances",
       x = "Offers",
       y = "Count",
       ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plot the Purchases Bar Plot
purchase_summary <- visualization.data %>%
  summarise(across(c('Purchases_Online',
                     'Purchases_Store',
                     'Purchases_Catalog'), 
                   sum, na.rm = TRUE)) %>%
  pivot_longer(cols = everything(), 
               names_to = "Offers", 
               values_to = "Total")
ggplot(purchase_summary, aes(x = Offers, y = Total)) +
  geom_bar(stat = "identity", fill = 'lightblue') +  
  labs(title = "Total Purchases by Channels",
       x = "Channels",
       y = "Count",
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
