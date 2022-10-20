# 問題A20 LCS ★4

s = gets.chomp
t = gets.chomp
n = s.size
m = t.size
dp = Array.new(n+1){ Array.new(m+1, 0) }
dp[0][0] = 0
# dp[i][j] : マス(i, j)に到達するまでに通る、赤い辺の本数の最大値
for i in 0..n
    for j in 0..m
        if i >= 1 && j >= 1 && s[i-1] == t[j-1]
            dp[i][j] = [dp[i-1][j], dp[i][j-1], dp[i-1][j-1] + 1].max
        elsif i >= 1 && j >= 1
            dp[i][j] = [dp[i-1][j], dp[i][j-1]].max
        elsif i >= 1
            dp[i][j] = dp[i-1][j]
        elsif j >= 1
            dp[i][j] = dp[i][j-1]
        end
    end
end
puts dp[n][m]