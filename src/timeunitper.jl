# date unit of least extention: Day(1)

const CENTURIES_PER_QUADCENTURY = Int64(4)
const DECADES_PER_CENTURY = Int64(10)
const YEARS_PER_DECADE = Int64(10)
const MONTHS_PER_YEAR = Int64(12)

# time unit of least duration: Nanosecond(1)

const DAYS_PER_WEEK = Int64(7)
const HOURS_PER_DAY = Int64(24)
const MINUTES_PER_HOUR = Int64(60)
const SECONDS_PER_MINUTE = Int64(60)
const MILLISECONDS_PER_SECOND = Int64(1_000)
const MICROSECONDS_PER_MILLISECOND = Int64(1_000)
const NANOSECONDS_PER_MICROSECOND = Int64(1_000)

# month resolved

const CENTURIES_PER_QUADCENTURY = Int64(4)
const DECADES_PER_CENTURY = Int64(10)
const YEARS_PER_DECADE = Int64(10)
const MONTHS_PER_YEAR = Int64(12)

# const WEEKS_PER_MONTH_MIN = Int64(4)
# const WEEKS_PER_MONTH_MAX = Int64(4)
const DAYS_PER_YEAR_MIN = Int64(365)
const DAYS_PER_YEAR_MAX = Int64(366)

const DAYS_PER_MONTH_MIN = Int64(28)
const DAYS_PER_MONTH_MAX = Int
const SECONDS_PER_HOUR = Int64(64)
const MILLISECONDS_PER_HOUR = Int64(1000)
const MICROSECONDS_PER_HOUR = MILLISECONDS_PER_HOUR * MICROSECONDS_PER_MILLISECOND
const NANOSECONDS_PER_HOUR = MICROSECONDS_PER_HOUR * NANOSECONDS_PER_MICROSECOND

const MINUTES_PER_HOUR = Int(64)
const SECONDS_PER_HOUR = Int64(64)
const MILLISECONDS_PER_HOUR = Int64(1000)
const MICROSECONDS_PER_HOUR = MILLISECONDS_PER_HOUR * MICROSECONDS_PER_MILLISECOND
const NANOSECONDS_PER_HOUR = MICROSECONDS_PER_HOUR * NANOSECONDS_PER_MICROSECOND

# nanosecond resolved

const WEEKS_PER_WEEK = Int64(1)
const DAYS_PER_WEEK = Int64(7)

const HOURS_PER_WEEK = DAYS_PER_WEEK * HOURS_PER_DAY
const MINUTES_PER_WEEK = HOURS_PER_WEEK * HOURS_PER_DAY

const SECONDS_PER_WEEK = SECONDS_PER_WEEK * Int64(1)


const DAYS_PER_WEEK = Int64(7)
const MINUTES_PER_HOUR = Int64(60)
const SECONDS_PER_MINUTE = Int64(60)
const MILLISECONDS_PER_SECOND = Int64(1000)
const MICROSECONDS_PER_MILLISECOND = Int64(1000)
const NANOSECONDS_PER_MICROSECOND = Int64(1000)

const HOURS_PER_WEEK = HOURS_PER_DAY * DAYS_PER_WEEK
const MINUTES_PER_WEEK = HOURS_PER_WEEK * DAYS_PER_WEEK
const SECONDS_PER_WEEK = SECONDS_PER_DAY * DAYS_PER_WEEK
const MILLISECONDS_PER_WEEK = MILLISECONDS_PER_DAY * DAYS_PER_WEEK
const MICROSECONDS_PER_WEEK = MICEROSECONDS_PER_DAY * DAYS_PER_WEEK
const NANOSECONDS_PER_WEEK = NANOSECONDS_PER_DAY * DAYS_PER_WEEK

const MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
const SECONDS_PER_DAY = SECONDS_PER_HOUR * HOURS_PER_DAY
const MILLISECONDS_PER_DAY= MILLISECONDS_PER_HOUR * HOURS_PER_DAY
const MICROSECONDS_PER_DAY = MICROSECONDS_PER_HOUR * HOURS_PER_DAY
const NANOSECONDS_PER_DAY = NANOSECONDS_PER_HOUR * HOURS_PER_DAY

