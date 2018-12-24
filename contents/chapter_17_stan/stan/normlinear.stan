data {
  int<lower=0> N;
  vector[N] x;
  vector[N] y;
  
  // hyperparameters
  real<lower=0> tau;
  real<lower=0> omega;
  int<lower=0> kappa;
}

parameters {
  real beta_0;
  real beta_1;
  real<lower=0> sigma;
}

model {
  // priors
  sigma ~ student_t(kappa, 0, omega);
  beta_0 ~ normal(0, tau);
  beta_1 ~ normal(0, tau);
  // data model
  y ~ normal(beta_0 + beta_1 * x, sigma);
}
