module Submarine
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
end


function gen_command_sequence!(command_sequence::Array{Submarine.Command}, commands::Vector{String})
    for i = 1:length(commands)
        command_sequence[i] = Submarine.Command(first(split.(commands, " ")[i]), parse.(Int, last(split.(commands, " ")[i])))
    end
end

function update_position!(position::Submarine.Position, command::Submarine.Command)
    if command.heading == "forward"
        position.hor_pos += command.value 
    elseif command.heading == "up"
        position.depth -= command.value
    elseif command.heading == "down"
        position.depth += command.value
    end 
end

commands = readlines("day2/input")
# commands = ["forward 5",
#            "down 5",
#            "forward 8",
#            "up 3",
#            "down 8",
#            "forward 2"]

pos = Submarine.Position()
command_sequence = Array{Submarine.Command}(undef, length(commands))
gen_command_sequence!(command_sequence, commands)

for i = 1:length(command_sequence)
    update_position!(pos, command_sequence[i])
end

println("Following these instructions, you would have a horizontal position of $(pos.hor_pos) and a depth of $(pos.depth). (Multiplying these together produces $(pos.hor_pos * pos.depth).)")