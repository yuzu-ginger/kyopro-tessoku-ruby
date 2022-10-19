# 問題B19 knapscak2 ★4

n, ww = gets.split.map(&:to_i)
w = []
v = []
n.times do
    w1, v1 = gets.split.map(&:to_i)
    w << w1
    v << v1
end
dp = Array.new(n+1){ Array.new(100001, 10**18) }
dp[0][0] = 0
for i in 1..n               # どの品物まで決めたか
    for j in 0..100000      # 現在の合計価値
        if j < v[i-1]       # jよりも価値が大きいとき
            dp[i][j] = dp[i-1][j]
        else
            dp[i][j] = [dp[i-1][j], dp[i-1][j-v[i-1]] + w[i-1]].min  # 重さは小さい方
        end
    end
end
puts dp[n].rindex{|x| x <= ww }