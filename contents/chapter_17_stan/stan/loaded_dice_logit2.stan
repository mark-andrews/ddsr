data {
  int<lower=1> N;
  int<lower=0, upper=1> y[N];
  real<lower=0> sigma;
}

parameters {
  real mu; 
}

transformed parameters {
  real<lower=0, upper=1> theta;
  theta = inv_logit(mu);
}

model {
  mu ~ normal(0, sigma);
  y ~ bernoulli(theta);
}

