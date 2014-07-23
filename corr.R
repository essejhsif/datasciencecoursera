corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        ## Grab all files
        allFiles <- list.files(directory)
        
        corr <- c() 
        
        ## Loop through each of the files
        for(i in 1:332){
                
                ## Read in current file
                file <- read.csv(paste(directory, "/", allFiles[i], sep = ""))
                
                ## Omit the NAs
                file <- na.omit(file)
                
                ## Create a vector of correlations for the monitors that meet the threshold requirement.
                if (nrow(file) > threshold) {
                        corr <- c(corr, cor(file$sulfate, file$nitrate) ) 
                }
        }
        
        ## Return the vector of correlations
        corr
}
