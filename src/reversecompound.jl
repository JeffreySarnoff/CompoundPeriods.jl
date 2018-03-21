function string(rperiod::ReverseCompoundPeriod)
   str = "ReverseCompoundPeriod("
   for aperiod in rperiod
       str = string(str, string(aperiod),", ")
   end
   str = string(str[1:end-2],")")
   return str
end
