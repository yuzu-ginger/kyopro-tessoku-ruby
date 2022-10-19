# 問題A16 Dungeon1 ★2

n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
dp = Array.new(n, 10**18)
dp[0] = 0
dp[1] = a[0]
for i in 2...n
    dp[i] = [a[i-1] + dp[i-1], b[i-2] + dp[i-2]].min
end
puts dp[n-1]