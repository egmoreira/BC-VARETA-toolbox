# BC-VARETA toolbox

Includes the routines of the Brain Connectivity Variable Resolution
Tomographic Analysis (BC-VARETA). Also an example for real EEG analysis
is achieved by using Main_EEG function.

BC-VARETA toolbox extracts the Source Activity and Connectivity given
a single frequency component in the Fourier Transform Domain of an
Individual MEEG Data. 

See the pdf file "Brief of Theory and Results" for an insight to this methodology.

Functions and folder:
- Main (**execute this routine for demosntration**): Analysis of EEG real data by BC-VARETA toolbox
- xspectrum: computes the spectra of the simulated scalp activity 
- bcvareta: executes BC-VARETA method
- bcvareta_initial_values: computes 'bcvareta' initialization
- screening_ssbl: extracts the posibly active generators as part of 'bcvareta_initial_values', using the Elastic Net Structured Sparse Bayesian Learning
- trascendent_term: nonlinear function for regularization parameters estimation within the function 'screening_ssbl'     
- screening: applies a smoothing to the outputs of 'screening_ssbl'
- data: subfolder containing the EEG data, leadfield, sufraces.
- results: subfolder containing the bc-vareta outputs

% Authors:
% - Deirel Paz Linares
% - Eduardo Gonzalez Moreira
% - Pedro A. Valdes Sosa

% Date: September 15, 2018
