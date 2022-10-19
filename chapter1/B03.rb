# 問題B03 Supermarket1 ★2

n = gets.to_i
a = gets.split.map(&:to_i)
ans = false
a.combination(3).each do |i, j, k|
    if i + j + k == 1000
        ans = true
        break
    end
end
puts ans ? "Yes" : "No"