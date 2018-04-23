# First, we define a nice unicode summation function
∑ = sum

# then, make an ℓ2 norm function
ℓ2(θ::Vector) = √θ'θ
ℓ2([-0.5,0,1,2,3,4,5,6])

# Let's make an ℓp norm function with methods for ints, rationals and floats
ℓp(θ::Vector, p::Int64) = ∑(abs.(θ).^p)^(1//p)
ℓp(θ::Vector, p::Rational) = ∑(abs.(θ).^p)^(1//p)
ℓp(θ::Vector, p::Float64) = ∑(abs.(θ).^p)^(1/p)

# Now let's compare their precision
𝑥 = ℓp([-0.5,0,1,2,3,4,5,6], 122/3)
𝑦 = ℓp([-0.5,0,1,2,3,4,5,6], 122//3)

# 𝑥 and 𝑦 differ on the last digit. I trust 𝑦 more because it uses rationals!
𝑥 == 𝑦
𝑥 ≈ 𝑦
