# Calculate GDP

# calcGDP <- function(dat){
#   gdp <- dat$pop * dat$gdpPercap
#   return(gdp)
# }

# Takes a dataset and multiplies the population column
# with the GDP per capita column.
calcGDP <- function(dat, year=NULL, country=NULL) {
  if(!is.null(year)) {
    dat <- dat[dat$year %in% year, ]
  }
  if (!is.null(country)) {
    dat <- dat[dat$country %in% country,]
  }
  gdp <- dat$pop * dat$gdpPercap
  
  new <- cbind(dat, gdp=gdp) # add new column to dataframe
  return(new)
}
