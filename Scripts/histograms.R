library(ggplot2)

source('Scripts/read_data.R')

bikes$workingday = as.factor(bikes$workingday)
g1 <- ggplot(data=bikes,  aes(bikes$temp, fill = bikes$workingday))+geom_histogram(alpha = 0.5)+
  xlab("Temperature (Celsius)")+ scale_fill_discrete(name = "Working day",labels = c("Not a working day", "Working day"))
#+  geom_density(alpha = 0.2, fill="#FF6666")

ggsave("Figures/hist_temp_workingday.png",plot=g1)

g1

bikes$season = as.factor(bikes$season)
g2 <- ggplot(data=bikes,  aes(bikes$temp, fill = bikes$season))+geom_histogram(alpha = 0.5)+
  xlab("Temperature (Celsius)")+ scale_fill_discrete(name = "Season",labels = c("Spring", "Summer", "Fall", "Winter"))


ggsave("Figures/hist_temp_season.png",plot=g2)

g2
