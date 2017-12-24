jumps = []

def do_jumps(jumps)
  number_of_steps = 0
  i = 0
  while i < jumps.length
    previousJump = i
    i += jumps[i]
    jumps[previousJump] += 1
    number_of_steps += 1
  end
  return number_of_steps
end

File.open("jumps.txt").each {|jump| jumps << jump.to_i}

puts do_jumps(jumps)
