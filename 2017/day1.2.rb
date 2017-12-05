arg = ARGV
t = 0
arg[0].split("").each_with_index {|c, i| t+=c.to_i if c == arg[0][i+arg[0].length/2]}

puts "total = #{t*2}"
