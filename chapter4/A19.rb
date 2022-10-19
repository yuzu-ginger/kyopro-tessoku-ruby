# 問題A19 Knapsack1 ★3

n, ww = gets.split.map(&:to_i)
w = []
v = []
n.times do
    w1, v1 = gets.split.map(&:to_i)
    w << w1
    v << v1
end
dp = Array.new(n+1){ Array.new(ww+1, -1) }
dp[0][0] = 0
for i in 1..n
    for j in 0..ww
        if j < w[i-1]       # jよりも重いとき
            dp[i][j] = dp[i-1][j]
        else
            dp[i][j] = [dp[i-1][j], dp[i-1][j-w[i-1]] + v[i-1]].max
        end
    end
end
puts dp[n].max