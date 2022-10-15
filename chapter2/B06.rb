# 問題B06 Lottery

n = gets.to_i
a = gets.split.map(&:to_i)
b = []
a.each do |x|
    x == 0 ? b.push(1) : b.push(0)
end
win = [0]
lose = [0]
for i in 1..n
    win << win[i-1] + a[i-1]
    lose << lose[i-1] + b[i-1]
end
q = gets.to_i
q.times do
    l, r = gets.split.map(&:to_i)
    w = win[r] - win[l-1]
    l = lose[r] - lose[l-1]
    if w > l
        puts "win"
    elsif w < l
        puts "lose"
    else
        puts "draw"
    end
end