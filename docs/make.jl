using Documenter, CompoundPeriods, Dates

makedocs(
    modules = [CompoundPeriods],
    sitename = "CompoundPeriods",
    pages  = Any[
        "Overview"                           => "index.md",
        "Canonical Compound Periods"         => "example1.md",
        "Reverse Compound Periods"           => "example2.md",
        "Well Behaved Temporal Composites"   => "example3.md",
        "Nanosecond Increments"              => "example4.md",
        "min, max, minmax"                   => "example5.md",
        "Dates, Times"                       => "example6.md"
        ]
    )

deploydocs(
    repo = "github.com/JeffreySarnoff/CompoundPeriods.jl.git",
    target = "build"
)
