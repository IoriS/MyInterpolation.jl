module MyInterpolation

export MyLinInterp

immutable MyLinInterp
    grid::Array
    vals::Array
end

function (f::MyLinInterp)(x)
    i = searchsortedlast(grid,x)
    k = searchsortedfirst(grid,x)
    if i == 0 || (i == length(grid) && k == length(grid) + 1)
        return 0
    end

    if i == length(grid) && k != length(grid) + 1
        return (vals[i])
    end
    
    interpolated_value = (x - grid[i])*(vals[i+1]-vals[i])/(grid[i+1]-grid[i])+vals[i]
    return interpolated_value 
end

end