data {
  int<lower=1> N;
  int<lower=1, upper=N> m;
  real<lower=0> alpha;
  real<lower=0> beta;
}

parameters {
  real<lower=0, upper=1> theta;
}

model {
  theta ~ beta(alpha, beta);
  m ~ binomial(N, theta);
}
