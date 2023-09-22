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
# example 1.4 ----------------------------------------------
  #이상값 포함
x = c(2.20, 2.20, 2.40, 2.40, 2.50, 2.70, 2.80, 2.90, 
      3.03, 3.03, 3.10, 3.37, 3.40, 3.40, 3.40, 3.50, 
      3.60, 3.70, 3.70, 3.70, 3.70, 3.77, 5.28, 28.50)

  #이상값 제거
y = c(2.20, 2.20, 2.40, 2.40, 2.50, 2.70, 2.80, 2.90, 
      3.03, 3.03, 3.10, 3.37, 3.40, 3.40, 3.40, 3.50, 
      3.60, 3.70, 3.70, 3.70, 3.70, 3.77, 5.28)

# 4x, y의 평균, 표준편차는 크게 변하지만 
# 중앙값, 절대편차는 변하지 않는다
x |> mean()   #평균            #4.26
x |> sd()     #표준편차        #5.2
x |> median() #중앙값          #3.3
x |> mad()    #중앙값절대편차  #0.5

y |> mean()   #평균            #3.2
y |> sd()     #표준편차        #0.6
y |> median() #중앙값          #3.3
y |> mad()    #중앙값절대편차  #0.5



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



#1.5 연습문제
set.seed(001)
rnorm(100, mean = 0, sd = 1) |> qplot() + geom_rug()
rnorm(100, mean = 0, sd = 1) -> temp_100
rnorm(101, mean = 0, sd = 1) -> temp_101

  # 중앙값은 짝수일때 파생, 홀수일때 관측값
  # 짝수일 때 4분위를 구하면 1Q, 2Q, 3Q 모두 파생값
  # 홀수일 때 모두 관측값
temp_100 |> quantile(c(.25, .5, .75))
temp_101 |> quantile(c(.25, .5, .75))
temp_100 |> view()
temp_101 |> view()
temp_1 |> IQR()
temp_1 |> summary()

temp_1 |> tibble() |> 
  mutate(num = row_number(), .before = 1) -> temp_2

temp_2 |> ggplot(aes(x = num, y = temp_1)) + 
  geom_jitter(width = .1) +
  geom_boxplot(outlier.color = "red")
?geom_boxplot


#

