#! /usr/local.bin/Rscript
setwd("C:/Users/cj/Desktop/UpennCarpentry/UpennCarpentry")

input <- commandArgs(trailingOnly = T)

cats <- read.csv("data/feline-data.csv")

catnames <- c("Herbie", "Chloe", "Budgie")

input <- c(input, catnames)

cats$names <- input[1:3]

write.csv(cats, "data/feline-data-named.csv", quote = FALSE, row.names = FALSE)