# run script from project root

library(zoo)

input_dir <- file.path("data", "rda")
output_dir <- file.path("data", "csv")

loadRData <- function(fileName){
  #loads an RData file, and returns it
  load(fileName)
  get(ls()[ls() != "fileName"])
}

file.names <- dir(input_dir, pattern ="rda")

for(i in 1:length(file.names)){
  file_name <- file.names[i]
  file_data <- loadRData(file.path(input_dir, file_name))
  output_name <- file.path(output_dir, sub(".rda", ".csv", file_name))
  
  if(class(file_data)!="list") {
    write.zoo(as.zoo(file_data), output_name, sep=",")
  }
}