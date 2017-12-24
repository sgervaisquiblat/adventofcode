total = 0

def singleWordUse(str)
  words = str.split(" ")
  if words.combination(2).any? { |a, b| a == b }
    return 0
  else
    return 1
  end
end

File.open("passphrases.txt").each{|passephrase| total += singleWordUse(passephrase)}
puts total
