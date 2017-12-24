part1_Validated_passphrases = []
total = 0

def singleWordUse(str)
  words = str.split(" ")
  if words.combination(2).any? { |a, b| a == b }
    return nil
  else
    return str
  end
end

def containsNoAnagrams(str)
  words = str.split(" ")
  containsNoAnagrams = if words.combination(2).any? {|a, b| a.chars.sort.join == b.chars.sort.join}
    0
  else
    1
  end
  return containsNoAnagrams
end

File.open("passphrases.txt").each{|passephrase| part1_Validated_passphrases << singleWordUse(passephrase)}
part1_Validated_passphrases.compact.each {|passphrase| total += containsNoAnagrams(passphrase)}
puts total
