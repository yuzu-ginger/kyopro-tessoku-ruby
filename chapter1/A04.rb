# 問題A04 Binary Representation ★2

nn = gets.to_i
ans = []
for i in 0..9
    wari = 1 << i
    ans.unshift (n / wari) % 2
end
puts ans.join