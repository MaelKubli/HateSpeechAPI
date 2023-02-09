# ' @title: HateSpeechAPI Function building Query for API

#' This function allows you to build the needed list for the API to classify the text.
#' @param data data frame with the text column to classify.
#' @param text_name character string with the name of the text variable to classify.

#' @return a list
#' @export
#'
#' @examples
#' \dontrun{
#' dt <- data.frame(data.frame(id = c (1:5),
#'                             text = c("This","is","a","Test","data frame"))
#'
#' df <- query_maker(data = dt, text_name = "text")
#' }

#' @importFrom stringr str_trunc
#' @importFrom dplyr select

##################################################################################################
# Build Query from Text in Data
##################################################################################################
query_maker <- function(data = NULL, text_name = NULL){

  if(is.null(data) & is.null(text_name)){
    stop("Please add a data frame and the name of the text column to quer_maker!\nquery_maker(data = DATAFRAME, text_name = 'NAME_OF_TEXT_COLUMN')")
  }

  if(is.null(text_name)){
    stop("Please add the name of the text column to quer_maker!\nquery_maker(text_name = 'NAME_OF_TEXT_COLUMN')")
  }

  if(is.null(data)){
    stop("Please add a data frame to quer_maker!\nquery_maker(data = DATAFRAME)\n")
  }

  data <- dplyr::select(data, paste0(text_name))
  dat_vec <- unlist(data[,1])
  max_length_txt <- max(nchar(dat_vec))

  if(max_length_txt > 1999){
    warning("The API cannot classify text snippets larger than 2000 characters!\nWe will cut all characters after 2000 chracters.\n")
    dat_vec <- stringr::str_trunc(dat_vec, 1999, "right")
  }

  dat_list <- as.list(t(dat_vec))
  names(dat_list) <- as.character(format(seq(from = 1, to = nrow(data), by = 1), width = 3, flag = "0"))
  return(dat_list)
}
