# 問題B11 Binary Search2 ★3

class Array
    def count_lt(x)     # x未満の個数
        num = self.bsearch_index{|i| i >= x} || self.size
        return [num, 0].max
    end
end

n = gets.to_i
a = gets.split.map(&:to_i).sort
q = gets.to_i
x = q.times.map{ gets.to_i }
x.each do |i|
    puts a.count_lt(i)
end