---

# Bayesian Nonparametrics

### An Introduction using R

### John Myles White

---

### Overview

* Why use nonparametric statistics?

---

### Overview

* Why use nonparametric statistics?
* Why use Bayesian statistics?

---

### Overview

* Why use nonparametric statistics?
* Why use Bayesian statistics?
* Why use Bayesian nonparametrics?

---

### Overview

* Why use nonparametric statistics?
* Why use Bayesian statistics?
* Why use Bayesian nonparametrics?
* Two example uses of Bayesian nonparametrics

---

### What is Statistics?

* Statistics is a mathematical theory that tells us how we _should_ learn about the structure of the world around us based on our experiences

---

### What is Statistics?

* Statistics is a mathematical theory that tells us how we _should_ learn about the structure of the world around us based on our experiences
* Statistical theory decides which methods are _good_ and which are _bad_ by inventing a theoretical world in which we can precisely measure how well we are learning from our experiences

---

### What is Statistics?

* Statistics is a mathematical theory that tells us how we _should_ learn about the structure of the world around us based on our experiences
* Statistical theory decides which methods are _good_ and which are _bad_ by inventing a theoretical world in which we can precisely measure how well we are learning from our experiences
* The practical value of statistical theory depends upon the match between the structure of this theoretical world and the real world

---

### What is Statistics?

* Statistics is a mathematical theory that tells us how we _should_ learn about the structure of the world around us based on our experiences
* Statistical theory decides which methods are _good_ and which are _bad_ by inventing a theoretical world in which we can precisely measure how well we are learning from our experiences
* The practical value of statistical theory depends upon the match between the structure of this theoretical world and the real world
* But we need powerful models if we want to describe the complex structures that actually occur in the real world

---

### What is Nonparametric Statistics?

* Nonparametric statistical models try to pull out the structure of the world from data, rather than push the structure of our theories onto data

---

### What is Nonparametric Statistics?

* Nonparametric statistical models try to pull out the structure of the world from data, rather than push the structure of our theories onto data
* Nonparametric statistical models "let the data speak" by employing highly flexible functional forms

---

### What is Nonparametric Statistics?

* Nonparametric statistical models try to pull out the structure of the world from data, rather than push the structure of our theories onto data
* Nonparametric statistical models "let the data speak" by employing highly flexible functional forms
* Nonparametric statistical models typically have infinitely many parameters

---

### What is Nonparametric Statistics?

* Nonparametric statistical models try to pull out the structure of the world from data, rather than push the structure of our theories onto data
* Nonparametric statistical models "let the data speak" by employing highly flexible functional forms
* Nonparametric statistical models typically have infinitely many parameters
* But only a finite number of parameters are used when analyzing any specific data set

---

### Nonparametric Density Estimation

* Many data sets don't look like out-of-the-box statistical distributions:

![Marathon-Times](examples/marathon/men_hours.pdf)

---

### Nonparametric Density Estimation

