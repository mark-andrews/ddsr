data {
  int<lower=1> N; // no. observations
  int<lower=1> J; // no. groups
  
  vector[N] y;    // outcome
  vector[N] x;    // predictor
  int<lower=0, upper=J> z[N]; // group index
}

parameters {
  vector[2] b;
  vector[2] beta[J];
  real<lower=-1, upper=1> rho;
  vector<lower=0>[2] tau;
  real<lower=0> sigma;
}

transformed parameters {
  cov_matrix[2] Sigma;
  corr_matrix[2] Omega;
  Omega[1, 1] = 1;
  Omega[1, 2] = rho;
  Omega[2, 1] = rho;
  Omega[2, 2] = 1;
  Sigma = quad_form_diag(Omega, tau); 
}

model {
  
  rho ~ uniform(-1, 1);
  tau ~ cauchy(0, 10);
  sigma ~ cauchy(0, 10);
  b ~ normal(0, 100);
  
  beta ~ multi_normal(b, Sigma);
  
  for (i in 1:N)
    y[i] ~ normal(beta[z[i], 1] + x[i] * beta[z[i], 2], sigma);
  
}
