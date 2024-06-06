## ggplots2
library(tidyverse)

## first plot 
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) + 
  geom_point(size = 1.5, col = "salmon") + 
  geom_smooth() + 
  geom_rug()

## shorthen the code 
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point()


ggplot(mtcars, aes(hp)) + 
  geom_histogram(bins = 10, fill = "sandybrown")

## assign base layer to object

e <- ggplot(mtcars, aes(hp))

e + geom_boxplot()

## box plot by groups 
data("diamonds")
diamonds %>% 
  count(cut)
## fill variable in variable
ggplot(diamonds, aes(cut, fill = color)) + 
  geom_bar( position = "dodge") # dodge / fill

### Scatter plot
ggplot(diamonds, aes(carat, price)) + 
  geom_point() + 
  geom_line()

## get sample from population
set.seed(45)
diamonds_sam <- sample_n(diamonds, 5000)

ggplot(diamonds_sam, aes(carat, price)) +
  geom_point() + 
  geom_smooth(col = "sandybrown") +
  facet_wrap(~color, nrow = 4) +
  theme_minimal() + ## change background color
  labs(title = "Relationship between Carat and Price by color", 
       x = "Carat",
       y = "Price in USD",
       caption = "Source: Diamonds dataset from ggplots2")





ggplot(diamonds_sam, aes(carat, price, col = color)) +
  geom_point(size = 1.5, alpha = 0.5) + 
  facet_wrap(~cut, nrow = 4) +
  theme_minimal() + 
  labs (title = "Relationship between Carat and Price by color and cut")

