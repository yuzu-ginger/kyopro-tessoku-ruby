# 問題B14 Another Subset Sum ★5

n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

half = n / 2
p = []   # 前半のカード
q = []   # 後半のカード
[0, 1].repeated_permutation(half).each do |bit|
    sum = 0
    bit.size.times do |i|
        sum += a[i] if bit[i] == 1
    end
    p << sum
end
[0, 1].repeated_permutation((n+1)/2).each do |bit|
    sum = 0
    bit.size.times do |i|
        sum += a[i+half] if bit[i] == 1
    end
    q << sum
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