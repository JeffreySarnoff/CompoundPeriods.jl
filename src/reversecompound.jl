struct ReverseCompoundPeriod <: AbstractTime
   cperiod::CompoundPeriod
end

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

if isdefined(Base, :stdout)
    function show(x::ReverseCompoundPeriod)
       print(Base.stdout, string(x)
    end
else
    function show(x::ReverseCompoundPeriod)
       print(Base.STDOUT, string(x)
    end
end      
