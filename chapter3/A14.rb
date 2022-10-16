# 問題A14 Four Boxes ★5

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
d = gets.split.map(&:to_i)

p = []   # 箱Aと箱Bの組み合わせ
q = []   # 箱Cと箱Dの組み合わせ
(0...n).to_a.repeated_permutation(2).each do |x, y|
    p << a[x] + b[y]
    q << c[x] + d[y]
end

# 二分探索
q.sort!
p.each do |x|
    pos = q.bsearch{|b| b >= k - x }
    if pos == k - x
        puts "Yes"
        exit
    end
end
puts "No"