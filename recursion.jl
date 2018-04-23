timestwo(a) = (a ≈ 0) ? 0 : a+timestwo(a/2)

timestwo(1234.12341)

using Plots

gr()
plot(2.^(1./(1:200)),[((i*2 - timestwo(i))^2)/i for i in 2.^(1./(1:200))],
     label = "", size = (1000, 500))
ylabel!("Percentage error")
xlabel!("x")
title!(string("Error of recursive timestwo as fractions become small"))
xflip!()
savefig("timestwo-recursive")
