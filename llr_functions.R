make_predictor_matrix = function(x) {
  mat <- cbind(1,x)
  return(mat)
}

make_weight_matrix = function(x, z, omega){
  W_z <- diag(abs(z-x)/omega)
  return(W_z)
}

make_weight_vector = function(x, z, omega){
  weights <- abs(z-x)/omega
  return(weights)
}

compute_f_hat = function(z, x, y, omega) {
  Wz = make_weight_vector(x, z, omega)
  X = make_predictor_matrix(x)
  WX = apply(X, 2, function(col) col * Wz)
  Wy = Wz * y
  
  f_hat = c(1, z) %*% solve(t(X) %*% WX) %*% t(X) %*%  Wy
  return(f_hat)
}


llr = function(x, y, z, omega) {
  fits = sapply(z, compute_f_hat, x, y, omega)
  return(fits)
}


