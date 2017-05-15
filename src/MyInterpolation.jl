module MyInterpolation

export MyLinInterp

immutable MyLinInterp
    grid::Array
    vals::Array
end

function (f::MyLinInterp)(points::MyLinInterp,x)
    i = searchsortedlast(points.grid,x)
    k = searchsortedfirst(points.grid,x)
    if i == 0 || (i == length(points.grid) && k == length(points.grid) + 1)
        return 0
    end

    if i == length(points.grid) && k != length(points.grid) + 1
        return (points.vals[i])
    end
    
    interpolated_value = (x - points.grid[i])*(points.vals[i+1]-points.vals[i])/(points.grid[i+1]-points.grid[i])+points.vals[i]
    return interpolated_value 
end

end