# Prepare the Features
main.data
main.data$Spend_Total <- rowSums(main.data[, c(
  "Spend_Wine", 
  "Spend_OrganicFood", 
  "Spend_Meat", 
  "Spend_WellnessProducts", 
  "Spend_Treats", 
  "Spend_LuxuryGoods"
)], na.rm = TRUE)
main.data$Year_Birth <- as.integer(main.data$Year_Birth)
main.data$Education_Level <- as.integer(main.data$Education_Level)
main.data$Marital_Status <- as.integer(main.data$Marital_Status)
main.data$Annual_Income <- as.integer(main.data$Annual_Income)

# Filter the Dataset 
cluster_factors <- c(
  'Year_Birth',
  'Education_Level',
  'Marital_Status',
  'Annual_Income',
  'Kidhome',
  'Teenhome',
  'Spend_Total'
)
main.cluster <- main.data[cluster_factors]

#----------------------------------------------------------------------------#

# Standardize the Dataset
main.cluster.scaled <- as.data.frame(lapply(main.cluster,scale))
summary(main.cluster.scaled)

# Train Model
set.seed(2974)

# Set K max
k.max <- 10

# Run Multiple Iterations based on different K
wss <- sapply(1:k.max, 
              function(k){kmeans(main.cluster.scaled, 
                                 k, nstart=50, 
                                 iter.max = 15 )$tot.withinss})

# Plot the Elbow Chart
wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares",
     main='Elbow Chart')

#----------------------------------------------------------------------------#

# Run K-means based on K=3
clusters <- kmeans(main.cluster.scaled, 3)
clusters

# look at the size of the clusters
clusters
clusters$tot.withinss
clusters$betweenss
clusters$size
clusters$centers
clusters$withinss

# Visualize Clusters
library(cluster)
clusplot(main.cluster.scaled, 
         clusters$cluster, 
         color = TRUE, 
         shade = TRUE, 
         labels = 4, 
         lines = 0, 
         main = "K-means Cluster Plot")

# Assign Cluster Numbers to the Customers
main.data.with_cluster <- main.data
main.data.with_cluster$Cluster <- clusters$cluster
