#1 is layer (l) = 0
#Bottom right corner (c) is: c = (uneven number)^2
#Max distance (d) is within: 2*l >= d >= 2*(l-1)
arg = ARGV
num = arg[0].to_i

def find_layer(value)
  if(value == 1)
    return [0, 1, 1]
  else
    layer = 1
    i = 3
    max = i ** 2
    min = 2
    while (value <=> max) > 0
      i += 2
      layer += 1
      min = max + 1
      max = i ** 2
    end
    return [layer, min, max]
  end
end

def find_layer_corners(layer_info)
  side = Math.sqrt(layer_info[2])
  c1 = layer_info[1]+(side-2)
  c2 = c1 + (side - 1)
  c3 = c2 + (side -1)
  c4 = layer_info[2]
  return [c1, c2, c3, c4]
end

def distance_from_closest_corner(value)
  info = find_layer(value)
  corners = find_layer_corners(info)
  d = nil
  side = Math.sqrt(info[2])
  if value == 1
    return 0
  elsif value == info[1]
    return 1
  elsif value > info[1] && value <= corners[0]
    d = corners[0] - value
  elsif value > corners[0] && value <= corners[1]
    d = corners[1] - value
  elsif value > corners[1] && value <= corners[2]
    d = corners[2] - value
  else
    d = corners[3] - value
  end
  if (side - d) < (side/2)
    return d - (side/2).floor
  else
    return d
  end
end

def manhattan_distance(value)
  return max_dist = 2 * find_layer(value)[0] - distance_from_closest_corner(value)
end

puts manhattan_distance(num)
