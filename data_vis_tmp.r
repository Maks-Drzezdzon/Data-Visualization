library(car)
library(pastecs)
library(psych)
library(Rcmdr)
# tidyverse has most needed libs
library(tidyverse)

# plot
hist.day1 <- ggplot(df, aes(day1)) + 
  # remove legend
  theme(legend.position = "none") +
  # use density plot, color black and fill white
  geom_histogram(aes(y = ..density..), colour = "black", fill = "white") +
  # name x/y labels
  labs(x = "Hygiene score on day 1", y = "Density")
# render
hist.day1

# add curve
hist.day1 +
  # The stat_function() command draws the normal curve using the function dnorm(). This
  # function basically returns the probability (i.e., the density) for a given value from a normal
  # distribution of known mean and standard deviation
  stat_function(fun = dnorm, args = list(mean = mean(df$day1, na.rm = TRUE),
                                         sd = sd(df$day1, na.rm = TRUE)),
                colour = "black", size = 1)

?mpg # help
plotdata <- ggplot2::mpg #load dataset
ggplot(data = plotdata)
# aes == Aesthetic Mappings
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) 

describe(df$day1)

stat.desc(df$day1, basic = FALSE, norm = TRUE)

# using color mapping for each class present 
ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy, color = class))

question <- 
  "What's gone wrong with this code? Why are the points not blue? 
  ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = 'blue' ))"

# debugging exercise 
ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy), color = 'blue')

unique(ggplot2::mpg$displ)
# pass in formula to facet_warp()
# each reading and class gets its own graph plot
ggplot(data = mpg) +  geom_point(mapping = aes(x = displ, y = hwy)) +  facet_wrap(~class, nrow = 2)


ggplot(data = mpg) +  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(data = diamonds) +  stat_count(mapping = aes(x = cut))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)
