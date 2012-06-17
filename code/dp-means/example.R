source("dp-means.R")

data <- generate.data()

ggplot(data, aes(x = x, y = y, color = assignment)) + geom_point()

dp.means(data, 1)
dp.means(data, 10)
dp.means(data, 100)

ggplot(data, aes(x = x, y = y, color = assignment)) + geom_point()

dp.means(data, 30)

dp.results <- dp.means(data, 30)

ggplot(data, aes(x = x, y = y, color = dp.results$assignments)) + geom_point()
