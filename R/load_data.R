# ' @title: HateSpeechAPI Function loading Data

#' This function allows you to load data with text that you want to classify
#' @param input path to data of type csv, xlsx or rds.


#' @return a data frame
#' @export
#'
#' @examples
#' \dontrun{
#' df <- load_data(input = "./DATA.csv")
#' }

#' @importFrom readr read_csv
#' @importFrom readxl read_xlsx
#' @importFrom readr read_rds

##################################################################################################
# Load Data
##################################################################################################
load_data <- function(input){

  if(is.null(input)){
    stop("Please add a file path to load_data!\nload_data(input = 'NAME_OF_FILE')\n")
  }

  if(grepl("(.*?)\\.(csv)$", input)){
    dat <- readr::read_csv(input)
  } else if (grepl("(.*?)\\.(xlsx)$", input)){
    dat <- readxl::read_xlsx(input)
  } else if (grepl("(.*?)\\.(rds|Rds)$", input)){
    dat <- readr::read_rds(input)
  } else {
    stop("This function only works with csv, xlsx and rds files!\n")
  }

  return(dat)
}
