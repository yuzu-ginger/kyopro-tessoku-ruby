# 問題A15 Compression ★3

n = gets.to_i
a = gets.split.map(&:to_i)
b = a.uniq.sort
ans = []
a.each do |x|
    pos = b.bsearch_index {|i| i >= x }
    ans << pos + 1
end
puts ans.join(" ")