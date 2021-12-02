depths = parse.(Int, readlines("day1/input"))
num_of_increasing_depths = length(findall(x->x>0, diff(depths)))
println("There are $(num_of_increasing_depths) measurements that are larger than the previous measurement")