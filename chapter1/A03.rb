# 問題A03 Two Cards ★1

n, k = gets.split.map(&:to_i)
p = gets.split.map(&:to_i)
q = gets.split.map(&:to_i)
ans = false
p.each do |x|
    q.each do |y|
        if x + y == k
            ans = true
            break
        end
    end
end
puts ans ? "Yes" : "No"