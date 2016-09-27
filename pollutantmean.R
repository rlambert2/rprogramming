pollutantmean <- function(directory, pollutant, id=1:332) {
    file.list <- list.files(path = directory, full.names =TRUE)
    values <- numeric()
    
    for (i in id) {
        data <- read.csv(file.list[i])
        values <- c(values, data[[pollutant]])
    }
    
    mean(values, na.rm = TRUE)

}

## TESTS
## source("pollutantmean.R")
## pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
## pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
## pollutantmean("specdata", "nitrate", 23)
## [1] 1.281