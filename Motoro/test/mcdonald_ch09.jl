# Contains all of the non-prose exercises within McDonald Ch. 9

@testset "McDonald 9.1" begin
    # Given values
    # S = 32, K = 35, r = 0.04, δ=0.06, T=0.5, C = 2.27

    # Expected Value
    # P = 5.52

    # Call-Put Parity
    # C - P = S * exp(-δ * T) - K * exp(-r * T)

    # Rewritten to derive P would be
    # P = C - S * exp(-δ * T) + K * exp(-r * T)
    
    S, K, r, δ, T = 32.0, 35.0, 0.04, 0.06, 0.5
    call_price = 2.27
    expected_put_price = 5.52
    derived_put_price = call_price - S * exp(-δ * T) + K * exp(-r * T)

    @test isapprox(derived_put_price, expected_put_price; atol=1e-2)
 
end

@testset "McDonald 9.2" begin
    # Given values
    # S = 32, K = 30, r = 0.04, δ=0.06, T=0.5, C = 4.29, P = 2.64

    # Expected Value
    # PV(Div) ~ 31.0560

    # Call-Put Parity
    # C - P = S * exp(-δ * T) - K * exp(-r * T)

    # Rewritten to derive PV(Div) would be
    # S * exp(-δ * T) =  C - P + K * exp(-r * T)

    S, K, r, T = 32.0, 30.0, 0.04, 0.5
    call_price = 4.29
    put_price = 2.64
    expected_present_value_dividends = 31.0560
    derived_present_value_dividends = call_price - put_price + K * exp(-r * T)

    @test isapprox(derived_present_value_dividends, expected_present_value_dividends; atol=1e-4)
  
end

@testset "McDonald 9.3c" begin
    # Given values
    # S = 800, K = 815, r = 0.05, δ=0.00, T=1, C = 75, P = 45
    # With no dividend, take spot price directly

    # Expected Value
    # S - K * exp(-r * T) = 24.7480

    # Call-Put Parity 
    # Solve for C - P in no arbitrage where C - P = S - K * exp(-r * T)

    S, K, r, T = 800.0, 815.0, 0.05, 1
    expected_no_arb_call_put_parity = 24.7480
    derived_no_arb_call_put_parity = S - K * exp(-r * T)

    @test isapprox(derived_no_arb_call_put_parity, expected_no_arb_call_put_parity; atol=1e-4)
  
end

@testset "McDonald 9.3d" begin
    # Given values
    # S = 800, K₁ = 780, K₂ = 800, K₃ = 820, K₄ = 840, r = 0.05, δ=0.00, T=1, C = 75, P = 45
    # With no dividend, take spot price directly

    # Expected Values
    # S - K₁ * exp(-r * T) = 58.0410
    # S - K₂ * exp(-r * T) = 39.0165
    # S - K₃ * exp(-r * T) = 19.9919
    # S - K₄ * exp(-r * T) = 0.9673

    # Call-Put Parity 
    # Solve for C - P in no arbitrage where C - P = S - K * exp(-r * T)
    K₁, K₂, K₃, K₄ = 780, 800, 820, 840
    S, r, T = 800.0, 0.05, 1
    expected_no_arb_call_put_parity₁ = 58.0410
    expected_no_arb_call_put_parity₂ = 39.0165
    expected_no_arb_call_put_parity₃ = 19.9919
    expected_no_arb_call_put_parity₄ = 0.9673
    derived_no_arb_call_put_parity₁ = S - K₁ * exp(-r * T)
    derived_no_arb_call_put_parity₂ = S - K₂ * exp(-r * T)
    derived_no_arb_call_put_parity₃ = S - K₃ * exp(-r * T)
    derived_no_arb_call_put_parity₄ = S - K₄ * exp(-r * T)

    @test isapprox(derived_no_arb_call_put_parity₁, expected_no_arb_call_put_parity₁; atol=1e-4)
    @test isapprox(derived_no_arb_call_put_parity₂, expected_no_arb_call_put_parity₂; atol=1e-4)
    @test isapprox(derived_no_arb_call_put_parity₃, expected_no_arb_call_put_parity₃; atol=1e-4)
    @test isapprox(derived_no_arb_call_put_parity₄, expected_no_arb_call_put_parity₄; atol=1e-4)
  
