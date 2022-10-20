# 問題A21 Block Game ★4

n = gets.to_i
p = []
a = []
n.times do
    p1, a1 = gets.split.map(&:to_i)
    p << p1 - 1   # あらかじめ-1しておく
    a << a1
end

dp = Array.new(n){ Array.new(n) }
# dp[i][j]:l番目からr番目までのブロックが残っているような状態を考える
dp[0][n-1] = 0
(n-2).downto(0) do |len|
    for l in 0...(n - len)
        r = l + len
        score1, score2 = [0, 0]
        score1 = a[l-1] if l > 0 && l <= p[l-1] && p[l-1] <= r
        score2 = a[r+1] if r < n - 1 && l <= p[r+1] && p[r+1] <= r
        if l == 0
            dp[l][r] = dp[l][r+1] + score2
        elsif r == n - 1
            dp[l][r] = dp[l-1][r] + score1
        else
            dp[l][r] = [dp[l-1][r] + score1, dp[l][r+1] + score2].max
        end
    end
end

ans = 0
for i in 0...n
    ans = [dp[i][i], ans].max
end
puts ans