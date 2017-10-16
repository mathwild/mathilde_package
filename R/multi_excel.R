#' import all sheets from an excel file
#'
#' @param file path to xlsx file
#'
#' @return a list
#' @export
#' @import readxl
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' multi_excel("/folder/toxlsxfile")
#' }
multi_excel <- function(file) {
  assert_that(has_extension(file,"xlsx"), msg = "The file needs to be an excel file" )
  assert_that(is.readable(file), msg = "The file needs to be readable")

  all_sheets <- readxl::excel_sheets(file)
  result <- lapply(all_sheets, function(sheet){
    readxl::read_excel(file, sheet = sheet)
  })
  return(result)
}
