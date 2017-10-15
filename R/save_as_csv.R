#' saves a file as csv
#'
#' @param dataset the data
#' @param filename pre existing file
#' @param row.names set as FALSE
#'
#' @return a path to file
#' @export
#' @import assertthat
#' @importFrom utils write.csv2
#'
#' @examples
#' \dontrun{
#' save_as_csv(iris, "output.csv")
#' }

save_as_csv <- function(dataset, filename, row.names = FALSE){
  assert_that(has_extension(filename,"csv"))
  assert_that(is.dir(dirname(filename)))
  assert_that(is.writeable(dirname(filename)))
  assert_that(not_empty(dataset))
  assert_that(is.data.frame(dataset))

  write.csv2(x = dataset, file = filename, row.names = row.names)
  invisible(normalizePath(filename))

}
