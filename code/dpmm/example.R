set.seed(1)

source("code/dpmm/dpmm.R")

x <- c(rnorm(100, 100, 8), rnorm(50, 200, 25), rnorm(50, 25, 1))
labels <- c(rep("A", 100), rep("B", 50), rep("C", 50))

df <- data.frame(X = x, Label = labels)

ggplot(df, aes(x = X)) +
  geom_histogram(binwidth = 3)

ggplot(df, aes(x = X, fill = Label)) +
  geom_histogram(binwidth = 3) +
  opts(legend.position = "none") +
  opts(title = "Ground Truth Mixture Model")
ggsave("code/dpmm/dpmm_ground_truth.pdf", height = 7, width = 7)

# Gibbs sampling for the Gaussian Dirichlet process mixture model
#
# Inputs:
#  x - data (vector of length N)
#  alpha - DP concentration parameter
#  tau0 - normal-gamma prior shape
#  beta0 - normal-gamma prior rate (inverse scale)
#  kappa0 - normal-gamma prior precision scaling parameter
#  nIter - number of Gibbs iterations
#
# Outputs:
#  C, a N x nIter matrix of cluster assignments
#dpmm_gibbs <- function(x, alpha, tau0, beta0, mu0, kappa0, nIter)

nIter <- 100
results <- dpmm_gibbs(x, 0.01, 0.1, 0.1, 0, 0.1, nIter)
results[, nIter]

ggplot(df, aes(x = X, fill = factor(results[, nIter]))) +
  geom_histogram(binwidth = 3) +
  opts(legend.position = "none") +
  opts(title = "dp-MM with alpha = 0.01")
ggsave("code/dpmm/dpmm_0.01.pdf", height = 7, width = 7)

nIter <- 100
results <- dpmm_gibbs(x, 0.5, 0.1, 0.1, 0, 0.1, nIter)
results[, nIter]

ggplot(df, aes(x = X, fill = factor(results[, nIter]))) +
  geom_histogram(binwidth = 3) +
  opts(legend.position = "none") +
  opts(title = "dp-MM with alpha = 0.5")
ggsave("code/dpmm/dpmm_0.5.pdf", height = 7, width = 7)

nIter <- 100
results <- dpmm_gibbs(x, 2.5, 0.1, 0.1, 0, 0.1, nIter)
results[, nIter]

ggplot(df, aes(x = X, fill = factor(results[, nIter]))) +
  geom_histogram(binwidth = 3) +
  opts(legend.position = "none") +
  opts(title = "dp-MM with alpha = 2.5")
ggsave("code/dpmm/dpmm_2.5.pdf", height = 7, width = 7)

nIter <- 100
results <- dpmm_gibbs(x, 12.5, 0.1, 0.1, 0, 0.1, nIter)
results[, nIter]

ggplot(df, aes(x = X, fill = factor(results[, nIter]))) +
  geom_histogram(binwidth = 3) +
  opts(legend.position = "none") +
  opts(title = "dp-MM with alpha = 12.5")
ggsave("code/dpmm/dpmm_12.5.pdf", height = 7, width = 7)

nIter <- 100
results <- dpmm_gibbs(x, 100.0, 0.1, 0.1, 0, 0.1, nIter)
results[, nIter]

ggplot(df, aes(x = X, fill = factor(results[, nIter]))) +
  geom_histogram(binwidth = 3) +
  opts(legend.position = "none") +
  opts(title = "dp-MM with alpha = 100.0")
ggsave("code/dpmm/dpmm_100.0.pdf", height = 7, width = 7)
