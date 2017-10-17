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

plot <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +

  geom_point(alpha = 0.5, aes(colour = country, size = pop)) + # aesthetics needed here!
  scale_x_log10() + # this is helpful to know!
  # geom_line(aes(by = country, color = country)) +
  # facet_grid(continent~.) +
  facet_grid(.~continent) + # flips direction
  # facet_wrap(~continent) +
  theme_tufte() +
  theme(legend.position = "none") +

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

  geom_smooth(method = "loess", size = 1.5)


# there was some sort of weird conflict but i am going to start day 2
# i cant tell what all these hatches and stuff are

  
# day 2 starts - list structures
  
genes <- list()
genes[["HOX"]] <- c("exon1", "exon2", "exon3")
genes[["HBB"]] <- c("exon1")
genes

# functions stuff
gapminder <- read.csv("data/gapminder.csv", stringsAsFactors = F)

year <- c(1952, 1957)

# but coulnd't i just do this?
gapminder$gdp <- gapminder$pop * gapminder$gdpPercap

# write to new global dataframe
new_gapminder <- calcGDP(gapminder)

paste0("Man I love the years ", year[1], " and ", year[2])

compliment <- function(name) {
  if (!is.character(name)) {
    stop("The input must be a character string.")
  }
  words <- paste0("Hello ", name, ", I like your face.")
  print(words)
}

compliment("Bob")

pdf("plots/Life_Exp_vs_time.pdf", width=12, height=4)
ggplot(data=gapminder, aes(x=year, y=lifeExp, colour=country)) +
  geom_line() +
  facet_grid(. ~continent) +
  theme(legend.position = "none")

# You then have to make sure to turn off the pdf device!

dev.off()

write.table(
  gapminder[gapminder$year > 1990, ],
  file = "data/cleaned_data/gapminder-after1990.txt",
  sep = "¯_(ツ)_¯", quote = F, row.names = F)

devtools::install_github("dill/emoGG")
library(emoGG)
emoji_search("poop")
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_emoji(emoji="1f4a9")

# info about performance/benchmarking
# http://adv-r.had.co.nz/Performance.html


# select, filter, mutate, group_by, summarize
# hadley is god-like
library(plyr)
unloadNamespace("plyr")
library(dplyr)

# a pipe looks like this: %>%

ddply(
  .data = calcGDP(gapminder),
  .variables = "continent",
  .fun = function(x) mean(x$gdp)
)

# select
year_country_gdp <- select(gapminder, year, country, gdpPercap)
class(year_country_gdp)


year_country_gdp <- gapminder %>% select(year,country,gdpPercap)
install.packages("tidyr")
library(tidyr)

gapminder %>% select(., year,country,gdpPercap)

# filter
"1952" <- gapminder %>% filter(year == 1952)

year_country_lifeExp_Africa <- gapminder %>%
  filter(continent=="Africa") %>%
  select(year,country,lifeExp)

# order of piping matters; if you filter by a variable, it must be *before* it is selected/subsetted!

head(gapminder %>% group_by(country))
str(gapminder)

# summarize!!
gap <- gapminder %>% group_by(country) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
str(gap)


# Calculate the average life expectancy per country. Which has the longest average life expectancy and which has the shortest average life expectancy?
lifeExp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp=mean(lifeExp))
lifeExp_bycountry %>%
  filter(mean_lifeExp == min(mean_lifeExp) | mean_lifeExp == max(mean_lifeExp))

# counting
gapminder %>%
  filter(year == 2002) %>%
  count(continent)

# what i used to do in creating summary tables
gapminder %>%
  group_by(continent) %>%
  summarize(
    mean_le = mean(lifeExp),
    min_le = min(lifeExp),
    max_le = max(lifeExp),
    se_le = sd(lifeExp)/sqrt(n()))

# mutate: creates a new column
gap <- gapminder %>% mutate(new_col = pop / 100)

# combining with ggplot
library(ggplot2)

# Get the start letter of each country

# the "bad" way...
starts.with <- substr(gapminder$country, start = 1, stop = 1)
# Filter countries that start with "A" or "Z"
az.countries <- gapminder[starts.with %in% c("A", "Z"), ]
# Make the plot
ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + facet_wrap( ~ country)

# the clean way
gapminder %>%
  # Filter countries that start with "A" or "Z"
  filter(substr(country, start = 1, stop = 1) %in% c("A", "Z")) %>%
  # Make the plot
  ggplot(aes(x = year, y = lifeExp, color = continent)) +
  geom_line() +
  facet_wrap( ~ country)

# tidyr
gap_wide <- read.csv("data/gapminder_wide.csv", stringsAsFactors = FALSE)

