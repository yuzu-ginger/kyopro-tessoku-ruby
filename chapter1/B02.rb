# 問題B02 Divisor Check ★1

a, b = gets.split.map(&:to_i)
ans = false
(a..b).each do |i|
    if 100 % i == 0
        ans = true
        break
    end
end
puts ans ? "Yes" : "No"