* We want to estimate the true distribution of runners' times from this bimodal sample of data
* We have two standard nonparametric density estimation tools:
  * Histograms
  * Kernel Density Estimators (KDE's)

---

### Histograms are a Nonparametric Method

    ggplot(subset(df, SampleSize == "100"),
           aes(x = X, fill = SampleSize, color = SampleSize)) +
      geom_histogram() +
      geom_line(data = true.density, aes(x = X, y = 100 * Y)) +
      opts(title = "Density Estimation with Histograms and 100 Data Points")
    ggsave("talk/examples/density_estimation/histogram_100.pdf",
           height = 7,
           width = 7)

---

### Histograms are a Nonparametric Method

* If you have infinite data, a histogram will converge on the true distribution

![Histogram100](examples/density_estimation/histogram_100.pdf)

---

### Histograms are a Nonparametric Method

* If you have infinite data, a histogram will converge on the true distribution

![Histogram1000](examples/density_estimation/histogram_1000.pdf)

---

### Histograms are a Nonparametric Method

* If you have infinite data, a histogram will converge on the true distribution

![Histogram10000](examples/density_estimation/histogram_10000.pdf)

---

### Histograms are a Nonparametric Method

* If you have infinite data, a histogram will converge on the true distribution

![Histogram50000](examples/density_estimation/histogram_50000.pdf)

---

### KDE's are a Nonparametric Method

    ggplot(subset(df, SampleSize == "100"),
           aes(x = X, fill = SampleSize, color = SampleSize)) +
      geom_density() +
      geom_line(data = true.density, aes(x = X, y = Y)) +
      opts(title = "Density Estimation with Histograms and 100 Data Points")
    ggsave("talk/examples/density_estimation/density_100.pdf",
           height = 7,
           width = 7)

---

### KDE's are a Nonparametric Method

* If you have infinite data, a KDE will converge on the true distribution

![Density100](examples/density_estimation/density_100.pdf)

---

### KDE's are a Nonparametric Method

* If you have infinite data, a KDE will converge on the true distribution

![Density1000](examples/density_estimation/density_1000.pdf)

---

### KDE's are a Nonparametric Method

* If you have infinite data, a KDE will converge on the true distribution

![Density10000](examples/density_estimation/density_10000.pdf)

---

### KDE's are a Nonparametric Method

* If you have infinite data, a KDE will converge on the true distribution

![Density50000](examples/density_estimation/density_50000.pdf)

---

### KDE's > Histograms

* KDE's converge on the true distribution faster than histograms

\[
O(n^{-\frac{4}{5}}) < O(n^{-\frac{2}{3}})
\]

---

### Nonparametric Regression

* Many data sets have relationships between variables that don't look like straight lines
* We need regression models that are more expressive than linear regression

![Weather](examples/weather/weather_points.pdf)

---

### Nonparametric Regression

* We have several standard nonparametric regression tools:
  * Loess
  * Generalized Additive Models (GAM's)
  * k-Nearest Neighbors Regression (kNN)


---

### Loess is a Nonparametric Method

    ggplot(df, aes(x = DayOfYear, y = Precipitation)) +
      geom_point() +
      geom_smooth(method = "loess") +
      xlab("Day of Year") +
      ylab("Probability of Precipitation") +
      opts(title = "Chance of Rain in Seattle over the Course of the Year")
    ggsave("examples/weather/weather_loess.pdf",
           height = 7,
           width = 7)

---

### Loess is a Nonparametric Method

* If you have infinite data, loess may converge on the true distribution

![Weather](examples/weather/weather_loess.pdf)

---

### What is Bayesian Statistics?

* Bayesian statistical models are enriched by prior knowledge
  * Prior knowledge can be viewed as regularization

---

### What is Bayesian Statistics?

* Bayesian statistical models are enriched by prior knowledge
  * Prior knowledge can be viewed as regularization
* Knowledge gained from experience is quantified using probability theory:
  * Inferences are distributions
  * Not point estimates
  * Not interval estimates

---
  
### Why Use Bayesian Statistics?

* Three points in its favor:
  * Universally applicable

---
  
### Why Use Bayesian Statistics?

* Three points in its favor:
  * Universally applicable
  * Often more effective than maximum likelihood methods

---
  
### Why Use Bayesian Statistics?

* Three points in its favor:
  * Universally applicable
  * Often more effective than maximum likelihood methods
  * Increasingly easy to apply to arbitrary problems in data analysis

---

### Why Not Use Bayesian Statistics?

* Five points against it:
  * Can still be hard to apply to some problems

---

### Why Not Use Bayesian Statistics?

* Five points against it:
  * Can still be hard to apply to some problems
  * Requires greater grasp of statistical theory to apply to new problems

---

### Why Not Use Bayesian Statistics?

* Five points against it:
  * Can still be hard to apply to some problems
  * Requires greater grasp of statistical theory to apply to new problems
  * Rarely implemented in out-of-the-box software

---

### Why Not Use Bayesian Statistics?

* Five points against it:
  * Can still be hard to apply to some problems
  * Requires greater grasp of statistical theory to apply to new problems
  * Rarely implemented in out-of-the-box software
  * Inaccurate prior knowledge can produce worse inferences than starting from scratch

---

### Why Not Use Bayesian Statistics?

* Five points against it:
  * Can still be hard to apply to some problems
  * Requires greater grasp of statistical theory to apply to new problems
  * Rarely implemented in out-of-the-box software
  * Inaccurate prior knowledge can produce worse inferences than starting from scratch
  * Can be very slow

---

### What is Bayesian Nonparametrics?
* We want to use prior knowledge while estimating flexible functional forms

---

### What is Bayesian Nonparametrics?
* We want to use prior knowledge while estimating flexible functional forms
* Like frequentist methods, standard Bayesian models are parametric

---

### What is Bayesian Nonparametrics?
* We want to use prior knowledge while estimating flexible functional forms
* Like frequentist methods, standard Bayesian models are parametric
* Bayesian nonparametrics exploit a family of flexible distributions that encode prior knowledge

---

### What is Bayesian Nonparametrics?
* We want to use prior knowledge while estimating flexible functional forms
* Like frequentist methods, standard Bayesian models are parametric
* Bayesian nonparametrics exploit a family of flexible distributions that encode prior knowledge
* The method has the capacity to use infinitely many parameters

---

### What is Bayesian Nonparametrics?
* We want to use prior knowledge while estimating flexible functional forms
* Like frequentist methods, standard Bayesian models are parametric
* Bayesian nonparametrics exploit a family of flexible distributions that encode prior knowledge
* The method has the capacity to use infinitely many parameters
* But prior knowledge encourages the use of a small number of parameters

---

### What is Bayesian Nonparametrics?

* Many statistical models require the _a priori_ selection of integer parameters:
  * _k_: Number of clusters in _k_-means
  * _k_: Number of factors in factor analysis

---

### What is Bayesian Nonparametrics?

* Many statistical models require the _a priori_ selection of integer parameters:
  * _k_: Number of clusters in _k_-means
  * _k_: Number of factors in factor analysis
* Bayesian nonparametric methods use priors that allow us to infer these numbers from data

---

### What is Bayesian Nonparametrics?

* Many statistical models require the _a priori_ selection of integer parameters:
  * _k_: Number of clusters in _k_-means
  * _k_: Number of factors in factor analysis
* Bayesian nonparametric methods use priors that allow us to infer these numbers from data
* Prior information is still required, but data can influence the results -- unlike hardcoded parameters in traditional models

---

### Core Tools in Bayesian Nonparametrics

* Dirichlet Process
  * Distribution over distributions

---

### Core Tools in Bayesian Nonparametrics

* Dirichlet Process
  * Distribution over distributions
* Chinese Restaurant Process
  * Distribution over category assignments

---

### Core Tools in Bayesian Nonparametrics

* Dirichlet Process
  * Distribution over distributions
* Chinese Restaurant Process
  * Distribution over category assignments
* Indian Buffet Process
  * Distribution over active factors

---

### Chinese Restaurant Process

![CRP](images/CRP.jpg)

---

### Indian Buffet Process

![IBP](images/IBP.jpg)

---

### CRP vs. IBP Draws

![CRPvsIBP](images/IBP-CRP-Draws.jpg)

---

### Two Examples of Bayesian Nonparametrics

* dp-Means: An easily implemented and fully automatic infinite cluster mixture model that borrows ideas from Bayesian nonparametrics

---

### Two Examples of Bayesian Nonparametrics

* dp-Means: An easily implemented and fully automatic infinite cluster mixture model that borrows ideas from Bayesian nonparametrics
* dp-MM: A more flexible infinite cluster Gaussian Mixture model using a Dirichlet Process prior

---

### dp-Means

* The dp-Means algorithm is an analogue to k-means

---

### dp-Means

* The dp-Means algorithm is an analogue to k-means
* It always converges and always reaches the same solution

---

### dp-Means

* The dp-Means algorithm is an analogue to k-means
* It always converges and always reaches the same solution
* It has one parameter: \(\lambda\)

---

### dp-Means

* The dp-Means algorithm is an analogue to k-means
* It always converges and always reaches the same solution
* It has one parameter: \(\lambda\)
* If a point is further from the current clusters by more than \(\lambda\), it gets its own cluster

---

### dp-Means

    library("ggplot2")
    
    source("dp-means.R")
    
    data <- generate.data()
    
    ggplot(data, aes(x = x, y = y, color = assignment)) +
      geom_point()
    
    dp.results <- dp.means(data, 30)
    
    ggplot(data, aes(x = x, y = y, color = dp.results$assignments)) +
      geom_point()

---

### dp-Means

![dp-Means_0](../code/dp-means/0_dp-means.pdf)

---

### dp-Means

![dp-Means_1](../code/dp-means/1_dp-means.pdf)

---

### dp-Means

![dp-Means_10](../code/dp-means/10_dp-means.pdf)

---

### dp-Means

![dp-Means_50](../code/dp-means/50_dp-means.pdf)

---

### dp-Means

![dp-Means_100](../code/dp-means/100_dp-means.pdf)

---

### dp-Means

![dp-Means_125](../code/dp-means/125_dp-means.pdf)

---

### dp-Means

![dp-Means_200](../code/dp-means/200_dp-means.pdf)

---

### dp-Means

* dp-Means is as useful as k-means, but it is not a proper Bayesian method

---

### dp-Means

* dp-Means is as useful as k-means, but it is not a proper Bayesian method
* It cannot be used for online inference

---

### dp-Means

* dp-Means is as useful as k-means, but it is not a proper Bayesian method
* It cannot be used for online inference
* It cannot measure the uncertainty in its parameters

---

### dp-MM

* Proper Bayesian method

---

### dp-MM

* Proper Bayesian method
* More flexible mixture modeling

---

### dp-MM

* Proper Bayesian method
* More flexible mixture modeling
* Infinitely many clusters

---

### dp-MM

* Proper Bayesian method
* More flexible mixture modeling
* Infinitely many clusters
* Clusters can have different variances

---

### dp-MM

* Proper Bayesian method
* More flexible mixture modeling
* Infinitely many clusters
* Clusters can have different variances
* But there's no simple inference procedure

---

### dp-MM

* Proper Bayesian method
* More flexible mixture modeling
* Infinitely many clusters
* Clusters can have different variances
* But there's no simple inference procedure
* Use MCMC

---

### dp-MM

    nIter <- 100
    results <- dpmm_gibbs(x, 0.01, 0.1, 0.1, 0, 0.1, nIter)

    ggplot(df, aes(x = X, fill = factor(results[, nIter]))) +
      geom_histogram(binwidth = 3) +
      opts(legend.position = "none") +
      opts(title = "dp-MM with alpha = 0.01")
    ggsave("code/dpmm/dpmm_0.01.pdf", height = 7, width = 7)

---

### dp-MM

![dpMM_0.5](../code/dpmm/dpmm_0.5.pdf)

---

### dp-MM

![dpMM_2.5](../code/dpmm/dpmm_2.5.pdf)

---

### dp-MM

![dpMM_12.5](../code/dpmm/dpmm_12.5.pdf)

---

### dp-MM

![dpMM_100.0](../code/dpmm/dpmm_100.0.pdf)

---

### The Near Future of Bayesian Nonparametrics

* Variational inference

---

### The Near Future of Bayesian Nonparametrics

* Variational inference
* Stochastic variational inference

---

### The Near Future of Bayesian Nonparametrics

* Variational inference
* Stochastic variational inference
* Applying Bayesian nonparametrics to huge, streaming data sets

---

### References

* [Bayesian Nonparametrics Tutorial](http://www.cs.princeton.edu/~blei/papers/GershmanBlei2012.pdf)
* [dp-Means ArXiv Paper](http://arxiv.org/pdf/1111.0352.pdf)
* [Chinese Restaurant Process](http://www.cs.princeton.edu/courses/archive/fall07/cos597C/scribe/20070921.pdf)
* [Indian Buffet Process](http://jmlr.csail.mit.edu/papers/volume12/griffiths11a/griffiths11a.pdf)
* [Stochastic Variational Inference](http://arxiv.org/pdf/1206.7051v1.pdf)
