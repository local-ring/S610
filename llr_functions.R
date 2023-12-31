make_predictor_matrix = function(x) {
  mat <- cbind(1,x)
  return(mat)
}

make_weight_matrix = function(x, z, omega){
  W_z <- diag(abs(z-x)/omega)
  return(W_z)
}

compute_f_hat = function(z, x, y, omega) {
  Wz = make_weight_matrix(z, x, omega)
  X = make_predictor_matrix(x)
  f_hat = c(1, z) %*% solve(t(X) %*% Wz %*% X) %*% t(X) %*%  Wz %*% y
  return(f_hat)
}


llr = function(x, y, z, omega) {
  fits = sapply(z, compute_f_hat, x, y, omega)
  return(fits)
}


