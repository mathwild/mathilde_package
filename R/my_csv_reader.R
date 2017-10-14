#' import multiple csv files
#'
#' @param folder path to the folder
#'
#' @return a list
#' @export
#' @importFrom utils read.csv2
#'
#' @examples
#' \dontrun{
#' my_csv_reader("../../path/to/folder")
#' }
#'


my_csv_reader <- function(folder) {
  l <- list.files(path=folder, pattern = ".*csv", full.names = TRUE)
  result <- lapply(l,read.csv2)
  return(result)
}
