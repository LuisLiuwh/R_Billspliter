billspliter <- function(){
  
  numPersons <- as.integer(readline(prompt = "Please introduce the number of buyers: "))
  
  i <- 1
  buyers <- data.frame(Names = character(), stringsAsFactors = FALSE)
  for (i in 1 : numPersons) {
    buyers[i,] <- readline(prompt = paste("Please introduce the name of the person ", 
                                          i, ": \n", sep = ""))
    if (i == numPersons) {
      cat("The buyers are: \n")
      print(buyers)
      
    }
    
  }
  
  col_names <- c("Article", "Import", buyers$Names)
  main_list <- matrix(0, ncol = numPersons + 2)
  main_list <- `colnames<-`(main_list, col_names)
  main_list <- data.frame(main_list)
  
  j <- 1
  
  repeat {
    new_article <- readline(prompt = paste("Please introduce the name of the article ", 
                                            j, ": \n", sep = ""))
    new_import <- as.numeric(readline(prompt = paste("Please introduce the price of the article ", 
                                                      j, ": \n", sep = "")))
    
    if(tolower(new_article) == "end" || tolower(new_import) == "end") {
      return(main_list)}
    else {
      print(buyers)
      sharedBy <- readline(prompt = paste(
        "Please introduce the number of persons to whom this article belongs: ",
        "\n",
        "E.g: 1,3 means that the 1st and the 3rd person share this article",
        "\n"))                                                                                                                                                                                                       
      sharedBy <- as.numeric(strsplit(sharedBy, ",")[[1]])
      
      new_line <- rep(0, numPersons)
      new_line[sharedBy] <- 1
      new_line <- (new_import/length(sharedBy))*new_line
      
      main_list[j, 1] <- new_article
      main_list[j, 2] <- new_import
      main_list[j, 3:(numPersons + 2)] <- new_line
      
      total_table <- main_list
      total_table[j+1, 1] <- "Total"
      total_table[j+1, 2:(numPersons + 2)] <- colSums(main_list[ , 2:(numPersons + 2)])
      print(total_table)
      
      
    }
    
    
    
    j <- j + 1

  }
  
    
    
    
    
}
  
  