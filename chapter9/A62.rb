# 問題A62 Depth First Search  ★3

n, m = gets.split.map(&:to_i)
g = Array.new(n){ [] }
seen = Array.new(n, false)
m.times do
    a, b = gets.split.map(&:to_i)
    a -= 1
    b -= 1
    g[a] << b
    g[b] << a
end

def dfs(g, seen, pos)
    seen[pos] = true
    g[pos].each do |nex|
        next if seen[nex]
        dfs(g, seen, nex)
    end
    return
end

dfs(g, seen, 0)

puts seen.all?{|x| x == true } ? "The graph is connected." : "The graph is not connected."