# 問題A12 Printer ★3

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

ans = (0..10**9).bsearch { |x|
    sum = a.sum{|i| x / i }
    sum >= k
}
puts ans