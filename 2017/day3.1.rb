#1 is layer (l) = 0
#Bottom right corner (c) is: c = (uneven number)^2
#Max distance (d) is within: 2*l >= d >= 2*(l-1)
arg = ARGV
num = arg[0].to_i

def find_layer(value)
  if value == 1
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
  side_length = Math.sqrt(layer_info[2])
  corner1 = layer_info[1]+(side_length-2)
  corner2 = corner1 + (side_length - 1)
  corner3 = corner2 + (side_length -1)
  corner4 = layer_info[2]
  return [corner1, corner2, corner3, corner4]
end

def distance_from_closest_corner(value)
  info = find_layer(value)
  corners = find_layer_corners(info)
  side_length = Math.sqrt(info[2])
  distance_from_corner = if value == 1
    0
  elsif value == info[1]
    1
  elsif value > info[1] && value <= corners[0]
    corners[0] - value
  elsif value > corners[0] && value <= corners[1]
    corners[1] - value
  elsif value > corners[1] && value <= corners[2]
    corners[2] - value
  else
    corners[3] - value
  end
  if (side_length - distance_from_corner) < (side_length/2)
    return distance_from_corner - (side_length/2).floor
  else
    return distance_from_corner
  end
end

puts 2 * find_layer(num)[0] - distance_from_closest_corner(num)
