# accurate accumlulation

function SumOfSquares(x::Vector{Float64}) 
    if length(x) >= 375299968947538
        throw(DomainError)
    end
    
    SumSquares(x)
end

function SumOfSquares(x::Vector{Float32}) 
    if length(x) >= 699047
        throw(DomainError)
    end
    
    SumSquares(x)
end


function SumSquares{T<:AbstractFloat}(x::Vector{T})
    ssqHiLo = zero(FF{T})
    for i in 1:length(x)
        xsqHiLo = eftMul(x[i], x[i])
        ssqHiLo = SumNonNeg(ssqHiLo, xsqHiLo)
    end
    ssqHiLo
end


function SumNonNeg{T<:AbstractFloat}(a::FF{T}, b::FF{T})
    hi,md = eftAdd(a.hi,b.hi)
    c = a.lo + b.lo
    d = lo + c
    hi, md = eftAddGTE(hi,d)
    FF(hi, md)
end
