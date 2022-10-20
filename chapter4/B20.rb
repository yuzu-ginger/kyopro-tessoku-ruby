# 問題B20 Edit Distance ★20

s = gets.chomp
t = gets.chomp
start = Time.now
n = s.size
m = t.size
dp = Array.new(n+1){ Array.new(m+1, 0) }
# dp[i][j]:文字列Sのi文字目、文字列Tのj文字目まで並べたとき、その時点での合計コストの最小値はいくつか
dp[0][0] = 0
for i in 0..n
    for j in 0..m
        if i >= 1 && j >= 1 && s[i-1] == t[j-1]
            dp[i][j] = [dp[i-1][j] + 1, dp[i][j-1] + 1, dp[i-1][j-1]].min
        elsif i >= 1 && j >= 1
            dp[i][j] = [dp[i-1][j] + 1, dp[i][j-1] + 1, dp[i-1][j-1] + 1].min
        elsif i >= 1
            dp[i][j] = dp[i-1][j] + 1
        elsif j >= 1
            dp[i][j] = dp[i][j-1] + 1
        end
    end
end
puts dp[n][m]