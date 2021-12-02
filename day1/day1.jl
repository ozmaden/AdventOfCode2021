using DSP

depths = parse.(Int, readlines("day1/input"))
# depths = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

##  PART ONE
#   count increasing depths

num_of_increasing_depths = length(findall(x->x>0, diff(depths)))
println("Part One: There are $(num_of_increasing_depths) measurements that are larger than the previous measurement")

##  PART TWO
#   Averaging window length = 3
window_length = 3
window = ones(Int, window_length)
moving_averaged_depths = conv(window, depths)[window_length:end-(window_length-1)] # cut the ramps at the beginning and end
num_of_increasing_depths = length(findall(x->x>0, diff(moving_averaged_depths)))
println("Part Two: There are $(num_of_increasing_depths) measurements that are larger than the previous measurement")