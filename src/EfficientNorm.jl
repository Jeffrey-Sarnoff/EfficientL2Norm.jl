module EfficientNorm.jl

!isdefined(Float) && typealias Float AbstractFloat;

import Base: abs, sqrt, norm

export norm, normsqr, netlib_norm

using ErrorfreeArithmetic
using FloatFloat

include("Constants.jl")
include("NormSqr.jl")
include("Norm.jl")

end # module
