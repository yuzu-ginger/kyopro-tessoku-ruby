# 問題A08 Two Dimensional Sum ★4

h, w = gets.split.map(&:to_i)
x = h.times.map{ gets.split.map(&:to_i) }
q_num = gets.to_i
q = []
q_num.times do
    a, b, c, d = gets.split.map(&:to_i)
    q << [a-1, b-1, c, d]
end

acc = Array.new(h+1) { Array.new(w+1, 0) }

# 横方向の累積和
(1..h).each do |i|
    (1..w).each do |j|
        acc[i][j] = acc[i][j-1] + x[i-1][j-1]
    end
end

# 縦方向の累積和
(1..w).each do |j|
    (1..h).each do |i|
        acc[i][j] = acc[i-1][j] + acc[i][j]
    end
end

q.each do |a, b, c, d|
    puts acc[c][d] + acc[a][b] - acc[a][d] - acc[c][b]
end