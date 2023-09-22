#23-0922 fri 09:40
# chapter 2

#
library(tidyverse)

#IQ
iq = c(98, 121, 110, 89, 109, 108, 102, 92, 131, 114)
iq |> mean()    #107
iq |> sd()      #12.8

#
library(car)

#
iq |> plot()
iq |> qplot()
iq |> hist()
iq |> density()
iq |> hist()
graphics::smoothScatter(iq)


shapiro.test(iq)
car::qqPlot(iq, dist = "norm", mean = 1, sd = 1)
qqPlot(iq, dist = "norm")

  #정규성이 아닌 경우
mpg$hwy |> qqPlot()
mpg$hwy |> plot()

#x
t.test(iq)                        #7.73e-10
iq |> as.tibble() |> t.test()     #7.73e-10


#
iq |> sort()
(n = length(iq))
(mean(iq) - 100) / 10 / length(iq)   -> z
1 - pnorm(z)  
  

#소듐-------------------------------------------------------
x = c(1200, 2300, 5800, 1100, 1200, 1700, 
      1400, 1900, 3800, 1300)
x |> sort()
qqPlot(x)
t.test(x)

x |> tibble() |> 
  ggplot(aes(x = x)) +
  geom_density(fill = "red", alpha = .1, color = "red") +
  geom_rug(length = unit(0.01, 'npc'), 
           sides = 'b', color = "red") +
  geom_vline(xintercept = mean(x), linetype = "dashed") #+
  #geom_vline(xintercept = median(x), linetype = 1) +
  #geom_vline(xintercept = 1500, linetype = 5)

  #geom_rug()는 중복x, distinct 로 표시한다

#문제는 t.test()를 잘못 구해도 p-value를 출력한다는 것

