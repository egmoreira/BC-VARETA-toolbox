# BC-VARETA toolbox

Tool for MEEG data processing based on Brain Connectivity Variable Resolution Tomographic Analysis (BC-VARETA) Model. 
See description of BC-VARETA and example in simulations at the link https://github.com/dpazlinares/BC-VARETA.

References:

Paz-Linares, D., Gonzalez-Moreira, E., Martinez-Montes, E. and Valdes-Sosa, P.A., 2018. Note on the Estimation of Embedded Hermitian Gaussian Graphical Models for MEEG Source Activity and Connectivity Analysis in the Frequency Domain. Part I: Single Frequency Component and Subject. arXiv preprint arXiv:1810.01174. https://arxiv.org/abs/1810.01174

Paz-Linares, D., Gonzalez-Moreira, E., Martinez-Montes, E., Valdes-Hernandez, P.A., Bosch-Bayard, J., Bringas-Vega, M.L. and Valdes-Sosa, P.A., 2018. Caulking the Leakage Effect in MEEG Source Connectivity Analysis. arXiv preprint arXiv:1810.00786. https://arxiv.org/abs/1810.00786

Example of data structure (time series, leadfield, surface, and electrodes) is hosted in Onedrive:

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
