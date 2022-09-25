library(palmerpenguins)
library(dplyr)
library(explore)
library(ggplot2)
library(corrplot)
library(GGally)

data <- penguins
data

#describing the data
summary(data)
str(data)
describe(data)

head(data, 5)
tail(data, 5)

#exploring the data with visualization
plot(data)

data %>% explore_all()
data %>% explore_all(target = species)

data %>% explain_tree(target = species)

data %>% explore(flipper_length_mm, bill_length_mm, target = species)

#correlation between categorical features
#   species vs island
table(data$species, data$island)
chisq.test(table(data$species, data$island))

ggplot(data, aes(x = island, y = species, color = species)) + geom_jitter(size = 3)

# There is a strong correlation between species and island
# Adelie lives in every island,
# Gentoo lives in only Biscoe,
# Chinstrap lives in only Dream

#   species vs sex
table(data$sex, data$species)
chisq.test(table(data$sex, data$species))
ggplot(data, aes(x = sex, y = species, color = species)) + geom_jitter(size = 3)

#   sex vs island
table(data$sex, data$island)
chisq.test(table(data$sex, data$island)[-1,])
ggplot(data, aes(x = species, y = sex, color = species)) + geom_jitter(size = 3)
# no meaningful correlation between  species and sex or sex and island

#correlation between numerical features
penNumeric <- data %>% select(-species, -island, -sex)
corrplot(cor(penNumeric))

pCol <- c('#057076', '#ff8301', '#bf5ccb')
plot(penNumeric, col = pCol[penguins$species], pch = 19)

