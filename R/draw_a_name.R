#' plot the number of people born throughout the years of certain sex and name
#'
#' @param the_name name
#' @param the_sex sex
#'
#' @return a plot
#' @export
#' @import ggplot2
#'
#' @examples
#' \dontrun{
#' draw_a_name("Mathilde","F")
#' }

draw_a_name <- function(the_name,the_sex){
  jdata <- prenoms %>%
    filter(name == the_name, sex == the_sex) %>% group_by(year) %>%
    summarise(total=sum(n))

  ggplot(data=jdata, aes(x=year,y=total)) + geom_line()
}
