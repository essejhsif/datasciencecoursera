pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        ## Grab files based on directory and id    
        fileList <- paste(directory, "/", sprintf("%03d.csv", id), sep = "")
        
        ## Merge the files
        mergedFile = lapply(fileList,read.csv)
        
        ## Create a dataframe based off the merged files
        dataFrame = do.call(rbind.data.frame,mergedFile)
        
        ## Calculate mean
        mean <- mean(dataFrame[[pollutant]],na.rm=TRUE)
        
        ## Return the mean, rounded to 3 digits
        return(round(mean, digits=3))
}
