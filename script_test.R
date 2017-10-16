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

cats <- read.csv(file = "data/feline-data.csv", stringsAsFactors = F)

# rm(x)
mean(cats$weight)

as.logical(cats$likes)

age <- c(2, 3, 12)

cats <- cbind(cats, age)

cats[1, ]

newrow <- list("tortoiseshell", 3.3, 1, 9)

cats <- rbind(cats, newrow)
# be careful of levels


rownames(cats) <- c(5:8)
rownames(cats) <- NULL # resets to sequential?


# some other stuff

num <- c(1:26)
num <- num * 2
names(num) <- LETTERS

cats$coat <- as.character(cats$coat)

matrix <- matrix(0, ncol=6, nrow = 3)
length(matrix)

matrix <- matrix(1:50, ncol=5, nrow=10)
matrix2 <- matrix(1:50, ncol=5, nrow=10, byrow=T)


# data frame creation
names <- data.frame(first = "CJ",
                    last = "Arayata",
                    lucky = 25, stringsAsFactors = F)

# neighbors
hui <- list("Hui", "Gau", 5)
caitlin <- list("Caitlin", "Foley", 11)
names <- rbind(names, hui, caitlin)

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

four.seven <- x[x > 4 & x < 7]


# subsetting, checking lists
seAsia <- c("Myanmar","Thailand","Cambodia","Vietnam","Laos")
## read in the gapminder data that we downloaded in episode 2
gapminder <- read.csv("data/gapminder.csv", stringsAsFactors = F)

## extract the `country` column from a data frame (we'll see this later);
## convert from a factor to a character;
## and get just the non-repeated elements
countries <- unique(as.character(gapminder$country))

# get logical list of countries and see if they are in SE asia or not
se <- countries %in% seAsia

over50 <- gapminder[which(gapminder$lifeExp > 50), ]

ggplot(over50, aes(x = year, y = pop)) +
  geom_point() +
  facet_wrap(~continent)


# playing with graphing
ggplot(gapminder, aes(x = year, y = lifeExp)) +
  geom_point() +
  geom_line(aes(by = country, color = country)) +
  facet_wrap(~continent) +
  theme_tufte() +
  theme(legend.position = "none")

<<<<<<< HEAD
plot <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
=======
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
>>>>>>> 8397a7e3e655c4d6564533aa8bc25e704b9ca419
  geom_point(alpha = 0.5, aes(colour = country, size = pop)) + # aesthetics needed here!
  scale_x_log10() + # this is helpful to know!
  # geom_line(aes(by = country, color = country)) +
  # facet_grid(continent~.) +
  facet_grid(.~continent) + # flips direction
  # facet_wrap(~continent) +
  theme_tufte() +
  theme(legend.position = "none") +
<<<<<<< HEAD
  geom_smooth(method = "loess", size = 1.5) +
  labs(title = "Here is a graph")

ggsave(plot = plot, file = "ggplot_example.pdf", dpi = 1200, width = 15, height = 10)


# logic flow
if (2002 %in% gapminder$year){
  print(paste0("Yes, ", sum(gapminder$year == 2002), " records found."))
} else {
  print("No, 0 records found.")
}

if (2012 %in% gapminder$year){
  print(paste0("Yes, ", sum(gapminder$year == 2012), " records found."))
} else {
  print("No, 0 records found.")
}


set.seed(10)
x <- rpois(1, lambda = 8)
x # should be 8


# for loops
for (i in 1:10){
  for (j in c("a", "b", "c")){
    print(paste0(i,j))
  }
}

# while conditions are met
x <- 1
while (x < 10) {
  print(x)
  x <- x + 1
}

# ask about how to tell if code is efficient
=======
  geom_smooth(method = "loess", size = 1.5)
>>>>>>> 8397a7e3e655c4d6564533aa8bc25e704b9ca419
