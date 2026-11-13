using Test
using Motoro

@testset "Motoro.jl" begin
    include("mcdonald_ch09.jl")
    include("mcdonald_ch10.jl")
    include("mcdonald_ch11.jl")
end