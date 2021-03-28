# MySQL Instructions

## One-Time Setup (you only need to do these steps once)

Step 1: Open a new Terminal

Step 2: In Terminal, run the following command:
```bash
module load julia/1.5.4
```

Step 3: In Terminal, type `julia` and press enter to open a Julia REPL

Step 4: In Julia, run the following commands:
```julia
julia> import Pkg
julia> Pkg.add(["DBInterface", "DataFrames", "MySQL"])
julia> Pkg.precompile()
```

## Modules (you need to load these modules every time)

```bash
module load julia/1.5.4
module load mysql/8.0.13
```
