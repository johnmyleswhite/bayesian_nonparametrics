f <- function(x)
{
  return((1/4) * dnorm(x, -5, 1) + (3/4) * dnorm(x, 5, 1))
}

curve(f(x), from = -10, to = 10)

sample_f <- function(n)
{
  x <- rep(NA, n)
  
  for (i in 1:n)
  {
    if (rbinom(1, 1, 0.75) == 0)
    {
      x[i] <- rnorm(1, -5, 1)
    }
    else
    {
      x[i] <- rnorm(1, 5, 1)
    }
  }
  
  return(x)
}

set.seed(1)

df1 <- data.frame(X = sample_f(100), SampleSize = factor(100))
df2 <- data.frame(X = sample_f(1000), SampleSize = factor(1000))
df3 <- data.frame(X = sample_f(10000), SampleSize = factor(10000))
df4 <- data.frame(X = sample_f(50000), SampleSize = factor(50000))
df <- rbind(df1, df2, df3, df4)

true.density <- data.frame(X = seq(min(df$X), max(df$X), by = 0.01), SampleSize = factor("Infinity"))
true.density <- transform(true.density, Y = f(X))

ggplot(subset(df, SampleSize == "100"), aes(x = X, fill = SampleSize, color = SampleSize)) +
  geom_histogram(binwidth = 1) +
  geom_line(data = true.density, aes(x = X, y = 100 * Y)) +
  opts(title = "Density Estimation with Histograms and 100 Data Points")
ggsave("talk/examples/density_estimation/histogram_100.pdf", height = 7, width = 7)

ggplot(subset(df, SampleSize == "1000"), aes(x = X, fill = SampleSize, color = SampleSize)) +
  geom_histogram(binwidth = 1) +
  geom_line(data = true.density, aes(x = X, y = 1000 * Y)) +
  opts(title = "Density Estimation with Histograms and 1000 Data Points")
ggsave("talk/examples/density_estimation/histogram_1000.pdf", height = 7, width = 7)

ggplot(subset(df, SampleSize == "10000"), aes(x = X, fill = SampleSize, color = SampleSize)) +
  geom_histogram(binwidth = 1) +
  geom_line(data = true.density, aes(x = X, y = 10000 * Y)) +
  opts(title = "Density Estimation with Histograms and 10000 Data Points")
ggsave("talk/examples/density_estimation/histogram_10000.pdf", height = 7, width = 7)

ggplot(subset(df, SampleSize == "50000"), aes(x = X, fill = SampleSize, color = SampleSize)) +
  geom_histogram(binwidth = 1) +
  geom_line(data = true.density, aes(x = X, y = 50000 * Y)) +
  opts(title = "Density Estimation with Histograms and 50000 Data Points")
ggsave("talk/examples/density_estimation/histogram_50000.pdf", height = 7, width = 7)

ggplot(subset(df, SampleSize == "100"), aes(x = X, fill = SampleSize, color = SampleSize)) +
  geom_density() +
  geom_line(data = true.density, aes(x = X, y = Y)) +
  opts(title = "Density Estimation with KDE's and 100 Data Points")
ggsave("talk/examples/density_estimation/density_100.pdf", height = 7, width = 7)

ggplot(subset(df, SampleSize == "1000"), aes(x = X, fill = SampleSize, color = SampleSize)) +
  geom_density() +
  geom_line(data = true.density, aes(x = X, y = Y)) +
  opts(title = "Density Estimation with KDE's and 1000 Data Points")
ggsave("talk/examples/density_estimation/density_1000.pdf", height = 7, width = 7)

ggplot(subset(df, SampleSize == "10000"), aes(x = X, fill = SampleSize, color = SampleSize)) +
  geom_density() +
  geom_line(data = true.density, aes(x = X, y = Y)) +
  opts(title = "Density Estimation with KDE's and 10000 Data Points")
ggsave("talk/examples/density_estimation/density_10000.pdf", height = 7, width = 7)
 
ggplot(subset(df, SampleSize == "50000"), aes(x = X, fill = SampleSize, color = SampleSize)) +
  geom_density() +
  geom_line(data = true.density, aes(x = X, y = Y)) +
  opts(title = "Density Estimation with KDE's and 50000 Data Points")
ggsave("talk/examples/density_estimation/density_50000.pdf", height = 7, width = 7)
