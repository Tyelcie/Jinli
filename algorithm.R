source('helper.R')
if(TRUE){
  awards <- candidates[sample(candidates$Phone, 1),]
  candidates <- candidates[-match(awards$Phone, candidates$Phone),]
  results <- rbind(results, awards)
}

# if we do not delet the temperate result
# for(i in 1:1800){
#   i
#   awards <- candidates[sample(candidates$Phone, 1),]
#   results <- rbind(results, awards)
# }
# any(duplicated(results$Phone))
