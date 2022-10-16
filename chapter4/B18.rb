# 問題B18 Subset Sum with Restoration

n, s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 動的計画法
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
if !dp[n][s]   # 方法が存在しない場合
    puts -1
    exit
end

# 答えの復元
ans = []
place = n
sum = s
while true
    if sum >= a[place-1]
        if dp[place-1][sum-a[place-1]]
            ans << place
            sum -= a[place-1]
        end
    end
    break if place == 0
    place -= 1
end
puts ans.size
puts ans.reverse.join(" ")