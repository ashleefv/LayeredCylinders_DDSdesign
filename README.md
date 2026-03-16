# LayeredCylinders_DDSdesign

Code for performing parameter estimation, simulation, and Bayesian optimization of concentric cylindrical drug delivery devices using available data and simulating various configurations of two concentric polymeric layers around a drug-loaded core.

## Overview
This repository contains the MATLAB and COMSOL files from the manuscript cited below that simulates drug delivery from layered cylindrical drug delivery devices and estimates the parameters (porosity, tortuosity, scaling factor, and mass transfer rates) that best fit a given input dataset of cumulative release vs. time. Latin hypercube sampling is used to determine the initial guesses in the multi-start approach. The model accounts for key transport process parameters, including macroscopic device properties and diffusion coefficients across bi-layered polymeric microcapsules. The estimated transport parameters were fitted to experimental release data for BSA and bevacizumab using the finite element (COMSOL) methods. Using clinically relevant thresholds for therapeutic delivery, we simulated drug release from chitosan-PCL microcapsules and showed that the interplay between PCL fraction, polymer thickness, and porosity on therapeutic release.

## Code Authors
Eduardo A. Chacin Ruiz, Ashlee N. Ford Versypt

Contact: [ashleefv@buffalo.edu](mailto:ashleefv@buffalo.edu)

