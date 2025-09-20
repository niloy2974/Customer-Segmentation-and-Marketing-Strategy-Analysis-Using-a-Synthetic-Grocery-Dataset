# Load Packages
library(corrplot)
install.packages("psych")
library(psych)

#----------------------------------------------------------------------------#

# Copy the SmartFresh Datset
main.scaled <- main.data
pca_factors <- c(
  'Spend_Wine',
  'Spend_OrganicFood',
  'Spend_Meat',
  'Spend_WellnessProducts',
  'Spend_Treats',
  'Spend_LuxuryGoods'
)

#----------------------------------------------------------------------------#

# Standardize the Dataset
main.scaled[,pca_factors] <- data.frame(scale(main.data[,pca_factors]))
summary(main.scaled)

# Create Correlation Heat Map
corrplot(cor(main.scaled[, pca_factors]),
         method = 'color', order="hclust")

# Perform PCA
main.pca <- prcomp(main.scaled[,pca_factors], scale=TRUE)
summary(main.pca)

#----------------------------------------------------------------------------#

# Create Scree Plot
screeplot(main.pca, type = "lines", main = "Scree Plot for Spending Behaviour")

# Create Biplot
biplot(main.pca, 
       xlabs = rep(".", nrow(main.pca$x)), 
       main='Biplot for Spending Behaviour')

#----------------------------------------------------------------------------#

# Calculate Cumulative Variance
cumsum(summary(main.pca)$importance[2,])
summary(main.pca)$importance[3,]

# Create a New Dataset with the Components
main.scores <- main.pca$x[,1:3]
head(main.scores)

# View the PC Loadings
main.pca$rotation

# Apply 'Varimax' Rotation and View
main.rotated <- principal(main.scaled[, pca_factors], 
                          nfactors = 3, rotate = "varimax")
main.rotated$loadings
