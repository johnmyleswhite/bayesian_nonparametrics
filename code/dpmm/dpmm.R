# Generalized t-Distribution log PDF
t_logpdf <- function(x, mu, v, df)
{
  g <- lgamma(0.5 * df + 0.5) - lgamma(0.5 * df) - log(sqrt(df * pi * v))
  return(g - 0.5 * (df + 1) * log(1 + (1 / df) * ((x - mu)^2) / v))
}

# Normalize a log probability vector without numerical underflow/overflow
normalize_logprob <- function(log.prob)
{
  # Compute the log of the normalizing constant.
  g <- log(sum(exp(log.prob - max(log.prob)))) + max(log.prob)
  
  # Find probabilities by exponentiating normalized log probabilities.
  return(exp(log.prob - g))
}

# Calculate the log likelihood for the Gaussian DP mixture model
# Mean and variance parameters marginalized under normal-gamma prior
# This corresponds to a generalized Student's t-distribution
# NB: some constant terms are ignored
dpmm_loglik <- function(xn, x, tau0, beta0, mu0, kappa0)
{
  N <- length(x)
  kappaN <- kappa0 + N
  tauN <- tau0 + N / 2
  
  if (N > 0)
  {
    # If there previous observations, use the current posterior.
    xm <- mean(x)
    betaN <- beta0 + 0.5 * sum((x - xm)^2) + (kappa0 * N *(xm - mu0)^2) / (2 * kappaN)
    muN <- (kappa0 * mu0 + N * xm) / kappaN
  }
  else
  {
    # If there are no previous observations, revert to the prior.
    betaN <- beta0
    muN <- mu0
  }
  
  return(t_logpdf(xn, muN, betaN * (kappaN + 1) / (tauN * kappaN), 2 * kappaN))
}

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
dpmm_gibbs <- function(x, alpha, tau0, beta0, mu0, kappa0, nIter)
{
  N <- length(x)
  logpost <- rep(1, 1, nIter)
  p <- rep(1, 1, N)
  C <- matrix(data = NA, nrow = N, ncol = nIter)
  c <-rep(1, 1, N)
  m <- rep(0, 1, N)
  m[1] <- N
  logprior <- rep(1, 1, N)
  loglik <- rep(1, 1, N)
  ix <- 1:N
  
  for (i in 1:nIter)
  {
    print(paste("Iteration", i))
    
    for (n in 1:N)
    {
      #all customers except n
      cn <- c[1:N!=n]
      
      #count cluster assignments
      for (k in 1:N)
      {
        m[k] <- sum(cn == k)
      }
      
      if (all(m > 0))
      {
        #active dishes
        K.active <- ix[m > 0]
      }
      else
      {
        #active dishes + 1 new dish
        K.active <- c(ix[m > 0], min(ix[m == 0]))
      }
      for (k in K.active)
      {
        if (m[k] > 0)
        {
          #prior for old dish
          logprior[k] <- log(m[k])
        }
        else
        {
          #prior for new dish
          logprior[k] <- log(alpha)
        }
        #calculate log likelihood
        loglik[k] <- dpmm_loglik(x[n], x[c==k], tau0, beta0, mu0, kappa0)
      }
      
      #posterior
      post <- normalize_logprob(logprior[K.active] + loglik[K.active])
      
      #update cluster assignment
      c[n] <- sample(K.active, 1, rep = TRUE, prob = post)
    }
    
    C[,i] = c
  }
  C
}
