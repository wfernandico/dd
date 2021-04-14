dicmaker = function(file){
  
  dic = read.csv(file)
  dic = table(dic$Position..people.system_fields.2174..)
  dic = sort(dic, decreasing = T)
  dic = data.frame(dic)
  dic = dic[,1]
  dic = data.frame(Position = tolower(dic),Verified = '')
  write.csv(dic,
            'dic.csv',
            row.names = F)
  print('File dic has been produced. Please fill column Verified')
  
}