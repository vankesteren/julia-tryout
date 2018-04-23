X = randn(100,10)
truebeta = rand(10)
y = X*truebeta+randn(100)

function LinAlg.linreg(x::Array{Float64,2}, y::Array{Float64,1})
    n, p = size(x)
    beta = [ones(n) x]\y
    return Dict(:intercept => beta[1], :beta => beta[2:(p+1)])
end

out = linreg(X, y)

out[:intercept]
out[:beta]

using Plots
plot(zeros(10), label = "", ylims = (-1, 1), size=(1000,500))
plot!((truebeta-out[:beta]), label = "")
scatter!((truebeta-out[:beta]), label = "")
title!("Bias of the beta parameters")
savefig("linreg")


# Also does ridge regression

X2 = randn(100, 200)
truebeta = rand(200) - 0.5
y2 = X2*truebeta+randn(100)
out2 = linreg(X2, y2)

plot(zeros(200), label = "", ylims = (-1, 1), size=(1000,500))
plot!((truebeta-out2[:beta]), label = "")
scatter!((truebeta-out2[:beta]), label = "")
title!("Bias of the beta parameters")
savefig("linregridge")
