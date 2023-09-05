using RDatasets

capm = dataset("Ecdat", "capm")

Y = capm.RFood.-capm.RF

X1 = capm.RMRF.-capm.RF

X0 = ones(size(X1,1))

X = [X0 X1]

beta_ols = (X'*X)\X'*Y

println(beta_ols)

sigma_ols = (Y-X*beta_ols)'*(Y-X*beta_ols)/(size(X1,1)-2)

var_beta = sigma_ols*inv(X'*X)

std_int = sqrt(var_beta[1,1])
println(std_int)

std_beta = sqrt(var_beta[2,2])
println(std_beta)