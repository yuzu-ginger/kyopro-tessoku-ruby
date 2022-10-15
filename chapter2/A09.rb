# 問題A09 Winter in ALGO Kingdom ★4

h, w, n = gets.split.map(&:to_i)
snow = n.times.map{ gets.split.map(&:to_i) }

x = Array.new(h+1) { Array.new(w+1, 0) }
snow.each do |a, b, c, d|
    x[a-1][b-1] += 1
    x[a-1][d] -= 1
    x[c][b-1] -= 1
    x[c][d] += 1
end

# 累積和
acc = Array.new(h+1) { Array.new(w+1, 0) }
(1..h).each do |i|
    (1..w).each do |j|
        acc[i][j] = acc[i][j-1] + x[i-1][j-1]
    end
end

(1..w).each do |j|
    (1..h).each do |i|
        acc[i][j] = acc[i-1][j] + acc[i][j]
    end
end

acc[1..-1].each do |ans|
    puts ans[1..-1].join(" ")
end