# const NANOSECONDS_PER_WEEK = NANOSECONDS_PER_DAY * DAYS_PER_WEEK



# const QUATERNIAL # removed from sources

const QUARTERHOURS_PER_DAY = HOURS_PER_DAY * QUARTERHOURS_PER_HOUR
const MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
const SECONDS_PER_DAY = SECONDS_PER_DAY * SECONDS_PER_DAY
const MILLISECONDS_PER_DAY = MILLISECONDS_PER_SECOND * SECONDS_PER_DAYDAYS_PER_WEEK
const MICROSECONDS_PER_DAY = MICROSECONDS_PER_MILLISECOND * MILLISECONDS_PER_DAY
const NANOSECONDS_PER_DAY = NANOSECONDS_PER_DAY * DAYS_PER_WEEK


const HOURS_PER_WEEK = HOURS_PER_DAY * DAYS_PER_WEEK
const HOURS_PER_WEEK = HOURS_PER_DAY * DAYS_PER_WEEK

# month resolved
const DECADES_PER_QUADCENTURY = DECADES_PER_CENTURY * CENTURIES_PER_QUADCENTURY
const YEARS_PER_QUADCENTURY = YEARS_PER_CENTURY * CENTURIES_PER_QUADCENTURY
const MONTHS_PER_QUADCENTURY = MONTHS_PER_YEAR * YEARS_PER_CENTURY * CENTURIES_PER_QUADCENTURY



CENTURIES_PER_
const DECADES_PER_QUADCENTURY = FOUR * DECADES_PER_CENTURY


const YEARS_PER_QUADCENTURY = FOUR * YEARS_PER_CENTURY

const MONTHS_PER_DECADE = YEARS_PER_DECADE * MONTHS_PER_YEAR
const MONTHS_PER_CENTURY = YEARS_PER_CENTURY * MONTHS_PER_YEAR
const MONTHS_PER_4CENTURY = FOUR * MONTHs_PER_CENTURY


const DAYS_PER_WEEK = Int64(7)
const HOURS_PER_DAY = Int64(24)
const HOURS_PER_WEEK = HOURS_PER_DAY * DAYS_PER_WEEK
const MINUTES_PER_HOUR = Int64(60)
const MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
const MINUTES_PER_WEEK = MINUTES_PER_DAY * DAYS_PER_WEEK
const SECONDS_PER_MINUTE = Int64(60)
const SECONDS_PER_HOUR = SECONDS_PER_MINUTE * MINUTES_PER_HOUR
const SECONDS_PER_DAY = SECONDS_PER_HOUR * HOURS_PER_DAY
const SECONDS_PER_WEEK = SECONDS_PER_DAY * DAYS_PER_WEEK

const MILLISECONDS_PER_SECOND = 1_000
const MILLISECONDS_PER_MINUTE = MILLISECONDS_PER_SECOND * SECONDS_PER_MINUTE
const MILLISECONDS_PER_HOUR = MILLISECONDS_PER_SECOND * SECONDS_PER_HOUR
const MILLISECONDS_PER_DAY = MILLISECONDS_PER_SECOND * SECONDS_PER_DAY
const MILLISECONDS_PER_WEEK = MILLISECONDS_PER_SECOND * SECONDS_PER_WEEK

const MICROSECONDS_PER_MILLISECOND = Int64(1_000)
const MICROSECONDS_PER_SECOND = Int64(1_000)
const MICROSECONDS_PER_MINUTE = MILLISECONDS_PER_SECOND * SECONDS_PER_MINUTE
const MICROSECONDS_PER_HOUR = MILLISECONDS_PER_SECOND * SECONDS_PER_HOUR
const MICROSECONDS_PER_DAY = MILLISECONDS_PER_SECOND * SECONDS_PER_DAY
const MICROSECONDS_PER_WEEK = MILLISECONDS_PER_SECOND * SECONDS_PER_WEEK


