module PartOne
    struct Command
        heading::String
        value::Int64
    end

    mutable struct Position
        hor_pos::Int64
        depth::Base.Int64
    end

    function Position()
        Position(0,0)
    end

    function gen_command_sequence!(command_sequence::Array{Command}, commands::Vector{String})
        for i = 1:length(commands)
            command_sequence[i] = Command(first(split.(commands, " ")[i]), parse.(Int, last(split.(commands, " ")[i])))
        end
    end
    
    function update_position!(position::Position, command::Command)
        if command.heading == "forward"
            position.hor_pos += command.value 
        elseif command.heading == "up"
            position.depth -= command.value
        elseif command.heading == "down"
            position.depth += command.value
        end 
    end
end

## Part One
commands = readlines("day2/input")
# commands = ["forward 5",
#            "down 5",
#            "forward 8",
#            "up 3",
#            "down 8",
#            "forward 2"]
pos = PartOne.Position()
command_sequence = Array{PartOne.Command}(undef, length(commands))
PartOne.gen_command_sequence!(command_sequence, commands)
for i = 1:length(command_sequence)
    PartOne.update_position!(pos, command_sequence[i])
end
println("Following these instructions, you would have a horizontal position of $(pos.hor_pos) and a depth of $(pos.depth). (Multiplying these together produces $(pos.hor_pos * pos.depth).)")

module PartTwo
    struct Command
        heading::String
        value::Int64
    end

    mutable struct Position
        aim::Int64
        hor_pos::Int64
        depth::Int64
    end

    function Position()
        Position(0,0,0)
    end

    function gen_command_sequence!(command_sequence::Array{Command}, commands::Vector{String})
        for i = 1:length(commands)
            command_sequence[i] = Command(first(split.(commands, " ")[i]), parse.(Int, last(split.(commands, " ")[i])))
        end
    end
    
    function update_position!(position::Position, command::Command)
        if command.heading == "forward"
            position.hor_pos += command.value
            position.depth += position.aim * command.value
        elseif command.heading == "up"
            position.aim -= command.value
        elseif command.heading == "down"
            position.aim += command.value
        end 
    end
end

## Part Two
commands = readlines("day2/input")
# commands = ["forward 5",
#            "down 5",
#            "forward 8",
#            "up 3",
#            "down 8",
#            "forward 2"]
pos = PartTwo.Position()
command_sequence = Array{PartTwo.Command}(undef, length(commands))
PartTwo.gen_command_sequence!(command_sequence, commands)
for i = 1:length(command_sequence)
    PartTwo.update_position!(pos, command_sequence[i])
end
println("Following these instructions, you would have a horizontal position of $(pos.hor_pos) and a depth of $(pos.depth). (Multiplying these together produces $(pos.hor_pos * pos.depth).)")
