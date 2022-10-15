# 問題B09 Papers

n = gets.to_i
paper = n.times.map{ gets.split.map(&:to_i) }

x = Array.new(1501) { Array.new(1501, 0) }
paper.each do |a, b, c, d|
    x[a][b] += 1
    x[a][d] -= 1
    x[c][b] -= 1
    x[c][d] += 1
end

# 累積和
acc = Array.new(1501) { Array.new(1501, 0) }
(1..1500).each do |i|
    (1..1500).each do |j|
        acc[i][j] = acc[i][j-1] + x[i-1][j-1]
    end
end

(1..1500).each do |j|
    (1..1500).each do |i|
        acc[i][j] = acc[i-1][j] + acc[i][j]
    end
end

ans = 0
acc.each do |x|
    ans += x.count{|i| i >= 1 }
end
puts ans