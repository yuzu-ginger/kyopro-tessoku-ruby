# 問題A07 Event Attendance ★3

d = gets.to_i
n = gets.to_i
b = Array.new(d+1, 0)
ans = [0]
n.times do
    l, r = gets.split.map(&:to_i)
    b[l-1] += 1
    b[r] -= 1
end
for i in 1..d
    ans[i] = ans[i-1] + b[i-1]
end
puts ans[1..-1]