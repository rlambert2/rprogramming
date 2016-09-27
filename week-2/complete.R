complete <- function(directory, id=1:332) {
    ## Call files
    file.list <- list.files(path = directory, full.names =TRUE)
    ## initialize empty vector that stores complete cases
    nobs <- numeric()
    ## loop through specified files and count complete cases
   
     for (i in id) {
        data <- read.csv(file.list[i])
        nobs <- c(nobs, sum(complete.cases(data)))
        }
    
    ## Print data.frame output
    data.frame(id, nobs)
}
