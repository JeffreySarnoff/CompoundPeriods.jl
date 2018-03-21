struct ReverseCompoundPeriod <: AbstractTime
   cperiod::CompoundPeriod
end

reverse(x::CompoundPeriod) = ReverseCompoundPeriod(x)
reverse(x::ReverseCompoundPeriod) = x.cperiod
   
function string(rperiod::ReverseCompoundPeriod)
   str = "ReverseCompoundPeriod("
   for aperiod in rperiod
       str = string(str, string(aperiod),", ")
   end
   str = string(str[1:end-2],")")
   return str
end

function show(io::IO, x::ReverseCompoundPeriod)
   print(io, string(x))
end

const StdOut = isdefined(Base, :stdout) ? Base.stdout : Base.STDOUT

function show(x::ReverseCompoundPeriod)
    print(StdOut, string(x))
end      
