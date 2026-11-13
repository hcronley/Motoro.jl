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

    # No-Arbitrage Expressions to Test
    # C₁ >= C₂, where K₁ < K₂
    # P₁ <= P₂, where K₁ < K₂

    call_price₁ = 9
    call_price₂ = 10
    put_price₁ = 7
    put_price₂ = 6

    # Expect at least 1 of the No-Arbitrage Expressions Fail

    @test !(call_price₁ >= call_price₂) || !(put_price₁ <= put_price₂)
    
end

@testset "McDonald 9.9" begin
    # Given values
    # K₁ = 50, K₂ = 55, C₁ = 16, C₂ = 10, P₁ = 7, P₂ = 14

    # No-Arbitrage Expressions to Test
    # C₁ - C₂ <= K₂ - K₁
    # P₂ - P₁ <= K₂ - K₁

    K₁, K₂ = 50, 55
    call_price₁ = 16
    call_price₂ = 10
    put_price₁ = 7
    put_price₂ = 14

    # Expect at least 1 of the No-Arbitrage Expressions Fail

    @test !(call_price₁ - call_price₂ <= K₂ - K₁) || !(put_price₂ - put_price₁ <= K₂ - K₁)
    
end

@testset "McDonald 9.10" begin
    # Given values
    # K₁ = 50, K₂ = 55, K₃ = 60, C₁ = 18, C₂ = 14, C₃ = 9.5, P₁ = 7, P₂ = 10.75, P₃ = 14.45

    # No-Arbitrage Expressions to Test
    # (C₁ - C₂) / (K₂ - K₁) >= (C₂ - C₃) / (K₃ - K₂)
    # (P₂ - P₁) / (K₂ - K₁) <= (P₃ - P₂) / (K₃ - K₂)

    K₁, K₂, K₃ = 50, 55, 60
    call_price₁ = 18
    call_price₂ = 14
    call_price₃ = 9.5
    put_price₁ = 7
    put_price₂ = 10.75
    put_price₃ = 14.45

    # Expect at least 1 of the No-Arbitrage Expressions Fail

    @test !((call_price₁ - call_price₂) / (K₂ - K₁) >= (call_price₂ - call_price₃) / (K₃ - K₂)) || !((put_price₂ - put_price₁) / (K₂ - K₁) <= (put_price₃ - put_price₂) / (K₃ - K₂))
    
end

@testset "McDonald 9.11" begin
    # Given values
    # K₁ = 80, K₂ = 100, K₃ = 105, C₁ = 22, C₂ = 9, C₃ = 5, P₁ = 4, P₂ = 21, P₃ = 24.80

    # Computed Value
    # λ = (K₃ - K₂) / (K₃ - K₁) = 0.2

    # No-Arbitrage Expressions to Test
    # C₂ <= λ * C₁ + (1 - λ) * C₃
    # P₂ >= λ * P₁ + (1 - λ) * P₃

    K₁, K₂, K₃ = 80, 100, 105
    call_price₁ = 22
    call_price₂ = 9
    call_price₃ = 5
    put_price₁ = 4
    put_price₂ = 21
    put_price₃ = 24.8

    # Expect at least 1 of the No-Arbitrage Expressions Fail

    @test !((call_price₁ - call_price₂) / (K₂ - K₁) >= (call_price₂ - call_price₃) / (K₃ - K₂)) || !((put_price₂ - put_price₁) / (K₂ - K₁) <= (put_price₃ - put_price₂) / (K₃ - K₂))
    
end

@testset "McDonald 9.12a" begin
    # Given values
    # K₁ = 90, K₂ = 95, C₁ = 10, C₂ = 4

    # Computed Value
    # λ = (K₃ - K₂) / (K₃ - K₁) = 0.2

    # No-Arbitrage Expressions to Test
    # C₂ <= λ * C₁ + (1 - λ) * C₃
    # P₂ >= λ * P₁ + (1 - λ) * P₃

    K₁, K₂, K₃ = 80, 100, 105
    call_price₁ = 22
    call_price₂ = 9
    call_price₃ = 5
    put_price₁ = 4
    put_price₂ = 21
    put_price₃ = 24.8

    # Expect at least 1 of the No-Arbitrage Expressions Fail

    @test !((call_price₁ - call_price₂) / (K₂ - K₁) >= (call_price₂ - call_price₃) / (K₃ - K₂)) || !((put_price₂ - put_price₁) / (K₂ - K₁) <= (put_price₃ - put_price₂) / (K₃ - K₂))
    
end