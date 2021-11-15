source('Scripts/read_data.R')

library(stats)
library(pROC)

pca_comp <- prcomp(bikes[,c(6,7,8,9)], center = TRUE, scale = TRUE)
pca_x = as.data.frame(pca_comp$x[,1:3])

sample <- floor(0.70 * nrow(bikes))
train_ind <- sample(seq_len(nrow(bikes)), size = sample)
train <- pca_x[train_ind, ]
test <- pca_x[-train_ind, ] 

pca_model <- lm(bikes$count[train_ind] ~ PC1+PC2+PC3, data = train)

predicted <- predict(pca_model,test)

auc(bikes$count[-train_ind], predicted)