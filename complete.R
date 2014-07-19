complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        ## Create data frame for rows which are complete
        completed <- data.frame(id=numeric(0), nobs=numeric(0))  
        
        ## Loop through each of the file ids specified 
        for(i in id) {
                
                ## Load the file to analyze
                file <- read.csv(paste(directory, "/", sprintf("%03d.csv", i), sep = ""))
                
                ## Track the id, nobs in the dataframe that will be returned 
                completed <- rbind(completed, c(i, nrow(na.omit(file))))
                
                # Increment for loop by 1
                i <- i + 1
        }
        
        # Ensure column names are correct
        colnames(completed) <- c("id","nobs")
        
        # Return the dataframe with id, nobs
        completed
}