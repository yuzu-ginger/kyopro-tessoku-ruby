# 問題A17 Dungeo2 ★3

n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

# 動的計画法
dp = Array.new(n, 10**18)
dp[0] = 0
dp[1] = a[0]
for i in 2...n
    dp[i] = [a[i-1] + dp[i-1], b[i-2] + dp[i-2]].min
end

# 答えの復元
place = n - 1
ans = []
while true
    ans << place + 1
    break if place == 0
    if dp[place] == dp[place-1] + a[place-1]
        place -= 1
    else
        place -= 2
    end
end
puts ans.size
puts ans.reverse.join(" ")