# Data from http://www.wrcc.dri.edu/cgi-bin/cliMAIN.pl?waseat

df <- read.csv("examples/weather/weather.tsv", sep = "\t")
ggplot(df, aes(x = DayOfYear, y = Precipitation)) +
  geom_point() +
  xlab("Day of Year") +
  ylab("Probability of Precipitation") +
  opts(title = "Chance of Rain in Seattle over the Course of the Year")
ggsave("examples/weather/weather_points.pdf", height = 5, width = 5)

ggplot(df, aes(x = DayOfYear, y = Precipitation)) +
  geom_point() +
  geom_smooth(method = "loess") +
  xlab("Day of Year") +
  ylab("Probability of Precipitation") +
  opts(title = "Chance of Rain in Seattle over the Course of the Year")
ggsave("examples/weather/weather_loess.pdf", height = 5, width = 5)

# This seems to be broken.
# Skip
#library("mgcv")
#ggplot(df, aes(x = DayOfYear, y = Precipitation)) +
#  geom_point() +
#  geom_smooth(method = "gam") +
#  xlab("Day of Year") +
#  ylab("Probability of Precipitation")
