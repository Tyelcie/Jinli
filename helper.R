candidates <- data.frame(Name = sample(LETTERS, 1800, replace = T),
                         Phone = sample(1:1800, 1800))
results <- data.frame(Name = NULL, Phone = NULL)

# read
# read data from inputs
CastData <- function(data){
  results <- data.frame(Name = data['Name'],
                        Phone = data['Phone'])
  rownames(results) <- data['id']
  return(results)
}

# create default record when click 'new' button
CreateDefaultRecord <- function(){
  mydefault <- CastData(list(id = '0', Name = '', Phone = ''))
  return(mydefault)
}

#