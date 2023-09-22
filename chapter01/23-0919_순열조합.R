#23-0919 tues 10:18

#
library(tidyverse)
#install.packages("gtools")
library(gtools)

#
x = c(1:10)
matrix(x, byrow = T, ncol = 2) |> glimpse() -> x1
str(x1) #|> view()

# 순열은 순서
# 순열은 순서를 지키며 배열하는 것 
permutations(n = 6, r = 2, v = 11:16) #30


#조합
combinations(n = 6, r = 2, v = 1:6)    #조합된 수를 알려줌
combinations(n = 6, r = 2, v = 11:16)  #15


#조합: 순서에 상관없이 r개의 개체를 선택하는 것
choose(n = 4, k = 2)
choose(n = 6, k = 2)  #결과값을 알려줌 #15개


# 조합
set.seed(1)
x1 = rpois(n = 3, lambda = 5)
x2 = rpois(n = 2, lambda = 5)
x.combined = c(x1, x2)

#
combinations(n = 5, r = 3, v = x.combined, set = F)


#bootstrap
sample(x.combined, size = 3, replace = F) #비복원 추출 #
sample(x.combined, size = 3, replace = T) #복원추출


#랜덤표집 반복 
#replicate
replicate(10,sample(x.combined,size = 3))
replicate(10,sample(x.combined,size = 3)) |> mean()
replicate(10,sample(x.combined,size = 3)) |> mean()


#시각화
(rnorm(100, mean = 1, sd = 1) -> x)    #rnorm 이해했다


#geom_rug() 
#tibble(x) |> print(n = Inf)
tibble(x) |> 
  ggplot(aes(x = x)) +
  geom_histogram(binwidth = .5,
                 fill = "grey", color = "white") +
  geom_rug() 


# qqPlot #정규성
car::qqPlot(x, dist = "norm", mean = 1, sd = 1)

# tibble(x) |> 
#   ggplot(aes(x = x)) +
#   geom_histogram(binwidth = .5,
#                  fill = "grey", color = "white") +
#   geom_function(fun = dnorm, args = list(mean = 1, sd = 1))


#
shapiro.test(x)