## Manuscript
E. A. Chacin Ruiz, K. E. Swindle-Reilly, A. N. Ford Versypt, Modeling and Design of Multi-layered Cylindrical Microcapsules for Intravitreal Controlled Release, bioRxiv preprint, 2025. [DOI: 10.64898/2025.12.29.696951](https://doi.org/10.64898/2025.12.29.696951).

## Folder Scripts and Data

### Bayesian_Optimization_Surrogate Folder Scripts and Data
#### Figures
  * 3D_Surfaces.png This is the .png file for the 3D surface for the posterior and expected improvement as a function of polymer thickness and PCL fraction. Includes 5% and 7.5% salt leaching devices.
  * Cumulative_and_release_best.pdf PDF file containing the cumulative release profile and the release rate profile for the best drug delivery system design for a drug delivery system with 5% and 7.5% salt leaching.
  * Cumulative_and_release_best.tiff TIFF file containing the cumulative release profile and the release rate profile for the best drug delivery system design for a drug delivery system with 5% and 7.5% salt leaching.
  * Design_Space_Exploration_w_BO.m MATLAB script to plot Cumulative_and_release_best.pdf and Cumulative_and_release_best.tiff files. Uses Results_Compilation_BO.xlsx.
  * Figures_Compilation.pptx Includes all .png files obtained from the Bayesian Optimization.
  * GP_posterior_and_EI.png Figure with the GP posterior mean and Expected Improvement for after first and last suggested designs by the Gaussian Process. Includes the 5% and 7.5% salt leaching devices.
  * GP_posterior_and_slices.png Figure with the GP posterior and Expected Improvement at varying polymer thickness (constant PCL fraction) or varying PCL fraction (and constant polymer thickness). Includes the 5% and 7.5% salt leaching devices.
  * Results_Compilation_BO.xlsx Spreadsheet that contains the information from the designs obtained by Latin Hypercube Sampling (LHS) and suggested by the GP. Used in Design_Space_Exploration_w_BO.m.
  * ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.
  * plotfill.m Auxiliary function that fills the region of release rate threshold ± 10%.

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

### Exploring_critical_times Folder Scripts
  #### BSA
  * BSA_critical_time_exploration.m This script plots BSA cumulative release vs time and error value vs iteration for different possible critical times explored for the different formulations.
  * Results_compilation_BSA.xlsx This excel file contains the information of initial guesses, estimated parameters and objective functions for the different critical times explored for the different formulations.
  * ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.

  #### Bevacizumab
  * Bev_critical_time_exploration.m This script plots bevacizumab cumulative release vs time and error value vs iteration for different possible critical times explored for the different formulations.
  * Results_compilation_Bev.xlsx This excel file contains the information of initial guesses, estimated parameters and objective functions for the different critical times explored for the different formulations.
  * ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.  


### Parameter_estimation Folder Scripts and Data
#### Multi_start_PCL_only
##### Large_microcapsules
* BSA_PCL_Big_MCs_10.csv Experimental data of 10% salt-leaching PCL-only large microcapsules releasing BSA.
* BSA_PCL_Big_MCs_5.csv Experimental data of 5% salt-leaching PCL-only large microcapsules releasing BSA.
* BSA_PCL_Big_MCs_7_5.csv Experimental data of 7.5% salt-leaching PCL-only large microcapsules releasing BSA.
* Bev_PCL_Big_MCs_10.csv Experimental data of 10% salt-leaching PCL-only large microcapsules releasing bevacizumab.
* Bev_PCL_Big_MCs_5.csv Experimental data of 7.5% salt-leaching PCL-only large microcapsules releasing bevacizumab.
* Bev_PCL_Big_MCs_7_5.csv Experimental data of 5% salt-leaching PCL-only large microcapsules releasing bevacizumab.
* Multi_start_estimation_kcp.m Matlab script for the estimation of the mass transfer rate in PCL in large microcapsules.
* Param_estim_kcp.mph COMSOL file used during the estimation of the mass transfer rate in PCL in large microcapsules.

##### Small_microcapsules
* BSA_PCL_MCs_10.csv Experimental data of 10% salt-leaching PCL-only small microcapsules releasing BSA.
* BSA_PCL_MCs_5.csv Experimental data of 5% salt-leaching PCL-only small microcapsules releasing BSA.
* BSA_PCL_MCs_7_5.csv Experimental data of 7.5% salt-leaching PCL-only small microcapsules releasing BSA.
* Bev_PCL_MCs_10.csv Experimental data of 10% salt-leaching PCL-only small microcapsules releasing bevacizumab.
* Bev_PCL_MCs_5.csv Experimental data of 7.5% salt-leaching PCL-only small microcapsules releasing bevacizumab.
* Bev_PCL_MCs_7_5.csv Experimental data of 5% salt-leaching PCL-only small microcapsules releasing bevacizumab.
* Multi_start_estimation_porosity_tortuosity.m Matlab script for the estimation of the porosity and tortuosity in PCL-only small microcapsules.
* Param_estim_porosity_tortuosity.mph COMSOL file used during the estimation of the porosity and tortuosity in PCL-only small microcapsules.

#### Multi_start_chitosan_PCL
##### Large_microcapsules
* BSA_Chi_PCL_Big_MCs_10.csv Experimental data of 10% salt-leaching chitosan-PCL large microcapsules releasing BSA.
* BSA_Chi_PCL_Big_MCs_5.csv Experimental data of 5% salt-leaching chitosan-PCL large microcapsules releasing BSA.
* BSA_Chi_PCL_Big_MCs_7_5.csv Experimental data of 7.5% salt-leaching chitosan-PCL large microcapsules releasing BSA.
* Bev_chitosan_PCL_Big_MCs_10.csv Experimental data of 10% salt-leaching chitosan-PCL large microcapsules releasing bevacizumab.
* Bev_chitosan_PCL_Big_MCs_5.csv Experimental data of 7.5% salt-leaching chitosan-PCL large microcapsules releasing bevacizumab.
* Bev_chitosan_PCL_Big_MCs_7_5.csv Experimental data of 5% salt-leaching chitosan-PCL large microcapsules releasing bevacizumab.
* Multi_start_estimation_kcc.m Matlab script for the estimation of the mass transfer rate in chitosan in chitosan-PCL large  microcapsules.
* Param_estim_kcc.mph COMSOL file used during the estimation of the mass transfer rate in chitosan in chitosan-PCL large microcapsules.

##### Small_microcapsules
* BSA_Chi_PCL_MCs_10.csv Experimental data of 10% salt-leaching chitosan-PCL small microcapsules releasing BSA.
* BSA_Chi_PCL_MCs_5.csv Experimental data of 5% salt-leaching chitosan-PCL small microcapsules releasing BSA.
* BSA_Chi_PCL_MCs_7_5.csv Experimental data of 7.5% salt-leaching chitosan-PCL small microcapsules releasing BSA.
* Bev_chitosan_PCL_MCs_10.csv Experimental data of 10% salt-leaching chitosan-PCL small microcapsules releasing bevacizumab.
* Bev_chitosan_PCL_MCs_5.csv Experimental data of 7.5% salt-leaching chitosan-PCL small microcapsules releasing bevacizumab.
* Bev_chitosan_PCL_MCs_7_5.csv Experimental data of 5% salt-leaching chitosan-PCL small microcapsules releasing bevacizumab.
* Multi_start_estimation_sf.m Matlab script for the estimation of the scaling factor in small chitosan-PCL microcapsules.
* Param_estim_sf.mph COMSOL file used during the estimation of the scaling factor in small chitosan-PCL microcapsules.

#### Plots
##### BSA
* 10_percent_formulations.xlsx Includes the initial guesses, parameter estimation results, and experimental data for BSA release from small and large, PCL-only and chitosan-PCL devices with a 10% salt leaching step.
* 5_percent_formulations.xlsx Includes the initial guesses, parameter estimation results, and experimental data for BSA release from small and large, PCL-only and chitosan-PCL devices with a 5% salt leaching step.
* 7_5_percent_formulations.xlsx Includes the initial guesses, parameter estimation results, and experimental data for BSA release from small and large, PCL-only and chitosan-PCL devices with a 7.5% salt leaching step.
* BSA_rel_all_forms_early_time.m MATLAB script to plot BSA release from all different devices during the first 28 days.
* BSA_rel_all_forms_full_time.m MATLAB script to plot BSA release from all different devices during the whole release period.
* ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.

##### Bevacizumab
* 10_percent_formulations.xlsx Includes the initial guesses, parameter estimation results, and experimental data for bevacizumab release from small and large, PCL-only and chitosan-PCL devices with a 10% salt leaching step.
* 5_percent_formulations.xlsx Includes the initial guesses, parameter estimation results, and experimental data for bevacizumab release from small and large, PCL-only and chitosan-PCL devices with a 5% salt leaching step.
* 7_5_percent_formulations.xlsx Includes the initial guesses, parameter estimation results, and experimental data for bevacizumab release from small and large, PCL-only and chitosan-PCL devices with a 7.5% salt leaching step.
* Bev_rel_all_forms_early_time.m MATLAB script to plot bevacizumab release from all different devices during the first 28 days.
* Bev_rel_all_forms_full_time.m MATLAB script to plot bevacizumab release from all different devices during the whole release period.
* ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.

### PoreSizeDistribution Folder Scripts and Data
* PoreSizeDistribution.m plots the pore size distribution for the three different formulations assuming a normal distribution.
* ScriptForExportingImages.m exports standardized images in .pdf and .tiff format.
  
### Uncertainty_Propagation Folder Scripts and Data
  #### Chitosan_PCL_scripts
  ##### Large microcapsules
  * Uncertainty_Propagation_kcc.m This script draws different times a random set of parameters from the distribution obtained from parameter estimation on large chitosan-PCL microcapsules.
  * Uncertainty_Propagation_kcc.mph COMSOL file that runs the model using the parameters drawn in Uncertainty_Propagation_kcc.m

  ##### Small microcapsules
  * Uncertainty_Propagation_sf.m This script draws different times a random set of parameters from the distribution obtained from parameter estimation on small chitosan-PCL microcapsules.
  * Uncertainty_Propagation_sf.mph COMSOL file that runs the model using the parameters drawn in Uncertainty_Propagation_sf.m
  
  #### Plots
  ##### BSA
  * 10_percent_formulations.xlsx contains the information after parameter estimation of small and large PCL-only and chitosan-PCL designs for 10% salt-leaching formulations.
  * 5_percent_formulations.xlsx contains the information after parameter estimation of small and large PCL-only and chitosan-PCL designs for 5% salt-leaching formulations.
  * 7_5_percent_formulations.xlsx contains the information after parameter estimation of small and large PCL-only and chitosan-PCL designs for 7.5% salt-leaching formulations.
  * BSA_all_forms_early_time.m Plots the prediction interval for all the designs of all formulations for the first 30 days.
  * BSA_all_forms_full_time.m Plots the prediction interval for all the designs of all formulations for the whole time range.
  * All the .mat files contain the information generated from the random parameter drawing and COMSOL simulated results that are used for creating the prediction interval.

  ##### Bevacizumab
  * 10_percent_formulations.xlsx contains the information after parameter estimation of small and large PCL-only and chitosan-PCL designs for 10% salt-leaching formulations.
  * 5_percent_formulations.xlsx contains the information after parameter estimation of small and large PCL-only and chitosan-PCL designs for 5% salt-leaching formulations.
  * 7_5_percent_formulations.xlsx contains the information after parameter estimation of small and large PCL-only and chitosan-PCL designs for 7.5% salt-leaching formulations.
  * Bev_all_forms_early_time.m Plots the prediction interval for all the designs of all formulations for the first 30 days.
  * Bev_all_forms_full_time.m Plots the prediction interval for all the designs of all formulations for the whole time range.
  * All the .mat files contain the information generated from the random parameter drawing and COMSOL simulated results that are used for creating the prediction interval.


## Acknowledgements
This work was supported by National Institutes of Health grant R35GM133763 to ANFV, R01EB032870 to KESR and ANFV, and the Owen Locke Foundation to KESR. The content is solely the responsibility of the authors and does not necessarily represent the official views of the funding agencies.
