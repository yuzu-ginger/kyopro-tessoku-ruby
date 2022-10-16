# 問題A18 Subset Sum ★3

n, s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
dp = Array.new(n+1){ Array.new(s+1, false) }
dp[0][0] = true
for i in 1..n
    for j in 0..s
        # dp[i-1][j] -> dp[i][j] : カードa[i-1]を選ばない(方法A)
        # dp[i-1][j-a[i-1]] -> dp[i][j] : カードa[i-1]を選ぶ(方法B)
        if j < a[i-1]
            dp[i-1][j] ? dp[i][j] = true : dp[i][j] = false
        else
            dp[i-1][j] || dp[i-1][j-a[i-1]] ? dp[i][j] = true : dp[i][j] = false
        end
    end
end
puts dp[n][s] ? "Yes" : "No"