# 問題A05 Three Cards ★2

n, k = gets.split.map(&:to_i)
cnt = 0
for x in 1..n
    for y in 1..n
        z = k - (x + y)
        if 1 <= z && z <= n
            cnt += 1
        end
    end
end
puts cnt