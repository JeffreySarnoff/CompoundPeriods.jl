using Documenter, CompoundPeriods, Dates

makedocs(
    modules = [CompoundPeriods],
    sitename = "CompoundPeriods",
    pages  = Any[
        "Overview"                 => "index.md",
        "References"               => "references.md",
        "Index"                    => "documentindex.md"
        ]
    )

deploydocs(
    repo = "github.com/JeffreySarnoff/CompoundPeriods.jl.git",
    target = "build"
)
