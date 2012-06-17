data <- read.csv("output.tsv", sep = "\t")
names(data) <- c('x', 'y', 'assignment', 'lambda')

ggplot(subset(data, lambda == 1.0),
       aes(x = x, y = y, color = factor(assignment))) +
  geom_point() +
  opts(legend.position = "none") +
  opts(title = "Lambda = 1.0")

ggplot(subset(data, lambda == 10.0),
       aes(x = x, y = y, color = factor(assignment))) +
  geom_point() +
  opts(legend.position = "none") +
  opts(title = "Lambda = 10.0")

ggplot(subset(data, lambda == 50.0),
       aes(x = x, y = y, color = factor(assignment))) +
  geom_point() +
  opts(legend.position = "none") +
  opts(title = "Lambda = 50.0")
  
ggplot(subset(data, lambda == 100.0),
       aes(x = x, y = y, color = factor(assignment))) +
  geom_point() +
  opts(legend.position = "none") +
  opts(title = "Lambda = 100.0")
