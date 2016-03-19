# accurate accumlulation

function SumOfSquares(x::Vector{Float64}) 
    if length(x) >= 375299968947538
        throw(DomainError)
    end
    
    ssqHiLo = zero(FF)
    for i in 1:length(x)
        xsqHiLo = eftMul(x[i], x[i])
        ssqHiLo = SumNonNeg(ssqHiLo, xsqHiLo)
    end
    ssqHiLo
end

function SumNonNeg{T<:FF{Float64}}(a::T, b::T)
    hi,md = eftAdd(a.hi,b.hi)
    c = a.lo + b.lo
    d = lo + c
    hi, md = eftAddGTE(hi,d)
    FF(hi, md)
end
