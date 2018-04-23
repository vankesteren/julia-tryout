using Plots

X = randn(100,10)

function pca(x::Array{Float64}, components::Int64)
    s = svdfact(x)
    estimate =  s[:U][:,1:components]*
                Diagonal(s[:S][1:components])*
                s[:Vt][1:components,:]
    residual = x-estimate
    loss = vecnorm(residual)
    return Dict(:eigenvalues    => (s[:S]/size(x,1)).^2,
                :estimate       => estimate,
                :residual       => residual,
                :loss           => loss)
end

function Plots.plot(x::Dict; kwargs...)
    if (:eigenvalues in keys(x))
        plot(x[:eigenvalues]/sum(x[:eigenvalues]), label = "",
             title = "Proportion of explained variance",
             xlabel = "Component number"; kwargs...)
    else
        plot(x; kwargs...)
    end
end


p1 = plot([pca(X,i)[:loss] for i in 1:10], labels = "", size = (500,500))
xlabel!("number of components")
ylabel!("loss")
title!("Principal Components loss")

p = pca(X, 3)
p2 = plot(p, size = (500,500))


p3 = plot(p1, p2, layout = (1,2), size = (1000,500))
savefig("pca")
