# 問題B13 Supermarket2 ★4

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 累積和
acc = Array.new(n+1, 0)
(1..n).each do |i|
    acc[i] = acc[i-1] + a[i-1]
end

# しゃくとり法
r = []
(0...n).each do |i|
    i == 0 ? r[i] = 0 : r[i] = r[i-1]
    while r[i] < n && acc[r[i]+1] - acc[i] <= k
        r[i] += 1
    end
end

ans = 0
(0...n).each do |i|
    ans += r[i] - i
end
puts ans