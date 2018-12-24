data {
  int<lower=1> N;
  int<lower=0, upper=1> y[N];
  real<lower=0> alpha;
  real<lower=0> beta;
}

parameters {
  real<lower=0, upper=1> theta;
}

model {
  theta ~ beta(alpha, beta);
  y ~ bernoulli(theta);
}
