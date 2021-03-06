library(stringr)
# normal <- data.frame(ID = NULL, Name = NULL, Phone = NULL)
# special <- data.frame(ID = NULL, Name = NULL, Phone = NULL)
candidates <- data.frame(ID = c(1:800),
                         Name = sample(LETTERS, 800, replace = T),
                         Phone = str_pad(sample(1:800, 800), width = 11, pad = '0'),
                         stringsAsFactors = F)
substr(candidates$Phone, 4, 7) <- '****'

DeleteData <- function(id) {
  candidates <<- candidates[-id, ]
}

# AddNormal <- function(id){
#   normal <<- rbind(normal, candidates[id,])
# }
# AddSpecial <- function(id){
#   special <<- rbind(special, candidates[id,])
# }