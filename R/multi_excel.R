#' import all sheets from an excel file
#'
#' @param file path to xlsx file
#'
#' @return a list
#' @export
#' @import readxl
#'
#' @examples
#' \dontrun{
#' multi_excel("/folder/toxlsxfile")
#' }
multi_excel <- function(file) {
  all_sheets <- readxl::excel_sheets(file)
  result <- lapply(all_sheets, function(sheet){
    readxl::read_excel(file, sheet = sheet)
  })
  return(result)
}
