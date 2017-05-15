module MyInterpolations

export MyLinInterp

immutable MyLinInterp
    grid::Array
    vals::Array
end

function (f::MyLinInterp)(x)
    i = searchsortedlast(f.grid,x)
    k = searchsortedfirst(f.grid,x)
    if i == 0 || (i == length(f.grid) && k == length(f.grid) + 1)
        return 0
    end

    if i == length(f.grid) && k != length(f.grid) + 1
        return (f.vals[i])
    end
    
    interpolated_value = (x - f.grid[i])*(f.vals[i+1]-f.vals[i])/(f.grid[i+1]-f.grid[i])+f.vals[i]
    return interpolated_value 
end

end