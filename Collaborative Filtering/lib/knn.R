

d<-function(x){
  s<-sum(x^2)
  return(sqrt(s))
}



where.max<-function(x){
  location<-which.max(x)
  return(as.numeric(names(x)[location]))
}





pred.knn<-function(data_train,data_test,q){
  
  ##similarity matrix betwee movies
  
  length<-apply(q, 2, d)
  names(length)<-colnames(q)
  
  predict.knn<-c()
  
  ###knn
  for (m in 1:nrow(data_test)) {
    user<-data_test$userId[m]
    movie<-data_test$movieId[m]
    q.movie<-q[,colnames(q)==as.character(movie)]
    
    
    train<-data_train %>%
      filter(userId==user)
    
    train.movie<-train$movieId
    
    s<-as.numeric(t(q.movie) %*% q[,colnames(q) %in% as.character(train.movie)])
    similar<-s/(length[as.character(movie)] * length[as.character(train.movie)])
    
    close.movie<-where.max(similar)
    
    predict.knn[m]<-as.double(train %>%
                                filter(movieId==close.movie) %>%
                                select(rating))
    
    
  }
  
  
  rmse<-RMSE(data_test$rating,predict.knn)
  
  return(list(knn=predict.knn,rmse=rmse))
  
}

#answer.train<-pred.knn(data_train,data_train,r$q)
#save(answer.train,file = "answer_train.RData")
#answer<-pred.knn(data_train,data_test,q=r$q)

#save(answer,file = "answer.RData")