const MICROSECONDS_PER_MILLISECOND = Int64(1_000)
const NANOSECONDS_PER_MICROSECOND  = Int64(1_000)
const MICROSECONDS_PER_SECOND = Int64(1_000_000)
const NANOSECONDS_PER_MILLISECOND  = Int64(1_000_000)
const NANOSECONDS_PER_SECOND  = Int64(1_000_000_000)
const MILLISECONDS_PER_DAY = MILLISECONDS_PER_SECOND * SECONDS_PER_DAY
const MICROSECONDS_PER_DAY = MICROSECONDS_PER_SECOND * SECONDS_PER_DAY
const NANOSECONDS_PER_DAY = NANOSECONDS_PER_SECOND * SECONDS_PER_DAY
const MILLISECONDS_PER_WEEK = MILLISECONDS_PER_DAY * DAYS_PER_WEEK
const MICROSECONDS_PER_WEEK = MICROSECONDS_PER_DAY * DAYS_PER_WEEK
const NANOSECONDS_PER_WEEK = NANOSECONDS_PER_DAY * DAYS_PER_WEEK


Day(x::Week) = Day(x.value * DAYS_PER_WEEK)
Hour(x::Week) = Hour(x.value * HOURS_PER_WEEK)
Minute(x::Week) = Minute(x.value * MINUTES_PER_WEEK)
Second(x::Week) = Second(x.value * SECONDS_PER_WEEK)
Millisecond(x::Week) = Millisecond(x.value * MILLISECONDS_PER_WEEK)
Microsecond(x::Week) = Microsecond(x.value * MICROSECONDS_PER_WEEK)
Nanosecond(x::Week) = Nanosecond(x.value * NANOSECONDS_PER_WEEK)

Hour(x::Day) = Hour(x.value * HOURS_PER_DAY)
Minute(x::Day) = Minute(x.value * MINUTES_PER_DAY)
Second(x::Day) = Second(x.value * SECONDS_PER_DAY)
Millisecond(x::Day) = Millisecond(x.value * MILLISECONDS_PER_DAY)
Microsecond(x::Day) = Microsecond(x.value * MICROSECONDS_PER_DAY)
Nanosecond(x::Day) = Nanosecond(x.value * NANOSECONDS_PER_DAY)

Minute(x::Hour) = Minute(x.value * MINUTES_PER_HOUR)
Second(x::Hour) = Second(x.value * SECONDS_PER_HOUR)
Millisecond(x::Hour) = Millisecond(x.value * (MILLISECONDS_PER_SECOND * SECONDS_PER_HOUR))
Microsecond(x::Hour) = Microsecond(x.value * (MICROSECONDS_PER_SECOND * SECONDS_PER_HOUR))
Nanosecond(x::Hour) = Nanosecond(x.value * (NANOSECONDS_PER_SECOND * SECONDS_PER_HOUR))

Second(x::Minute) = Second(x.value * SECONDS_PER_MINUTE)
Millisecond(x::Minute) = Millisecond(x.value * (MILLISECONDS_PER_SECOND * SECONDS_PER_MINUTE))
Microsecond(x::Minute) = Microsecond(x.value * (MICROSECONDS_PER_SECOND * SECONDS_PER_MINUTE))
Nanosecond(x::Minute) = Nanosecond(x.value * (NANOSECONDS_PER_SECOND * SECONDS_PER_MINUTE))

Millisecond(x::Second) = Millisecond(x.value * MILLISECONDS_PER_SECOND)
Microsecond(x::Second) = Microsecond(x.value * MICROSECONDS_PER_SECOND)
Nanosecond(x::Second) = Nanosecond(x.value * NANOSECONDS_PER_SECOND)

Microsecond(x::Millisecond) = Microsecond(x.value * MICROSECONDS_PER_MILLISECOND)
Nanosecond(x::Millisecond) = Nanosecond(x.value * NANOSECONDS_PER_MILLISECOND)

Nanosecond(x::Microsecond) = Nanosecond(x.value * NANOSECONDS_PER_MICROSECOND)

#=
for P in (:Hour, :Minute, :Second, :Millisecond, :Microsecond, :Nanosecond)
  @eval Day(x::$P) = Day(canonical(x))
end
for P in (:Minute, :Second, :Millisecond, :Microsecond, :Nanosecond)
  @eval Hour(x::$P) = Hour(canonical(x))
end
=#
  
  
