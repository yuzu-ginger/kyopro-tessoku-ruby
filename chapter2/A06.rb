# 問題A06 How Many Guests? ★2

n, q = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
acc = Array.new(n+1)
acc[0] = 0
for i in 1..n
    acc[i] = acc[i-1] + a[i-1]
end
q.times do
    l, r = gets.split.map(&:to_i)
    puts acc[r] - acc[l-1]
end