cv.function <- function(data_train, K, f, lambda){
  ### Input:
  ### - train data frame
  ### - K: a number stands for K-fold CV
  ### - tuning parameters 
  
  n <- dim(data_train)[1]
  n.fold <- round(n/K, 0)
  
  
  train_rmse <- matrix( 0,ncol = 5,nrow = K) #### 5=max.iter
  test_rmse <- matrix( 0,ncol = 5, nrow = K)
  
  for (i in 1:K){
    train.data <- train_test_split(data = data_train,train_ratio=(1-1/K))$train
    test.data <- train_test_split(data = data_train,train_ratio =(1-1/K))$test
    
    result <- als.td(f=f,lambda=lambda,max.iter = 5,data = data_train,data_train = train.data,data_test = test.data)
    
    train_rmse[i,] <-  (result$rmse)$train_rmse
    test_rmse[i,] <-   (result$rmse)$test_rmse
    
  }		
  return(list(mean_train_rmse = colMeans(train_rmse), mean_test_rmse = colMeans(test_rmse)))
  #sd_train_rmse = apply(train_rmse, 2, sd), sd_test_rmse = apply(test_rmse, 2, sd)))
}