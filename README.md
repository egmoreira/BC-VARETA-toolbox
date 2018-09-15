# BC-VARETA toolbox

Tool for MEEG data processing based on Brain Connectivity Variable Resolution
Tomographic Analysis (BC-VARETA) Model.

BC-VARETA toolbox extracts the Source Activity and Connectivity given
a single frequency component in the Fourier Transform Domain of an
Individual MEEG Data. 

See the pdf file "Brief of Theory and Results" for an insight to this methodology.

Functions and folder:
- Main_EEG (**call this function**): Analysis of MEEG real data
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
