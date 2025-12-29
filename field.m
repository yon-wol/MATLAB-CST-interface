% Connect to CST
clc;
clear;
close all;
cst = actxserver('CSTStudio.Application');
mws = cst.invoke('OpenFile', 'Dualband filterDualband filter.cst'); % Fix filename (remove spaces/special chars)

% ===== Get 3D Fields =====
% First select the tree item before accessing results
mws.invoke('SelectTreeItem', '2D/3D Results\E-Field\E-field_10GHz');
eField = mws.invoke('Result3D', 'e-field'); % Note lowercase 'e-field'
eFieldData = eField.invoke('GetArray'); % [X,Y,Z,real,imag]

mws.invoke('SelectTreeItem', '2D/3D Results\H-Field\H-field_10GHz');
hField = mws.invoke('Result3D', 'h-field');
hFieldData = hField.invoke('GetArray');

% ===== Get 2D Cuts =====
mws.invoke('Plot', 'E-field_10GHz', 'xy', 0); % Create XY plot at Z=0
eField2D = mws.invoke('GetPlotData'); % [X,Y,real,imag]

% ===== Visualization =====
figure;
imagesc(abs(eField2D(:,:,1) + 1i*eField2D(:,:,2))); % Magnitude
title('E-field at 10GHz (XY Plane)');
colorbar;