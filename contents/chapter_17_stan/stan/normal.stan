data {
  int<lower=0> N;
  real nu;
  real<lower=0> tau;
  real phi;
  real<lower=0> omega;
  int<lower=0> kappa;
  vector[N] y;
}

parameters {
  real mu;
  real<lower=0> sigma;
}

model {
  sigma ~ student_t(kappa, phi, omega);
  mu ~ normal(nu, tau);
  y ~ normal(mu, sigma);
}
