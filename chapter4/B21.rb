# 問題B21 Longest Subpalindrome ★6

n = gets.to_i
s = gets.chomp

dp = Array.new(n){ Array.new(n, 0) }
# dp[i][j]:l文字目からr文字目までの最長の回文の長さ

# 初期化
(0...n).each {|i| dp[i][i] = 1}
for i in 0...n - 1
    if s[i] == s[i+1]
        dp[i][i+1] = 2
    else
        dp[i][i+1] = 1
    end
end

# 状態遷移
for len in 2...n
    for l in 0...(n - len)
        r = l + len
        if s[l] == s[r]
            dp[l][r] = [dp[l][r-1], dp[l+1][r], dp[l+1][r-1] + 2].max
        else
            dp[l][r] = [dp[l][r-1], dp[l+1][r]].max
        end
    end
end

puts dp[0][n-1]