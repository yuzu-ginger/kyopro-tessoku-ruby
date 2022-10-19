# 問題B16 Frog1 ★2

n = gets.to_i
h = gets.split.map(&:to_i)
dp = Array.new(n, 10**18)
dp[0] = 0
dp[1] = (h[1] - h[0]).abs
for i in 2...n
    v1 = (h[i] - h[i-1]).abs + dp[i-1]
    v2 = (h[i] - h[i-2]).abs + dp[i-2]
    dp[i] = [v1, v2].min
end
puts dp[n-1]