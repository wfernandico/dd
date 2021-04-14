finalmaker = function(file){
  
  dic = read.csv("dic.csv")
  dic[,1] = trimws(dic[,1])
  colnames(dic)[1] = "Position((people|system_fields|2174))"
  
  orig = read.csv(file)
  colnames(orig)[6] = "Job Title (New)((people|system_fields|2156))"
  colnames(orig)[7] = "Position((people|system_fields|2174))"
  orig[,7] = tolower(orig[,7])
  orig = orig[,1:7]
  
  final = NULL
  for(num in 1:nrow(dic)){
    row = which(orig$`Position((people|system_fields|2174))` == dic$`Position((people|system_fields|2174))`[num])
    
    dataset = orig[row,]
    dataset = dataset[which(dataset$`Job Title (New)((people|system_fields|2156))`!=dic$`Verified`[num]),]
    if(nrow(dataset)>0){
    dataset$`Job Title (New)((people|system_fields|2156))` = dic$`Verified`[num]
    final = rbind(final, dataset)
    }
    print(num)
    
    num = num + 1
  }
  
  write.csv(final[,c(1,6)], 'FinalForUpload.csv', row.names = F, na = '')
  rm(dataset, final,num,row)
  
}