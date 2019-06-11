using Pkg

pkg_list = ["HDF5"
	"Flux"
	"Gadfly"
	"Turing"
	"Queryverse"
	"JuMP"
	"JuliaDB"
	"DataFrames"
	"DataFramesMeta"
	"Plots"
	"MLJ"
	"MLJModels"
	"Distributions"
	"Interact"
	"CUDAnative"
	"OhMyREPL"
	"IJulia"
	"GLM"
	"StatsBase"
	"Mamba"
	"HTTP"
	"Blink"
	"Bio"
	"JSON"
	"Optim"
	"NMF"
	"ProgressMeter"
	"Reactive"
	"LightGraphs"
	"Cassette"
	"Pipe"]

[Pkg.add(pkg) for pkg in pkg_list]


