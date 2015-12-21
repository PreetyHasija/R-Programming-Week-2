# set working directory
setwd("C:/1/Trainings Document Database/1. Repository X/Data Analytics/Coursera/2. Introduction to R programming/Programming Assignment 1")

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
 
 
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # initialize a vector to hold the pollutant data
  mean_vector <- c()
  
  # find all files in the specdata folder
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  for(i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    head(current_file)
    pollutant
    na_removed <- current_file[!is.na(current_file[, pollutant]), pollutant]
    mean_vector <- c(mean_vector, na_removed)
  }
  
  
  result <- mean(mean_vector)
  return(round(result, 3)) 
}

# tests
pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "nitrate", 23) == 1.281

