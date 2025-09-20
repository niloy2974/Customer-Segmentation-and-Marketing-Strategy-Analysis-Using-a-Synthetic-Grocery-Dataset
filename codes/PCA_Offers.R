# Load Packages
library(corrplot)
install.packages("psych")
library(psych)

#----------------------------------------------------------------------------#

# Copy the SmartFresh Datset
main.scaled <- main.data
pca_factors <- c(
  'Accepted_Offer1',
  'Accepted_Offer2',
  'Accepted_Offer3',
  'Accepted_Offer4',
  'Accepted_Offer5',
  'Response_Latest'
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
screeplot(main.pca, type = "lines", main = "Scree Plot for Offers")

# Create Biplot
biplot(main.pca, 
       xlabs = rep(".", nrow(main.pca$x)), 
       main='Biplot for Offers')

#----------------------------------------------------------------------------#

# Calculate Cumulative Variance
cumsum(summary(main.pca)$importance[2,])
summary(main.pca)$importance[3,]

# Create a New Dataset with the Components
main.scores <- main.pca$x[,1:4]
head(main.scores)

# View the PC Loadings
main.pca$rotation

# Apply 'Varimax' Rotation and View
main.rotated <- principal(main.scaled[, pca_factors], 
                          nfactors = 4, rotate = "varimax")
main.rotated$loadings
