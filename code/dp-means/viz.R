data <- read.csv("output.tsv", sep = "\t")
names(data) <- c('x', 'y', 'assignment', 'lambda')

for (my.lambda in unique(data$lambda))
{
  p <- ggplot(subset(data, lambda == my.lambda),
         aes(x = x, y = y, color = factor(assignment))) +
    geom_point() +
    opts(legend.position = "none") +
    opts(title = paste("dp-Means Algorithm with Lambda =", my.lambda))
  ggsave(p, file = paste(my.lambda, "_dp-means.pdf", sep = ""))
  ggsave(p, file = paste(my.lambda, "_dp-means.png", sep = ""))
}
