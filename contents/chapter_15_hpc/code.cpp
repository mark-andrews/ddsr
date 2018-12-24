#include <Rcpp.h>
using namespace Rcpp;

//' Simple moving average of a numeric vector
//'
//'
//' @param x A numeric vector
//' @param k The window length of the moving average
//' @return A vector of the same length of x
//' @export
// [[Rcpp::export]]
NumericVector rolling_mean(NumericVector x, int k = 1) {
  
  // Declare outer loop counter
  int i;
  // Declare inner loop counter
  int j;
  // Declare vector length
  int n = x.size();
  // Declare inner loop summation variable
  double total;
  // Declare output vector
  NumericVector y(n);
  
  for (i = 0; i < n; i++) {
    if (i < k - 1){
      y[i] = NumericVector::get_na();
    } else {
      total = 0;
      for (j = 0; j < k; j++) {
        total += x[i - j];
      }
      y[i] = total/k;
    }
  }
  
  return y;
}
