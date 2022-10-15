# 問題A10 Resort Hotel ★4

n = gets.to_i
a = gets.split.map(&:to_i)
d = gets.to_i
l = []
r = []
d.times do
    x, y = gets.split.map(&:to_i)
    l << x
    r << y
end

# 累積和
p = Array.new(n+1, 0)
q = Array.new(n+1, 0)
p[0] = a[0]
q[-1] = a[-1]
(1..n).each do |i|
    p[i] = [p[i-1], a[i-1]].max
end
(n-1).downto(1) do |i|
    q[i] = [q[i+1], a[i-1]].max
end

d.times do |i|
    puts [p[l[i]-1], q[r[i]+1]].max
end