get_file_info = function (file_name) {
  ## Q1
  file_size = file.info(file_name)$size / (1024*1024)

  ## Q2
  library(R.utils)
  row_count = countLines(file_name)[1]

  max_length = 0
  row_count_incl_love = 0
  row_count_incl_hate = 0
  
  con = file(file_name, 'r')
  for (i in 1:row_count) {
    row = readLines(con, 1)

    ## Q3 Max length
    x = nchar(row)
    max_length = ifelse(x > max_length, x, max_length)
    
    ## Q4 Rows include "love" or "hate"
    row_count_incl_love = row_count_incl_love + ifelse(is.na(grep('love', row)[1]), 0, 1)
    row_count_incl_hate = row_count_incl_hate + ifelse(is.na(grep('hate', row)[1]), 0, 1)
    
    ## Q5
    if (!is.na(grep('biostats', row)[1])) {
      print(file_name)
      print(row)
    }
    
    ## Q6
    if (!is.na(grep('^A computer once beat me at chess, but it was no match for me at kickboxing$', row)[1])) {
      print(file_name)
      print(row)
    }
  }
  close(con)

  return(list(
    file_size = file_size, 
    row_count = row_count, 
    max_length = max_length,
    row_count_incl_love = row_count_incl_love,
    row_count_incl_hate = row_count_incl_hate))
}

## get_file_info('./test.txt')

sapply(list(
  '../final/en_US/en_US.twitter.txt', 
  '../final/en_US/en_US.blogs.txt', 
  '../final/en_US/en_US.news.txt'
  ), get_file_info)
