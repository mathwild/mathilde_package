#' view the evolution in time of the use of a name for a sex
#'
#' @param the_name name
#' @param the_sex sex
#'
#' @return a plot
#' @export
#' @import ggplot2
#' @import dplyr
#'
#' @examples
#' \dontrun{
#' draw_a_name("Mathilde","F")
#' }

draw_a_name <- function(the_name,the_sex){
  assert_that(is.character(the_name))
  assert_that(is.character(the_sex))
  mydata <- prenoms
  jdata <- mydata %>%
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
#' @import ggplot2
#' @import dplyr
#'
#' @examples
#' \dontrun{
#' draw_a_name(c("Mathilde","Camille"))
#' }

draw_names <- function(the_names){
  assert_that(is.character(the_names))
  mydata <- prenoms
  jdata <- mydata %>% filter(name %in% the_names) %>% group_by(name,year) %>%
    summarise(total=sum(n))

  ggplot(data=jdata, aes(x=year,y=total,color=name)) + geom_line()
}
