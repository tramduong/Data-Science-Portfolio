
train_test_split <- function(data,train_ratio = 0.8){
  rownames(data) <- paste(data$userId,data$movieId,sep = '_')
  test_idx <- sample(1:nrow(data), round(nrow(data)/(1/(1-train_ratio)), 0))
  train_idx <- setdiff(1:nrow(data), test_idx)
  data_train <- data[train_idx,]
  data_test <- data[test_idx,]
  
  allMovies <- unique(data$movieId)
  allUsers <- unique(data$userId)
  
  
  #if there are movies in testing set but not in training set, we need to add them to training
  while (!all(allMovies %in% data_train$movieId) | (!all(allUsers %in% data_train$userId))){
    multiMovies <- data_train %>% group_by(movieId) %>% summarise(Count = n()) %>% filter(Count > 1)
    multiUsers <- data_train %>% group_by(userId) %>% summarise(Count = n()) %>% filter(Count > 1)
    multiMovieUsers <- data_train %>% filter(movieId %in% multiMovies$movieId, userId %in% multiUsers$userId) ##these entries are somewhat safe to remove
    rownames(multiMovieUsers) <- paste(multiMovieUsers$userId,multiMovieUsers$movieId,sep = '_')
    
    if (!all(allMovies %in% data_train$movieId)){#add movies
      #print('Movies missing in training after split. Making Changes...')
      addMovies <- allMovies[which(!allMovies %in% data_train$movieId)]
      
      #data to add to train
      add_data <- data_test %>% filter(movieId %in% addMovies) 
      add_data <- do.call(rbind,lapply(split(add_data,add_data$movieId),FUN = function(x){
        x[sample(1:nrow(x),1),]
      }))
      rownames(add_data) <- paste(add_data$userId,add_data$movieId,sep = '_')
      
      #data to remove from train
      remove_data <- multiMovieUsers[sample(1:nrow(multiMovieUsers),nrow(add_data)),]
      
      #modify train data
      data_train <- data_train[-which(rownames(data_train) %in% rownames(remove_data)),]
      data_train <- rbind(data_train,add_data)
      
      #modify test data
      data_test <- data_test[-which(rownames(data_test) %in% rownames(add_data)),]
      data_test <- rbind(data_test, remove_data)
    }else if (!all(allUsers %in% data_train$userId)){#add users
      #print('User missing in training after split. Making Changes...')
      addUsers <- allUsers[which(!allUsers %in% data_train$userId)]
      
      #data to add to train
      add_data <- data_test %>% filter(userId %in% addUsers) 
      add_data <- do.call(rbind,lapply(split(add_data,add_data$userId),FUN = function(x){
        x[sample(1:nrow(x),1),]
      }))
      rownames(add_data) <- paste(add_data$userId,add_data$movieId,sep = '_')
      
      #data to remove from train
      remove_data <- multiMovieUsers[sample(1:nrow(multiMovieUsers),nrow(add_data)),]
      
      #modify train data
      data_train <- data_train[-which(rownames(data_train) %in% rownames(remove_data)),]
      data_train <- rbind(data_train,add_data)
      
      #modify test data
      data_test <- data_test[-which(rownames(data_test) %in% rownames(add_data)),]
      data_test <- rbind(data_test, remove_data)
    }
  }
  
  return(list(train = data_train,test = data_test))  
  
}