# Load Packages
library(tidyverse)

#----------------------------------------------------------------------------#

# Factoring the Year_Birth and Annual_Income
main.data.with_cluster <- main.data.with_cluster %>%
  mutate(Year_Birth = recode(Year_Birth, 
                             `1` = "Adults", 
                             `2` = "Middle-aged Adults",
                             `3` = "Seniors", 
                             `4` = "Young Adults"))
main.data.with_cluster <- main.data.with_cluster %>%
  mutate(Annual_Income = recode(Annual_Income, 
                             `1` = "High Income (SEC A)", 
                             `2` = "Lower Income (SEC D/E)",
                             `3` = "Lower-Middle Income (SEC C2)", 
                             `4` = "Middle Income (SEC C1)",
                             `5` = "Upper-Middle Income (SEC B)"))
main.data.with_cluster <- main.data.with_cluster %>%
  mutate(Cluster = recode(Cluster, 
                                `1` = "Value-conscious Buyers", 
                                `2` = "Moderate Spenders",
                                `3` = "Affluent Consumers"))

#----------------------------------------------------------------------------#

# Group Total Spending based on Product and Cluster
cluster.group.product <- main.data.with_cluster %>%
  pivot_longer(cols = c(Spend_Wine, Spend_OrganicFood,
                        Spend_Meat, Spend_WellnessProducts,
                        Spend_Treats, Spend_LuxuryGoods), 
               names_to = "Product", 
               values_to = "Spending") %>%
  group_by(Cluster, Product) %>%
  summarise(Total_Spending = sum(Spending), .groups = "drop")

# Plot Total Spending based on Product and Cluster
ggplot(cluster.group.product, 
       aes(x = Product, y = Total_Spending, fill = as.factor(Cluster))) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Total Spending by Product and Cluster",
       x = "Product",
       y = "Total Spending",
       fill = "Cluster") +  
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#----------------------------------------------------------------------------#

# Group Total Acceptances based on Offer and Cluster
cluster.group.offer <- main.data.with_cluster %>%
  pivot_longer(cols = c(Accepted_Offer1, Accepted_Offer2,
                        Accepted_Offer3, Accepted_Offer4,
                        Accepted_Offer5, Response_Latest), 
               names_to = "Offer", 
               values_to = "Acceptance") %>%
  group_by(Cluster, Offer) %>%
  summarise(Total_Acceptances = sum(Acceptance), .groups = "drop")

# Plot Total Acceptances based on Offer and Cluster
ggplot(cluster.group.offer, 
       aes(x = Offer, y = Total_Acceptances, fill = as.factor(Cluster))) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Total Accpetances by Offer and Cluster",
       x = "Offer",
       y = "Total Acceptances",
       fill = "Cluster") +  
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#----------------------------------------------------------------------------#

# Group Total Purchases based on Cluster and Channel
cluster.group.channel <- main.data.with_cluster %>%
  pivot_longer(cols = c(Purchases_Online,
                        Purchases_Catalog,
                        Purchases_Store), 
               names_to = "Channel", 
               values_to = "Purchase") %>%
  group_by(Cluster, Channel) %>%
  summarise(Total_Purchases = sum(Purchase), .groups = "drop")

# Plot Total Purchases based on Cluster and Channel
ggplot(cluster.group.channel, 
       aes(x = as.factor(Cluster), y = Total_Purchases, fill = Channel)) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Total Purchases by Cluster and Channel",
       x = "Cluster",
       y = "Total Purchases",
       fill = "Channel") +  
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#----------------------------------------------------------------------------#

# Group Customer Count based on Cluster and Age Group
cluster.group.age <- main.data.with_cluster %>%
  group_by(Cluster, Year_Birth) %>%
  summarise(Customer_Count = n(), .groups = "drop")

# Plot Customer Count based on Cluster and Age Group
ggplot(cluster.group.age, 
       aes(x = as.factor(Cluster), y = Customer_Count, 
           fill = as.factor(Year_Birth))) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Customer Count by Cluster and Age Group",
       x = "Cluster",
       y = "Customer Count",
       fill = "Age Group") +  
  theme_minimal()

#----------------------------------------------------------------------------#

# Group Customer Count based on Cluster and Income Level
cluster.group.income <- main.data.with_cluster %>%
  group_by(Cluster, Annual_Income) %>%
  summarise(Customer_Count = n(), .groups = "drop")

# Plot Customer Count based on Cluster and Income Level
ggplot(cluster.group.income, 
       aes(x = as.factor(Cluster), y = Customer_Count, 
           fill = as.factor(Annual_Income))) +
  geom_bar(stat = "identity", position = "dodge") + 
  labs(title = "Customer Count by Cluster and Income Level",
       x = "Cluster",
       y = "Customer Count",
       fill = "Income Level") +  
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
