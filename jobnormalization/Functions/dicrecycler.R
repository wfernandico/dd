dicrecycler = function(dictionary){
  
  dic = read.csv('dic.csv')
  dictionary = read.csv(dictionary)
  dictionary$Position..people.system_fields.2174.. = tolower(dictionary$Position..people.system_fields.2174..)
  
  common = which(dictionary$Position..people.system_fields.2174.. %in% dic$Position)

  write.csv(dictionary[common,],
            'dic.csv',
            row.names = F)
  
  notcommon = which(!(dic$Position %in% dictionary$Position..people.system_fields.2174..))
  
  write.csv(dic[notcommon,],
            'dictionary.csv',
            row.names = F,
            na = '')
  
}