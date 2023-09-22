#23-0921 thu 13:48

#
library(tidyverse)

#
x = c(3,2, 0, 8, 12, 11, 5, -2)
n = length(x)

mean(x)
?qt()

mean(x) + c(-1,1) * qt(1-0.025, n-1) * sd(x) / sqrt(n)
qt(1-0.025,n-1)

#
# example 1.4 -------------------------------------------------------------
x = c(2.20, 2.20, 2.40, 2.40, 2.50, 2.70, 2.80, 2.90, 
      3.03, 3.03, 3.10, 3.37, 3.40, 3.40, 3.40, 3.50, 
      3.60, 3.70, 3.70, 3.70, 3.70, 3.77, 5.28, 28.50)

x |> mean()   #평균
x |> sd()     #표준편차
x |> median() #중앙값
x |> mad()    #중앙값절대편차

#
anscombe
anscombe$x1 |> mad()
anscombe$x2 |> mad()
anscombe$x3 |> mad()

## mad() 절대편차는 datasaurus도 같지 않다
library(datasauRus)
datasaurus_dozen |> plot()
datasaurus_dozen_wide |> plot()
datasaurus_dozen |> filter(dataset == "dino") |> plot()
datasaurus_dozen |> filter(dataset == "dino") -> dino
dino$x |> mean()
dino$x |> median()
dino$x |> sd()
dino$x |> mad()

datasaurus_dozen |> filter(dataset == "circle") -> circle
circle$x |> mean()
circle$x |> median()
circle$x |> sd()
circle$x |> mad()

dino$y |> sd()      #26.9
circle$y |> sd()    #26.9
dino$y |> mad()     #30.7
circle$y |> mad()   #41.7
