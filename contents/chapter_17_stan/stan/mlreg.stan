data {
  int<lower=0> N;
  int<lower=0> K;
  matrix[N, K+1] X;
  vector[N] y;
  
  // hyper parameters
  real<lower=0> tau;
  real<lower=0> omega;
  int<lower=0> kappa;
}

parameters {
  vector[K+1] beta;
  real<lower=0> sigma;
}

transformed parameters {
  vector[N] mu;
  mu = X * beta;
}

model {
  // priors
  beta ~ normal(0.0, tau);
  sigma ~ student_t(kappa, 0, omega);
  
  // data model
  y ~ normal(mu, sigma);
}
