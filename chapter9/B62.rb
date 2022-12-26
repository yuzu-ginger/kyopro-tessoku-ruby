# 問題B62 Print a Path ★4

n, m = gets.split.map(&:to_i)
g = Array.new(n){ [] }
seen = Array.new(n, false)
path = [1]
m.times do
    a, b = gets.split.map(&:to_i)
    a -= 1
    b -= 1
    g[a] << b
    g[b] << a
end

def dfs(g, seen, pos, path, n)
    if pos == n - 1
        puts path.join(" ")
        exit
    end
    seen[pos] = true
    g[pos].each do |nex|
        next if seen[nex]
        path << nex + 1
        dfs(g, seen, nex, path, n)
        path.pop
    end
    return
end

dfs(g, seen, 0, path, n)