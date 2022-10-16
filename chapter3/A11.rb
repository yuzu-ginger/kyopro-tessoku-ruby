# 問題A11 Binary Search1 ★2

n, x = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
puts a.bsearch_index{|i| i >= x} + 1