source('helper.R')
if(TRUE){
  awards <- candidates[sample(candidates$Phone, 1),]
  candidates <- candidates[-match(awards$Phone, candidates$Phone),]
  results <- rbind(results, awards)
}
