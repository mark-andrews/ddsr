data {
  int<lower=0> N;
  int<lower=0> K;
  matrix[N, K+1] X;
  int<lower=0> y[N];
  
  // hyper parameters
  real<lower=0> tau;
}

parameters {
  vector[K+1] beta;
}

transformed parameters {
  vector[N] mu;
  mu = X * beta;
}

model {
  // priors
  beta ~ normal(0.0, tau);
  
  // data model
  y ~ poisson_log(mu);
}

generated quantities{
  vector[N] lambda;
  lambda = exp(mu);
}
