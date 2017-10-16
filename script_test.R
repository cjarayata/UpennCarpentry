x <- gapminder::gapminder

getwd()

write.csv(x, file = "data/gapminder.csv", row.names = F)


rm()

x <- c(1:3)
pacman::p_load(ProjectTemplate)

?ProjectTemplate

# talking about cats, why does everyone here love cats so much
coat <- c("calico", "black", "tabby")
weight <- c(2.1, 5.0, 3.2)
likes <- c(1, 0, 1)


cats <- data.frame("coat" = coat,
                   "weight" = weight,
                   "likes" = likes)
write.csv(cats, file = "data/feline-data.csv", row.names = F)



rm(x)
mean(cats$weight)

as.logical(cats$likes)

num <- c(1:26)
num <- num * 2
names(num) <- LETTERS

cats$coat <- as.character(cats$coat)

matrix <- matrix(0, ncol=6, nrow = 3)
length(matrix)

matrix <- matrix(1:50, ncol=5, nrow=10)
matrix2 <- matrix(1:50, ncol=5, nrow=10, byrow=T)
