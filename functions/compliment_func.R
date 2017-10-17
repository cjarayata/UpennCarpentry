compliment <- function(name) {
  if (!is.character(name)) {
    stop("The input must be a character string.")
  }
  words <- paste0("Hello ", name, ", I like your face.")
  print(words)
}

# compliment("Sally")
