# 問題B12 Equation

n = gets.to_i
ans = (1.0..10.0**7).bsearch { |x|
    x ** 3 + x >= n
}
puts ans