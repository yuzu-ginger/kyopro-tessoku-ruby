# 問題A13 Close Pairs ★4

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# しゃくとり法
r = []
(0...n).each do |i|
    i == 0 ? r[i] = 0 : r[i] = r[i-1]
    while r[i] < n-1 && a[r[i]+1] - a[i] <= k
        r[i] += 1
    end
end

ans = 0
(0...n).each do |i|
    ans += r[i] - i
end
puts ans