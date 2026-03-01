# LayeredCylinders_DDSdesign
* Need to update this DOI
[![DOI](https://zenodo.org/badge/974522428.svg)](https://doi.org/10.5281/zenodo.16614720)

Code for performing parameter estimation on concentric cylindrical drug delivery devices using available data and simulating various configurations of two concentric polymeric layers around a drug-loaded core.

## Overview
This repository contains the MATLAB and COMSOL files from the manuscript cited below that simulates drug delivery from layered cylindrical drug delivery devices and estimates the parameters (porosity, tortuosity, scaling factor, and mass transfer rates) that best fit a given input dataset of cumulative release vs. time. Latin hypercube sampling is used to determine the initial guesses in the multi-start approach. The model accounts for key transport process parameters, including macroscopic device properties and diffusion coefficients across bi-layered polymeric microcapsules. The estimated transport parameters were fitted to experimental release data for BSA and bevacizumab using the finite element (COMSOL) methods. Using clinically relevant thresholds for therapeutic delivery, we simulated drug release from chitosan-PCL microcapsules and showed that the interplay between PCL fraction, polymer thickness, and porosity on therapeutic release.

## Code Authors
Eduardo A. Chacin Ruiz, Ashlee N. Ford Versypt

Contact: ashleefv@buffalo.edu

## Manuscript
* need to update this
E.A. Chacin Ruiz, K. E. Swindle-Reilly, and A. N. Ford Versypt, Modeling and Design of Chitosan–PCL Bi-Layered Microspheres for Intravitreal Controlled Release, Pharmaceutics 2025, 17, 1174. [https://doi.org/10.3390/pharmaceutics17091174](https://doi.org/10.3390/pharmaceutics17091174)

## Folder Scripts and Data

### Bayesian_Optimization_Surrogate Folder Scripts and Data
* Figures. This folder contains all the figures from BO surrogate.
* BO_constraint_internal_scaling.ipynb. Jupyter notebook containing the script for applying the BO and gaussian process (GP). Uses DataSheetforBO.csv as input.
* DataSheetforBO.csv contains the results for the latin hypercube sampling (LHS) and GP-suggested designs in an structured format.
* Exp_fitting_of_predictions.m used to fit to an exponential function the release rate profile for the DDS designs.
* GP_predicted_vs_COMSOL_simulated.m matlab script that compares GP predicted therapeutic duration to COMSOL simulations.
* LHS_results_5_percent.xlsx contains the information from 10 designs for 5% salt-leaching formulations from LHS.
* LHS_results_7_5_percent.xlsx contains the information from 10 designs for 7.5% salt-leaching formulations from LHS.
* Proposed_by_GP_5_salt_leaching.xlsx contains the information from 10 designs for 5% salt-leaching formulations from GP-obtained suggestions.
* Proposed_by_GP_7_5_salt_leaching.xlsx contains the information from 10 designs for 7.5% salt-leaching formulations from GP-obtained suggestions.
* ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.

### Dimensionless_Release Folder Scripts and Data
* Dimensionless_plotting_both.m Contains the information for BSA and Bevacizumanb dimensionless plotting.
* Dimensionless_release.m Matlab script for plotting the dimensionless release of BSA and Bevacizumab.
* ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.

### Experimental release Folder Scripts and Data
* Experimental_release.m Plots cumulative drug release vs time from experimental devices of different sizes and porosities. 
* Microcapsule_drug_release_ALL_formulations.xlsx This excel file contains the information for experimental release from experimental devices of different sizes and porosities.
* ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.

### Diffusion_Boundaries Folder Scripts
* LowerAndUpperLimitsForDiffusion.m This script plots a figure showing the experimental data for BSA and Bevacizumab from Jiang et al. (2020), and the cumulative release curves assuming the same diffusion coefficients in both layers. Creates Figure S4.

### Diffusion_Regimes Folder Scripts and Data
* balanced_diffusion.mat Contains the concentration matrix (at different times and positions) for the case of DChi = DPCL.
* core_limited_diffusion.mat Contains the concentration matrix (at different times and positions) for the case of DChi << DPCL.
* Plot_Diffusion_Regimes.m This script plots the concentration profile with respect to position, at different time points, for the three regimes. Creates Figure S7.
* shell_limited_diffusion.mat Contains the concentration matrix (at different times and positions) for the case of DChi >> DPCL.

### Parameter_Estimation_Results Folder Scripts and Data
* InitialGuesses_100_Simulations.xlsx This datasheet contains the information used and results for the preliminary parameter estimation for both BSA and bevacizumab in MATLAB and COMSOL.
* InitialGuesses_50_Simulations.xlsx This datasheet contains the information used and results for the final parameter estimation for both BSA and bevacizumab in MATLAB and COMSOL.
* Plots_Bev_100_IC.m This script reads the preliminary parameter estimation results for bevacizumab from InitialGuesses_100_Simulations.xlsx and the output is a 2x2 plot comparing average and best results for COMSOL and MATLAB, and the error values obtained. Creates Figure S6.
* Plots_Bev_50_IC.m This script reads the final parameter estimation results for bevacizumab from InitialGuesses_50_Simulations.xlsx and the output is a 2x2 plot comparing average and best results for COMSOL and MATLAB, and the error values obtained. Creates Figure 4.
* Plots_BSA_100_IC.m This script reads the preliminary parameter estimation results for bevacizumab from InitialGuesses_100_Simulations.xlsx and the output is a 2x2 plot comparing average and best results for COMSOL and MATLAB, and the error values obtained. Creates Figure S5.
* Plots_BSA_50_IC.m This script reads the final parameter estimation results for BSA from InitialGuesses_50_Simulations.xlsx and the output is a 2x2 plot comparing average and best results for COMSOL and MATLAB, and the error values obtained. Creates Figure 3.

### Sensitivity_and_Confidence_Interval Folder Scripts and Data
* Combined_local_and_SOBOL.m This file plots a 3x2 figure where the top row is composed of local sensitivity analysis obtained from MATLAB and the bottom row is composed of SOBOL indices obtained from COMSOL. Creates Figure 2.
* Confidence_Intervals.m This scripts calculates the sensitivity matrix S and uses it for the calculation of the confidence interval of the specified paramters.
* Initial_Guesses_50_Simulations.xlsx This datasheet contains the information used and results for the final parameter estimation for both BSA and bevacizumab in MATLAB and COMSOL.
* MOAT.m This script is used to plot the Morris one-at-a-time results obtained from COMSOL. Creates Figure S8.
* MOAT_Info_COMSOL.xlsx This datasheet contains the COMSOL results of the MOAT mean and MOAT standard deviation for the parameters under different drug release regimens.
* MPs_release_6_months.xlsx This datasheet contains the experimental data for cumulative drug release with time, and its standard deviation.
* Sensitivity_Analysis.m This scripts solves the local sensitivity analysis for a given perturbance percentage and plots the normalized change in cumulative drug release for the specified parameters.
* solve_FD_spheres_sensitivity.m This file solves the PDE for Fickian diffusion within a radially symmetric sphere. It is an optimized version of "solve_FD_spheres_variable_diffusivity.m" reporposed for the type of input and output required for the sensitivity analysis.

## COMSOL Folder Scripts and Data
* BSA_Experimental_data_MPs_Chitosan-PCL.csv This datasheet contains the experimental data for the cumulative release of BSA with time (in seconds).
* Bevacizumab_Experimental_data_MPs_Chitosan-PCL.csv This datasheet contains the experimental data for the cumulative release of bevacizumab with time (in seconds).
* Optimization_MP_Chitosan_PCL.mph This file can be used to perform the parameter estimation for a given dataset.
* Uncertainty_MP_Chitosan_PCL.mph This file can be used to perform sensitivity analysis (MOAT and SOBOL) for the model parameters.

## Acknowledgements
This work was supported by National Institutes of Health grant R35GM133763 to ANFV, R01EB032870 to KESR and ANFV, and the Owen Locke Foundation to KESR. The content is solely the responsibility of the authors and does not necessarily represent the official views of the funding agencies.
