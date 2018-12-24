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
  real<lower=0> phi;
}

transformed parameters {
  vector[N] mu;
  mu = X * beta;
}

model {
  // priors
  beta ~ normal(0.0, tau);
  phi ~ cauchy(0, 10);
    
  // data model
  y ~ neg_binomial_2_log(mu, phi);
}

generated quantities{
  vector[N] lambda;
  lambda = exp(mu);
}
