#' view the evolution in time of the use of a name for a sex
#'
#' @param the_name name
#' @param the_sex sex
#'
#' @return a plot
#' @export
#' @importFrom utils data
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' draw_a_name("Mathilde","F")
#' }

draw_a_name <- function(the_name,the_sex){
  assert_that(is.character(the_name), msg = "The name needs to be a character")
  assert_that(is.character(the_sex), msg = "The sex needs to be a character")

  data(prenoms)
  jdata <- prenoms %>%
    filter(name == the_name, sex == the_sex) %>% group_by(year) %>%
    summarise(total=sum(n))

  ggplot(data=jdata, aes(x=year,y=total)) + geom_line()
}

#' compare the evolution in time of the use of different names
#'
#' @param the_names names
#'
#' @return a plot
#' @export
#' @importFrom utils data
#' @import prenoms
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' draw_a_name(c("Mathilde","Camille"))
#' }

draw_names <- function(the_names){
  assert_that(is.character(the_names), msg = "The names needs to be a character and within a vector")

  data(prenoms)
  jdata <- prenoms %>% filter(name %in% the_names) %>% group_by(name,year) %>%
    summarise(total=sum(n))

  ggplot(data=jdata, aes(x=year,y=total,color=name)) + geom_line()
}
