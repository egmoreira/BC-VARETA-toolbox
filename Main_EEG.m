%% BC-VARETA toolbox v8.1

% Includes the routines of the Brain Connectivity Variable Resolution
% Tomographic Analysis (BC-VARETA), an example for real EEG analysis.
% BC-VARETA toolbox extracts the Source Activity and Connectivity given
% a single frequency component in the Fourier Transform Domain of an
% Individual MEEG Data. See the pdf file "Brief of Theory and Results"
% for an insight to this methodology.

% Authors:
% - Deirel Paz Linares
% - Eduardo Gonzalez Moreira
% - Pedro A. Valdes Sosa

% Date: September 15, 2018

%% cleaning...
clear all;
clc;
close all;
%% loading data...
load('data/EEG_data.mat');
load('data/mycolormap_brain_basic_conn.mat');
load('data/CUBAN_DATA_6k_15k_INFO.mat');
[Ne1,Np1] = size(K_6k);
Nseg      = 5e2;
snr       = 1;
snr_ch    = 1;
verbosity = 1;
%% applying 
disp('applying average reference...');
Nf = length(F);
for jj = 1:Nf
    [Svv_channel(:,:,jj),K_6k] = applying_reference(Svv_channel(:,:,jj),K_6k);    % applying average reference...
end
%% alpha peak picking and psd visualization...
peak_pos = 27;
Svv = Svv_channel(:,:,peak_pos);
PSD_log = 10*log10(abs(PSD));
min_psd = min(PSD_log(:));
max_psd = max(PSD_log(:));
plot_peak = min_psd*ones(Nf,1);
plot_peak(peak_pos) = max_psd;
figure('Color','k'); hold on;
plot(F,PSD_log);
plot(F,plot_peak,'--w');
set(gca,'Color','k','XColor','w','YColor','w');
ylabel('PSD (dB)','Color','w');
xlabel('Freq. (Hz)','Color','w');
title('Power Spectral Density','Color','w');
pause(1e-10);
%% inverse covariance matrix...
Nelec = size(K_6k,1);
Svv_inv = sqrt(Svv*Svv+4*eye(Nelec))-Svv;
%% electrodes space visualization...
X = zeros(length(elect_58_343.conv_ASA343),1);
Y = zeros(length(elect_58_343.conv_ASA343),1);
Z = zeros(length(elect_58_343.conv_ASA343),1);
for ii = 1:length(elect_58_343.conv_ASA343)
    X(ii) = ASA_343.Channel(elect_58_343.conv_ASA343{ii}).Loc(1);
    Y(ii) = ASA_343.Channel(elect_58_343.conv_ASA343{ii}).Loc(2);
    Z(ii) = ASA_343.Channel(elect_58_343.conv_ASA343{ii}).Loc(3);
end
C = abs(diag(Svv));
C = C/max(C);
C(C<0.01) = 0;
figure('Color','k'); hold on; set(gca,'Color','k');
scatter3(X,Y,Z,100,C.^1,'filled');
patch('Faces',S_h.Faces,'Vertices',S_h.Vertices,'FaceVertexCData',0.01*(ones(length(S_h.Vertices),1)),'FaceColor','interp','EdgeColor','none','FaceAlpha',.35);
colormap(gca,cmap_a);
az = 0; el = 0;
view(az, el);
title('Scalp','Color','w','FontSize',16);
temp_diag  = diag(diag(abs(Svv_inv)));
temp_ndiag = abs(Svv_inv)-temp_diag;
temp_ndiag = temp_ndiag/max(temp_ndiag(:));
temp_diag  = diag(abs(diag(Svv)));
temp_diag  = temp_diag/max(temp_diag(:));
temp_diag  = diag(diag(temp_diag)+1);
temp_comp  = temp_diag+temp_ndiag;
figure('Color','k');
imagesc(temp_comp);
set(gca,'Color','k','XColor','w','YColor','w','ZColor','w',...
    'XTick',1:length(elect_58_343.conv_ASA343),'YTick',1:length(elect_58_343.conv_ASA343),...
    'XTickLabel',elect_58_343.label,'XTickLabelRotation',90,...
    'YTickLabel',elect_58_343.label,'YTickLabelRotation',0);
xlabel('electrodes','Color','w');
ylabel('electrodes','Color','w');
colormap(gca,cmap_c);
colorbar;
axis square;
title('Scalp','Color','w','FontSize',16);
pause(1e-12);
%% bc-vareta toolbox...
[ThetaJJ,SJJ,indms] = bcvareta(Svv,K_6k,Nseg,S_6k.Vertices,S_6k.Faces);
sources_iv          = zeros(length(K_6k),1);
sources_iv(indms)   = abs(diag(SJJ));
sources_iv          = sources_iv/max(sources_iv(:));
ind_zr              = sources_iv < 0.01;
sources_iv(ind_zr)  = 0;
figure('Color','k'); hold on;
patch('Faces',S_6k.Faces,'Vertices',S_6k.Vertices,'FaceVertexCData',sources_iv,'FaceColor','interp','EdgeColor','none','FaceAlpha',.85);
set(gca,'Color','k');
az = 0; el = 0;
view(az,el);
colormap(gca,cmap_a);
title('BC-VARETA','Color','w','FontSize',16);
temp_iv    = abs(SJJ);
connect_iv = abs(ThetaJJ);
temp       = abs(connect_iv);
temp_diag  = diag(diag(temp));
temp_ndiag = temp-temp_diag;
temp_ndiag = temp_ndiag/max(temp_ndiag(:));
temp_diag  = diag(abs(diag(temp_iv)));
temp_diag  = temp_diag/max(temp_diag(:));
temp_diag  = diag(diag(temp_diag)+1);
temp_comp  = temp_diag+temp_ndiag;
label_gen = [];
for ii = 1:length(indms)
    label_gen{ii} = num2str(ii);
end
figure('Color','k');
imagesc(temp_comp);
set(gca,'Color','k','XColor','w','YColor','w','ZColor','w',...
    'XTick',1:length(indms),'YTick',1:length(indms),...
    'XTickLabel',label_gen,'XTickLabelRotation',90,...
    'YTickLabel',label_gen,'YTickLabelRotation',0);
xlabel('sources','Color','w');
ylabel('sources','Color','w');
colorbar;
colormap(gca,cmap_c);
axis square;
title('BC-VARETA','Color','w','FontSize',16);
pause(1e-12);
%% saving...
save('results/EEG_real.mat','ThetaJJ','SJJ','indms');

