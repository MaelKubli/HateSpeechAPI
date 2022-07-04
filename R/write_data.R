# ' @title: HateSpeechAPI Function saving Data

#' This function allows you to write data with text that you classified with the API
#' @param output path to data of type csv, xlsx or rds.
#' @param data data frame to write to disk.
#' @export
#'
#' @examples
#' \dontrun{
#' write_data(output = "./DATA.csv", data = df)
#' }

#' @importFrom readr write_csv
#' @importFrom xlsx write.xlsx
#' @importFrom readr write_rds

##################################################################################################
# Write Data
##################################################################################################
write_data <- function(output, data){

  if(is.null(data) & is.null(output)){
    stop("Please add a data frame and the file to write to wirte_data!\nwrite_data(data = DATAFRAME, output = 'NAME_OF_FILE')")
  }

  if(is.null(output)){
    stop("Please add the file to write_data!\nwrite_data(output = 'NAME_OF_FILE')")
  }

  if(is.null(data)){
    stop("Please add a data frame to write_data!\nwrite_data(data = DATAFRAME)\n")
  }

  if(grepl("(.*?)\\.(csv)$", output)){
    readr::write_csv(data, file = paste0(output))
  } else if(grepl("(.*?)\\.(xlsx)$", output)){
    xlsx::write.xlsx(data, file = paste0(output))
  } else if(grepl("(.*?)\\.(rds|Rds)$", output)){
    readr::write_rds(data, file = paste0(output))
  } else {
    stop("This funtion can only write csv, xlsx, and rds files!\n")
  }
}
