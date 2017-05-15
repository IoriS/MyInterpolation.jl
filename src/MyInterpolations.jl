module MyInterpolations

export MyLinInterp

immutable MyLinInterp
    grid::Array
    vals::Array
end

function (f::MyLinInterp)(x)
    i = searchsortedlast(MyLinInterp.grid,x)
    k = searchsortedfirst(MyLinInterp.grid,x)
    if i == 0 || (i == length(MyLinInterp.grid) && k == length(MyLinInterp.grid) + 1)
        return 0
    end

    if i == length(MyLinInterp.grid) && k != length(MyLinInterp.grid) + 1
        return (MyLinInterp.vals[i])
    end
    
    interpolated_value = (x - MyLinInterp.grid[i])*(MyLinInterp.vals[i+1]-MyLinInterp.vals[i])/(MyLinInterp.grid[i+1]-MyLinInterp.grid[i])+MyLinInterp.vals[i]
    return interpolated_value 
end

end