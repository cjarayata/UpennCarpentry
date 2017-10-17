# converting temperatures

fahr_to_kelvin <- function(temp) {
  if (!is.numeric(temp)) {
    stop("The input must be a number.")
  }
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}
# stopifnot is crucial "defensive programming" - catch errors early


kelvin_to_celsius <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

fahr_to_celsius <- function(temp) {
  temp_k <- fahr_to_kelvin(temp)
  result <- kelvin_to_celsius(temp_k)
  return(result)
}
