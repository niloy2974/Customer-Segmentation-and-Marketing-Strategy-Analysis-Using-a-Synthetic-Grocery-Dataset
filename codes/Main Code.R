# Load Packages
install.packages('tidyverse')
library(tidyverse)

#----------------------------------------------------------------------------#

# Load the SmartFresh dataset
main.data <- SmartFresh_Retail_Test
summary(main.data)
str(main.data)

# Fill up NA Values
main.data <- main.data %>% 
  group_by(Education_Level) %>% 
  mutate(Annual_Income=
           ifelse(is.na(Annual_Income),
                  mean(Annual_Income, na.rm=TRUE),
                  Annual_Income
  ))

# Modify the Marital_Status column
main.data$Marital_Status <-
  ifelse(main.data$Marital_Status %in%
           c('Divorced','Married','Single','Together','Widow'),
         main.data$Marital_Status, 'Single')

# Creating Bins
main.data <- main.data %>% 
  mutate(Year_Birth = case_when(
    Year_Birth >= 1990 ~ 'Young Adults',
    Year_Birth >= 1975 ~ 'Adults',
    Year_Birth >= 1955 ~ 'Middle-aged Adults',
    TRUE ~ 'Seniors'
  ))
main.data <- main.data %>% 
  mutate(Annual_Income = case_when(
    Annual_Income <= 20000 ~ 'Lower Income (SEC D/E)',
    Annual_Income <= 40000 ~ 'Lower-Middle Income (SEC C2)',
    Annual_Income <= 70000 ~ 'Middle Income (SEC C1)',
    Annual_Income <= 120000 ~ 'Upper-Middle Income (SEC B)',
    TRUE ~ 'High Income (SEC A)'
  ))

# Factorization
main.data$Education_Level <- as.factor(main.data$Education_Level)
main.data$Marital_Status <- as.factor(main.data$Marital_Status)
main.data$Year_Birth <- as.factor(main.data$Year_Birth)
main.data$Annual_Income <- as.factor(main.data$Annual_Income)
