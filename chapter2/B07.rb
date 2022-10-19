# 問題B07 Convernience Store2 ★3

t = gets.to_i
n = gets.to_i
b = Array.new(t+1, 0)
n.times do
    l, r = gets.split.map(&:to_i)
    b[l] += 1
    b[r] -= 1
end
ans = [0]
for i in 1..t
    ans[i] = ans[i-1] + b[i-1]
end
puts ans[1..-1]