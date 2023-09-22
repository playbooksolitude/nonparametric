#23-0920 wedn 


#
library(tidyverse)
mpg
data()

#
rnorm(10, mean = 0, sd = 1)

#
rnorm(10000, mean = 10, sd = 2) |> 
  as.tibble() |> 
  ggplot(aes(x = value)) +
  geom_histogram(binwidth = .3, color = "white") #+
  geom_line(aes(group = 1))

cars93 #|> 
  count(ca)

library(MASS)
Cars93  |> glimpse()
Cars93 |> count(Type, MPG.city, MPG.highway) |> 
  tibble() |> 
  group_by(Type) |> 
  reframe(city_mean = MPG.city)
