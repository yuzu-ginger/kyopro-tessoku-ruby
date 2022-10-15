# 問題B63 幅優先探索

r, c = gets.split.map(&:to_i)
sx, sy = gets.split.map{|x| x.to_i - 1 }
gx, gy = gets.split.map{|x| x.to_i - 1 }
map = r.times.map{ gets.chomp.chars }
dx = [1, -1, 0, 0]
dy = [0, 0, 1, -1]
dist = Array.new(r){ Array.new(c, -1) }
dist[sx][sy] = 0
que = [[sx, sy]]
while !que.empty?
    pos_x, pos_y = que.shift
    4.times do |i|
        next_x = pos_x + dx[i]
        next_y = pos_y + dy[i]
        next if next_x < 0 || next_x >= r || next_y < 0 || next_y >= c
        next if map[next_x][next_y] == "#" || dist[next_x][next_y] != -1
        dist[next_x][next_y] = dist[pos_x][pos_y] + 1
        que << [next_x, next_y]
    end
end
puts dist[gx][gy]