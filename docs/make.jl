using Documenter, CompoundPeriods, Dates

makedocs(
    modules = [CompoundPeriods],
    sitename = "CompoundPeriods",
    pages  = Any[
        "Overview"                 => "index.md",
        "Example 1"                => "example1.md",
        "Example 2"                => "example2.md",
        "Example 3"                => "example3.md",
        "Example 4"                => "example4.md",
        "Example 5"                => "example5.md",
        "Example 6"                => "example6.md"
        ]
    )

deploydocs(
    repo = "github.com/JeffreySarnoff/CompoundPeriods.jl.git",
    target = "build"
)
