# 問題B08 Counting Points

n = gets.to_i
point = Array.new(1501) { Array.new(1501, 0) }
n.times do
    x, y = gets.split.map(&:to_i)
    point[x-1][y-1] += 1
end
q_num = gets.to_i
q = []
q_num.times do
    a, b, c, d = gets.split.map(&:to_i)
    q << [a-1, b-1, c, d]
end

acc = Array.new(1501) { Array.new(1501, 0) }

# 横方向の累積和
(1..1500).each do |i|
    (1..1500).each do |j|
        acc[i][j] = acc[i][j-1] + point[i-1][j-1]
    end
end

# 縦方向の累積和
(1..1500).each do |j|
    (1..1500).each do |i|
        acc[i][j] = acc[i-1][j] + acc[i][j]
    end
end

q.each do |a, b, c, d|
    puts acc[c][d] + acc[a][b] - acc[a][d] - acc[c][b]
end