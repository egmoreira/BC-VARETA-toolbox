# BC-VARETA toolbox

Tool for MEEG data processing based on Brain Connectivity Variable Resolution Tomographic Analysis (BC-VARETA) Model. 
See description of BC-VARETA and example in simulations at the link https://github.com/dpazlinares/BC-VARETA.

data folder with data (time series), leadfield, surface, and electrode info is hosted in Onedrive:
https://lstneuro-my.sharepoint.com/:u:/g/personal/eduardo_g_m_neuroinformatics-collaboratory_org/ETBz-35Qob5PkvTgnHSOKDUBl3NEMSKQ61PyW2AB3f2F_A?e=JCYw9X

Main Function for MEEG real data analysis
- Main (**call this function**).
  
  Inputs:
   - data: subfolder containing the EEG data, leadfield, sufraces.
 
   Outputs:
   - results: subfolder containing the bc-vareta outputs
  
Complementary Functions
- xspectrum: computes the spectra of the simulated scalp activity 
- bcvareta: executes BC-VARETA method
- bcvareta_initial_values: computes 'bcvareta' initialization
- screening_ssbl: extracts the posibly active generators as part of 'bcvareta_initial_values', using the Elastic Net Structured Sparse Bayesian Learning
- trascendent_term: nonlinear function for regularization parameters estimation within the function 'screening_ssbl'     
- screening: applies a smoothing to the outputs of 'screening_ssbl'



% Authors:
% - Deirel Paz Linares
% - Eduardo Gonzalez Moreira
% - Pedro A. Valdes Sosa

% Date: September 15, 2018
