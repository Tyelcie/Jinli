library(stringr)
candidates <- data.frame(ID = c(1:800),
                         Name = sample(LETTERS, 800, replace = T),
                         Phone = str_pad(sample(1:800, 800), width = 11, pad = '0'),
                         stringsAsFactors = F)
substr(candidates$Phone, 4, 7) <- '****'

# results <- data.frame(ID = NULL, Name = NULL, Phone = NULL)

GetTableMetadata <- function() {
  fields <- c(id = 'ID',
              name = "Name", 
              phone = "Phone")
  result <- list(fields = fields)
  return (result)
}

# read
# read data from inputs
CastData <- function(data) {
  datar <- data.frame(name = data["name"], 
                      phone = data["Phone"],
                      stringsAsFactors = FALSE)
  
  rownames(datar) <- data["id"]
  return (datar)
}

# CreateDefaultRecord <- function() {
#   mydefault <- CastData(list(id = "0", name = "", phone = ""))
#   return (mydefault)
# }

CreateDefaultRecord <- function() {
  id = match(sample(candidates$Phone, 1),candidates$Name)
  mydefault <- CastData(list(name = candidates$Name[id], phone = candidates$Phone[id]))
  return (mydefault)
}

#
UpdateInputs <- function(data, session) {
  updateTextInput(session, "name", value = unname(data["name"]))
  updateCheckboxInput(session, "phone", value = data["phone"])
}


GetNextId <- function() {
  if (exists("results") && nrow(results) > 0) {
    max(as.integer(rownames(results))) + 1
  } else {
    return (1)
  }
}

CreateData <- function(data) {
  data <- CastData(data)
  rownames(data) <- data$id
  if (exists("results")) {
    results <<- rbind(results, data)
  } else {
    results <<- data
  }
}

ReadData <- function() {
  if (exists("results")) {
    results
  }
}

UpdateData <- function(data) {
  data <- CastData(data)
  results[row.names(results) == row.names(data), ] <<- data
}

DeleteData <- function(id) {
  candidates <<- candidates[-id, ]
}
