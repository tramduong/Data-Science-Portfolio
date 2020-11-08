#Define a function to calculate RMSE
RMSE <- function(rating, est_rating){
  sqr_err <- function(obs){
    sqr_error <- (obs[3] - est_rating[as.character(obs[1]), as.character(obs[2])])^2
    return(sqr_error)
  }
  return(sqrt(mean(apply(rating, 1, sqr_err))))  
}



ALS <- function(f = 10, lambda = 0.3, max.iter=20, data, train=data_train, test=data_test) {
  
  # Initialize Movie Matrix and User Matrix
  Movie <- matrix(runif(f*I, -1, 1), ncol = I)
  colnames(Movie) <- levels(as.factor(data$movieId))
  movie.average <- data %>% group_by(movieId) %>% summarize(ave=mean(rating))
  Movie[1,] <- movie.average$ave
  
  
  
  User <- matrix(runif(f*U, -1, 1), ncol = U) 
  colnames(User) <- levels(as.factor(data$userId))
  
  N_u <- aggregate(data,list(data$userId),length)
  a<-table(data$movieId)
  num_each_m <- as.numeric(unname(a))
  Movie_id<- names(a)
  N_m <- cbind(Movie_id,num_each_m)
  
  movie.id <- sort(unique(data$movieId))
  train_RMSE <- c()
  test_RMSE <- c()
  train <- arrange(train, userId, movieId)
  for (l in 1:max.iter){
    
    # Step2: Fix M, Solve U
    for (u in 1:U) {
      n_u_ic <- N_u[u,2]
      n_u_i <- as.numeric(n_u_ic)
      x<-train[train$userId==u,]$rating
      R_m_u <- matrix(x,nrow=length(x),ncol=1)
      User[,u] <- solve (Movie[,as.character(train[train$userId==u,]$movieId)] %*%
                           t(Movie[,as.character(train[train$userId==u,]$movieId)]) + lambda * n_u_i * diag(f)) %*%
        Movie[,as.character(train[train$userId==u,]$movieId)] %*% R_m_u}
    
    
    # Step3: Fix U, Solve M  
    for (i in 1:I) {
      n_m_jc <- N_m[i,2]
      n_m_j <- as.numeric(n_m_jc)
      y<-train[train$movieId==movie.id[i],]$rating
      R_m_m <- matrix(y,nrow=length(y),ncol=1)
      Movie[,i] <- solve (User[,train[train$movieId==movie.id[i],]$userId] %*% 
                            t(User[,train[train$movieId==movie.id[i],]$userId]) + lambda * n_m_j * diag(f)) %*%
        User[,train[train$movieId==movie.id[i],]$userId] %*% R_m_m
      
    }
    
    
    # Summerize
    cat("iter:", l, "\t")
    est_rating <- t(User) %*% Movie 
    colnames(est_rating) <- levels(as.factor(data$movieId))
    
    train_RMSE_cur <- RMSE(train, est_rating)
    cat("training RMSE:", train_RMSE_cur, "\t")
    train_RMSE <- c(train_RMSE, train_RMSE_cur)
    
    test_RMSE_cur <- RMSE(test, est_rating)
    cat("test RMSE:",test_RMSE_cur, "\n")
    test_RMSE <- c(test_RMSE, test_RMSE_cur)
    
  } 
  return(list(User = User, Movie = Movie, train_RMSE = train_RMSE, test_RMSE = test_RMSE))
}