end

@testset "McDonald 9.4" begin
    # Given values
    # x = 0.95, K = 0.93, r = 0.06, r_f = 0.04, T=1, C = 0.0571

    # Expected Value
    # P = 0.0202

    # Call-Put Parity
    # C - P = x * exp(-r_f * T) - K * exp(-r * T)

    # Rewritten to derive P would be
    # P = C - x * exp(-r_f * T) + K * exp(-r * T)

    x, K, r, r_f, T = 0.95, 0.93, 0.06, 0.04, 1
    call_price = 0.0571
    expected_put_price = 0.0202
    derived_put_price = call_price - x * exp(-r_f * T) + K * exp(-r * T)

    @test isapprox(derived_put_price, expected_put_price; atol=1e-4)
  
end

@testset "McDonald 9.6a" begin
    # Given values
    # K = 0.90, r = 0.05, T=0.5, C = 0.0404, P = 0.0141

    # Expected Value
    # FV = 0.9270

    # Futures Contract
    # exp(-r * T) * FV = C - P + K * exp(-r * T)
    
    # Rewritten to derive P would be
    # FV = (C - P) / exp(-r * T) + K

    K, r, T = 0.90, 0.05, 0.5
    call_price = 0.0404
    put_price = 0.0141
    expected_future_value = 0.9270
    derived_future_value = (call_price - put_price) / exp(-r * T) + K

    @test isapprox(derived_future_value, expected_future_value; atol=1e-4)
  
end

@testset "McDonald 9.6b" begin
    # Given values
    # K = 0.90, r = 0.05, r_f = 0.035, T=0.5, C = 0.0404, P = 0.0141

    # Expected Value
    # x = 0.9045

    # Call-Put Parity
    # C - P = x * exp(-r_f * T) - K * exp(-r * T)

    # Rewritten to derive x
    # x = (C - P) / exp(-r_f * T) + K * exp(-r * T)

    K, r, r_f, T = 0.90, 0.05, 0.035, 0.5
    call_price = 0.0404
    put_price = 0.0141
    expected_exchange_rate = 0.9045
    derived_exchange_rate = (call_price - put_price) / exp(-r_f * T) + K * exp(-r * T)

    @test isapprox(derived_exchange_rate, expected_exchange_rate; atol=1e-4)
    
end

@testset "McDonald 9.7a" begin
    # Given values
    # x = 0.009, K = 0.009, r = 0.05, r_f = 0.01, T=1, C = 0.0006

    # Expected Value
    # P = 0.0003

    # Call-Put Parity
    # C - P = x * exp(-r_f * T) - K * exp(-r * T)

    # Rewritten to derive x
    # P = C - x * exp(-r_f * T) + K * exp(-r * T)

    x, K, r, r_f, T = 0.009, 0.009, 0.05, 0.01, 1
    call_price = 0.0006
    expected_put_price = 0.0003
    derived_put_price = call_price - x * exp(-r_f * T) + K * exp(-r * T)

    @test isapprox(derived_put_price, expected_put_price; atol=1e-4)
    
end

@testset "McDonald 9.8" begin
    # Given values
    # K₁ = 50, K₂ = 55, C₁ = 9, C₂ = 10, P₁ = 7, P₂ = 6

    # Expected No-Arbitrage Expressions to Fail
    # C₁ >= C₂, where K₁ < K₂
    # P₁ <= P₂, where K₁ < K₂

    x, K, r, r_f, T = 0.009, 0.009, 0.05, 0.01, 1
    call_price₁ = 9
    call_price₂ = 10
    put_price₁ = 7
    put_price₂ = 6

    # Test No-Arbitrage Expressions Fail

    @test !(call_price₁ >= call_price₂)
    @test !(put_price₁ <= put_price₂)
    
end