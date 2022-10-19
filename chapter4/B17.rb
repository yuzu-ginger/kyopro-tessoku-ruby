# 問題B17 Frog1 with Restoration ★3

n = gets.to_i
h = gets.split.map(&:to_i)

# 動的計画法
dp = Array.new(n, 10**18)
dp[0] = 0
dp[1] = (h[1] - h[0]).abs
for i in 2...n
    v1 = (h[i] - h[i-1]).abs + dp[i-1]
    v2 = (h[i] - h[i-2]).abs + dp[i-2]
    dp[i] = [v1, v2].min
end

# 答えの復元
place = n - 1
ans = []
while true
    ans << place + 1
    break if place == 0
    if dp[place] == dp[place-1] + (h[place] - h[place-1]).abs
        place -= 1
    else
        place -= 2
    end
end
puts ans.size
puts ans.reverse.join(" ") 