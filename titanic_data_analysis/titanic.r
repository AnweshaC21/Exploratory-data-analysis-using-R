library(dplyr)
library(tibble)
library(explore)
library(ggplot2)

titanic <- as_tibble(Titanic)
titanic

head(titanic)
tail(titanic)
names(titanic)
summary(titanic)

titanic %>% explore(Class, n = n)
titanic %>% describe(Class, n = n)
titanic %>% explore_all(n = n)

titanic %>% explore(Class, target = Survived, n = n, split = FALSE)
titanic %>% explore(Class, target = Survived, n = n, split = TRUE)
titanic %>% explore(Sex, target = Survived, n = n)
titanic %>% explore(Age, target = Survived, n = n)

titanic %>% explain_tree(target = Survived, n = n)

titanic %>% explore(Age, target = Class, n = n)
titanic %>% explore(Sex, target = Class, n = n)

ggplot(titanic, aes(x = Class, y = Sex, color = Survived)) + geom_jitter(size = 3)
