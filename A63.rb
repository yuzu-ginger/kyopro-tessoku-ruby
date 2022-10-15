# 問題A63 Shortest Path1 ★3

n, m = gets.split.map(&:to_i)
g = Array.new(n) { [] }
m.times do
    a, b = gets.split.map(&:to_i)
    a -= 1
    b -= 1
    g[a] << b
    g[b] << a
end
dist = Array.new(n, -1)
dist[0] = 0
que = [0]
while !que.empty?
    pos = que.shift
    g[pos].each do |next_v|
        next if dist[next_v] != -1
        dist[next_v] = dist[pos] + 1
        que << next_v
    end
end
puts dist