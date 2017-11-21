# GPPMPaper
This is supplement entails the code for all figures as well as the demonstrations of equivalences mentioned in the XXX paper. 


# Figures
The code for the figures is in the [figures/code](figures/code) folder. Call [makeAllFigures.m](figures/code/makeAllFigures.m) for redrawing all plots. Note that this takes a few minutes. When this is done in the [figures/code](figures/code) folder, the plots are saved in [figures/code](figures/render).


Prerequesites: The Matlab implementation of GPPM is required (klick [here](https://github.com/karchjd/GPPMM/))

# Equivalences
The code demonstrating that the GPPM solutions are equivalent to those obtained using traditional software for a set of example models is in the [equivalances](equivalences) folder. Each script demonstrates the equivalence for one example model.

Prerequesites: The R implementation of GPPM is required (klick [here](https://github.com/karchjd/gppmr/))

# Equivalences Splines
For demonstrating the cababilites of GPPM to represent splines we provide a GPPM reimplementation of the example presented in Wood (2006, Chapter 3.2) in [splines](splines). The folder contains the original R code as well as the Matlab GPPM reimplementation. Both scripts generate a picture. As you can confirm those picture are identical.

Prerequesites: The Matlab implementation of GPPM is required (klick [here]())

# References
Wood, S. (2006). *Generalized additive models: an introduction with R*. CRC press.
