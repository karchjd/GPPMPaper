# GPPMPaper
This supplement entails the code for all figures as well as the demonstrations of equivalences mentioned in the *Gaussian Process Panel Modeling – Kernel-Based Longitudinal Modeling* paper. 


# Figures
The code for the figures is in the [figures/code](figures/code) folder. Call [makeAllFigures.m](figures/code/makeAllFigures.m) for redrawing all plots. Note that this may take a few minutes. When this is done in the [figures/code](figures/code) folder, the plots are saved in [figures/render](figures/render).

## <a name="premat"></a> Prerequesites
The [Matlab implementation](https://github.com/karchjd/GPPMM/) of GPPM is required. To download the version we used to create the figures, klick [here](https://github.com/karchjd/GPPMM/releases/tag/0.1.0). After unzipping the archive, all the needs to be done is to ensure that the main folder including all its subfolders is included in you Matlab path. This can be achieved running

```matlab
>> addpath(genpath('main/'))
```

from within the base folder.


# Equivalences
The code demonstrating that the GPPM solutions are equivalent to those obtained using traditional software for a set of example models is in the [equivalances](equivalences) folder. Each script demonstrates the equivalence for one example model.

## Prerequesites
The [R implementation](https://github.com/karchjd/gppmr/) of GPPM is required. To install the version we used for creating these examples, simply run the follwing command in R (requires [devtools](https://cran.r-project.org/web/packages/devtools/index.html) packages)

```re
> devtools::install_github("karchjd/gppmr@v0.1.1")
```

# Equivalences Splines
For demonstrating the cababilites of GPPM to represent splines, we provide a GPPM reimplementation of the example presented in Wood (2006, Chapter 3.2). The [splines](splines) folder contains the Matlab GPPM reimplementation and redraws Figure 3.7 in Wood (2006).

Prerequesites: The Matlab implementation of GPPM (see [here](#premat)).

# References
Wood, S. (2006). *Generalized additive models: an introduction with R*. CRC press.
