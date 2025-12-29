
% addpath('functions.m');

clc;
clear;
close all;  

%%CST file initialization
cst = actxserver('CSTStudio.application');% First load the CST application control
mws = invoke(cst, 'NewMWS');%Create a new MWS project
app = invoke(mws, 'GetApplicationName');% Get the current application name
ver = invoke(mws, 'GetApplicationVersion');% Get the current application version number
% mws.invoke('ChangeSolverType', 'HF Frequency Domain'); % Project-level setting
% Check actual solver state

% invoke(mws, 'FileNew');%Create a new CST file
path=pwd;% Get the current m folder path
filename=' 1.cst';%The name of the new CST file
fullname=[path filename];
% invoke(mws, 'SaveAs', fullname, 'True');%True means saving the results so far
invoke(mws, 'DeleteResults');%Delete the previous results. Note: When modifying the model when there are results, a pop-up window will appear prompting whether to delete the results. The running program will stop and you need to wait for the pop-up window to disappear manually.
%%CST file initialization completed

set_parameters(mws); %initialization of parameters

initialize_units(mws);                         % Initialize units

 set_frequency(mws, [30, 50]);
% Set frequency range




set_background(mws);                           % Set background
set_boundary(mws);                             % Set boundary conditions
create_material(mws, 2.2);                    % Create material with εr=2.2

%%Modeling starts
%%Calling the Brick object to start
% Str_Name='Ground1';
% Str_Component='copper';
% Str_Material='Copper (annealed)';
% Xrange='"-L/2-l1","L/2+l1"';
% Yrange='"-W/2-w1","W/2+w1"';
% Zrange='"-h2-h","-h2"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)
% 
% Str_Name='substrate3';
% Str_Component='Rogers';
% Str_Material='material1';
% Xrange='"-L/2-l1","L/2+l1"';
% Yrange='"-W/2-w1","W/2+w1"';
% Zrange='"-h2","0"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)

Str_Name='Ground';
Str_Component='copper';
Str_Material='Copper (annealed)';
Xrange='"-L/2+V2-V1","L/2-V2+V1"';
Yrange='"-W/2+c1-im1","W/2-c1+im1"';
Zrange='"0","h"';
Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)



Str_Name='substrate1';
Str_Component='Rogers';
Str_Material='material1';
Xrange='"-L/2-l1","L/2+l1"';
Yrange='"-W/2-w1","W/2+w1+w2"';
Zrange='"h","h1"';
Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)


% Str_Name='Middle_top layer';
% Str_Component='copper';
% Str_Material='Copper (annealed)';
% Xrange='"-L/2-l1","L/2+l1"';
% Yrange='"-W/2-w1","W/2+w1"';
% Zrange='"h1","h1"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)

Str_Name='substrate2';
Str_Component='Rogers';
Str_Material='material1';
Xrange='"-L/2-l1","L/2+l1"';
Yrange='"-W/2-w1","W/2+w1+w2"';
Zrange='"h1","h1+h2"';
Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)

Str_Name='top layer';
Str_Component='copper';
Str_Material='Copper (annealed)';
Xrange='"-L/2-l1","L/2+l1"';
Yrange='"-W/2-w1","W/2+w1+w2"';
Zrange='"h1+h2","h1+h+h2"';
Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)

Str_Name='cut1';
Str_Component='copper';
Str_Material='Copper (annealed)';
Xrange='"-L/2+T2","L/2-T2"';
Yrange='"W/2-c1+Y1","W/2-c1"';
Zrange='"h1+h2","h1+h2+h"';
Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)

% Str_Name='taperp1';
% Str_Component='copper';
% Origin= '"0.0", "0.0","h1+h2"';
% Uvector= '"1.0","0.0","0.0"';
% Vvector= '"0.0","1.0","0.0"';
% Point='"-L/2-l1", "W/2-c1-T1-0.1"';
% LineTo1='"-L/2-l1+1","W/2-c1-T1-0.15"';
% LineTo2='"-L/2-l1+1","W/2-c1-T1-0.15"';
% LineTo3='"-L/2-l1","W/2-c1-T1-0.4"';
% CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)
% 
% Str_Name='taperp2';
% Str_Component='copper';
% Origin= '"0.0", "0.0","h1+h2"';
% Uvector= '"1.0","0.0","0.0"';
% Vvector= '"0.0","1.0","0.0"';
% Point='"L/2+l1", "W/2-c1-T1-0.1"';
% LineTo1='"L/2+l1-1","W/2-c1-T1-0.15"';
% LineTo2='"L/2+l1-1","W/2-c1-T1-0.15"';
% LineTo3='"L/2+l1","W/2-c1-T1-0.4"';
% CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)



Str_Name='cut2';
Str_Component='copper';
Str_Material='Copper (annealed)';
Xrange='"-L/2+T2","L/2-T2"';
Yrange='"-W/2+c1-Y1","-W/2+c1"';
Zrange='"h1+h2","h1+h2+h"';
Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)

% Str_Name='line1';
% Str_Component='copper';
% Str_Material='Copper (annealed)';
% Xrange='"-L/2+T2","L/2-T2"';
% Yrange='"-W/2+c1-Y1-1+0.5","-W/2+c1-0.5"';
% Zrange='"h1+h2","h1+h2+h"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)


Str_Name='taper1';
Str_Component='copper';
Origin= '"0.0", "0.0","h1+h2"';
Uvector= '"1.0","0.0","0.0"';
Vvector= '"0.0","1.0","0.0"';
Point='"-L/2-l1", "W/2-c1-T1"';
LineTo1='"-L/2+T2","W/2-c1+Y2"';
LineTo2='"-L/2+T2","W/2-c1"';
LineTo3='"-L/2-l1","W/2-c1-T1-Y2"';
CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)

Str_Name='taper2';
Str_Component='copper';
Origin= '"0.0", "0.0","h1+h2"';
Uvector= '"1.0","0.0","0.0"';
Vvector= '"0.0","1.0","0.0"';
Point='"-L/2-l1", "-W/2+c1+T1"';
LineTo1='"-L/2+T2","-W/2+c1-Y2"';
LineTo2='"-L/2+T2","-W/2+c1"';
LineTo3='"-L/2-l1","-W/2+c1+T1+Y2"';
CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)

Str_Name='taper3';
Str_Component='copper';
Origin= '"0.0", "0.0","h1+h2"';
Uvector= '"1.0","0.0","0.0"';
Vvector= '"0.0","1.0","0.0"';
Point='"L/2+l1", "W/2-c1-T1';
LineTo1='"L/2-T2","W/2-c1+Y2"';
LineTo2='"L/2-T2","W/2-c1"';
LineTo3='"L/2+l1","W/2-c1-T1-Y2"';
CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)
% 
Str_Name='taper4';
Str_Component='copper';
Origin= '"0.0", "0.0","h1+h2"';
Uvector= '"1.0","0.0","0.0"';
Vvector= '"0.0","1.0","0.0"';
Point='"L/2+l1", "-W/2+c1+T1"';
LineTo1='"L/2-T2","-W/2+c1-Y2"';
LineTo2='"L/2-T2","-W/2+c1"';
LineTo3='"L/2+l1","-W/2+c1+T1+Y2"';
CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)

% Str_Name='taper5';
% Str_Component='copper';
% Origin= '"0.0", "0.0","h1+h2"';
% Uvector= '"1.0","0.0","0.0"';
% Vvector= '"0.0","1.0","0.0"';
% Point='"-L/2+p_3-Tap_1", "-W/2+c1"';
% LineTo1='"-L/2+p_3+w_3+Tap_1","-W/2+c1"';
% LineTo2='"-L/2+p_3+w_3","-W/2+c1-Tap_2"';
% LineTo3='"-L/2+p_3","-W/2+c1-Tap_2"';
% CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)
% 
% Str_Name='taper6';
% Str_Component='copper';
% Origin= '"0.0", "0.0","h1+h2"';
% Uvector= '"1.0","0.0","0.0"';
% Vvector= '"0.0","1.0","0.0"';
% Point='"L/2-p_3+Tap_1",       "-W/2+c1"';
% LineTo1='"L/2-p_3-w_3-Tap_1", "-W/2+c1"';
% LineTo2='"L/2-p_3-w_3",       "-W/2+c1-Tap_2"';
% LineTo3='"L/2-p_3",           "-W/2+c1-Tap_2"';
% CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)


% Str_Name='MS1';
% Str_Component='copper';
% Str_Material='Copper (annealed)';
% Xrange='"-L/2-l1","-L/2-l1/2"';
% Yrange='"W/2-c1-T1-Y2","W/2-c1-T1"';
% Zrange='"h1+h2","h1+h2+h"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)
% 
% Str_Name='MS2';
% Str_Component='copper';
% Str_Material='Copper (annealed)';
% Xrange='"-L/2-l1","-L/2-l1/2"';
% Yrange='"-W/2+c1+T1+Y2","-W/2+c1+T1"';
% Zrange='"h1+h2","h1+h2+h"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)
% 
% 
% Str_Name='MS3';
% Str_Component='copper';
% Str_Material='Copper (annealed)';
% Xrange='"L/2+l1","L/2+l1/2"';
% Yrange='"W/2-c1-T1-Y2","W/2-c1-T1"';
% Zrange='"h1+h2","h1+h2+h"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)
% 
% Str_Name='MS4';
% Str_Component='copper';
% Str_Material='Copper (annealed)';
% Xrange='"L/2+l1","L/2+l1/2"';
% Yrange='"-W/2+c1+T1+Y2","-W/2+c1+T1"';
% Zrange='"h1+h2","h1+h2+h"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)



% Str_Name='taper5';
% Str_Component='copper';
% Origin= '"0.0", "0.0","0"';
% Uvector= '"1.0","0.0","0.0"';
% Vvector= '"0.0","1.0","0.0"';
% Point='"L/2+l1", "W/2-c1-T3+0.5"';
% LineTo1='"L/2-v2+v1","W/2-c1"';
% LineTo2='"L/2-v2+v1","-W/2+c1"';
% LineTo3='"L/2+l1","W/2-c1-T3-0.5"';
% CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)
% 
% Str_Name='taper6';
% Str_Component='copper';
% Origin= '"0.0", "0.0","0"';
% Uvector= '"1.0","0.0","0.0"';
% Vvector= '"0.0","1.0","0.0"';
% Point='"-L/2-l1", "W/2-c1-T3+0.5"';
% LineTo1='"-L/2+v2-v1","W/2-c1"';
% LineTo2='"-L/2+v2-v1","-W/2+c1"';
% LineTo3='"-L/2-l1","W/2-c1-T3-0.5"';
% CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Material definitions
componentType = 'copper';
material = 'Copper (annealed)';

% Component configurations [Name, X-range, Y-range, Z-range]
components = {
    % {'SIW_port1', '"-L/2+p_3", "-L/2+p_3+w_3"', '"-W/2-w1","-W/2+c1"', '"h1+h2","h1+h+h2"'},
    % {'SIW_port2', '"L/2-p_3-w_3", "L/2-p_3"',   '"-W/2-w1","-W/2+c1"', '"h1+h2","h1+h+h2"'},
    % {'SIW_port3', '"-L/2+p_3", "-L/2+p_3+w_3"', '"-W/2-w1","-W/2+c1"', '"0","h"'},
    % {'SIW_port4', '"L/2-p_3-w_3", "L/2-p_3"', '"-W/2-w1","-W/2+c1"', '"0","h"'},
   % 
   %  {'MSL1', '"-L/2+p_3-(w_4-w_3)/2", "-L/2+p_3+w_3+(w_4-w_3)/2"', '"-W/2-w1+1","-W/2-w1+2"', '"h1+h2","h1+h+h2"'},
   %  {'MSL2', '"L/2-p_3-w_3-(w_4-w_3)/2", "L/2-p_3+(w_4-w_3)/2"', '"-W/2-w1+1","-W/2-w1+2"', '"h1+h2","h1+h+h2"'},
   %  {'MSL3', '"-L/2+p_3-(w_5-w_3)/2", "-L/2+p_3+w_3+(w_5-w_3)/2"', '"-W/2-w1","-W/2-w1+1"', '"h1+h2","h1+h+h2"'},
   %  {'MSL4', '"L/2-p_3-w_3-(w_5-w_3)/2", "L/2-p_3+(w_5-w_3)/2"', '"-W/2-w1","-W/2-w1+1"', '"h1+h2","h1+h+h2"'},
   % % 
   % 
   %  {'CPW_port1', '"-L/2+p_3-cpw", "-L/2+p_3+w_3+cpw"', '"-W/2-w1","-W/2+c1"', '"h1+h2","h1+h+h2"'}, 
   %  {'CPW_port2', '"L/2-p_3-w_3-cpw", "L/2-p_3+cpw"',   '"-W/2-w1","-W/2+c1"', '"h1+h2","h1+h+h2"'},
   % % 
   %  {'Air bridge1', '"L/2-p_3+cpw", "L/2-p_3+A1+cpw"'             ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h","h1+h+h2+h3"'},
   %  {'Air bridge2', '"L/2-p_3-w_3-cpw-A1", "L/2-p_3-w_3-cpw"'     ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h","h1+h+h2+h3"'},
   %  {'Air bridge3', '"L/2-p_3-w_3-A1-cpw", "L/2-p_3+A1+cpw"'      ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h+h4","h1+h2+h+h3"'},
    % {'Air bridge3_1', '"L/2-p_3-w_3-A1-cpw", "L/2-p_3+A1+cpw"'      ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"','"h1+h2+b2*h+3*h","h1+b3*h+h2+3*h"'},
   %  % {'Air bridge1_2', '"L/2-p_3+cpw+A1", "L/2-p_3+A1+cpw+h"'             ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h","h1+b3*h+h2"'},
   %  % {'Air bridge2_2', '"L/2-p_3-w_3-cpw-A1-h", "L/2-p_3-w_3-cpw-A1"'             ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h","h1+b3*h+h2"'},
   %  % 
   %  % {'Air bridge1_3', '"L/2-p_3+cpw+A1", "L/2-p_3+A1+cpw+h"'             ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+h","h1+b3*h+h2"'},
   %  % {'Air bridge2_3', '"L/2-p_3-w_3-cpw-A1-h", "L/2-p_3-w_3-cpw-A1"'     ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+h","h1+b3*h+h2"'},
   % 
   %  % {'Air bridgeslot1', '"L/2-p_3-w_3-A1-cpw", "L/2-p_3+A1+cpw"'      ,'"-W/2+c1-Y1","-W/2+c1"', '"h1+h2+3*h","h1+4*h+h2"'},
   %  % 
   %  % 
    % {'Air bridge4', '"-L/2+p_3-cpw", "-L/2+p_3-A1-cpw"'           ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h","h1+h+h2+h3"'},
    % {'Air bridge5', '"-L/2+p_3+w_3+A1+cpw", "-L/2+p_3+w_3+cpw"'   ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h","h1+h+h2+h3"'},
    % {'Air bridge6', '"-L/2+p_3+w_3+A1+cpw", "-L/2+p_3-A1-cpw"'    ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h+0.2","h1+h2+h+h3"'},
    % {'Air bridge6_1', '"-L/2+p_3+w_3+A1+cpw", "-L/2+p_3-A1-cpw"'  ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+b2*h+3*h","h1+b3*h+h2+3*h"'},
   %  % {'Air bridge4_2', '"-L/2+p_3-cpw-A1", "-L/2+p_3-A1-cpw-h"'             ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h","h1+b3*h+h2"'},
   %  % {'Air bridge5_2', '"-L/2+p_3+w_3+cpw+A1+h", "-L/2+p_3+w_3+cpw+A1"'             ,'"-W/2+c1-Y2","-W/2+c1-Y2-A1"', '"h1+h2+h","h1+b3*h+h2"'},
   %  % {'Air bridge4_3', '"-L/2+p_3-cpw-A1", "-L/2+p_3-A1-cpw-h"'             ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+h","h1+b3*h+h2"'},
   %  % {'Air bridge5_3', '"-L/2+p_3+w_3+cpw+A1+h", "-L/2+p_3+w_3+cpw+A1"'     ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+h","h1+b3*h+h2"'},
   % 
   % 
   %  % % {'Air bridgeslot2', '"-L/2+p_3+w_3+A1+cpw", "-L/2+p_3-A1-cpw"'    ,'"-W/2+c1-Y1","-W/2+c1"', '"h1+h2+3*h","h1+4*h+h2"'},
   %  % 
   %  % % {'Air bridge1_1', '"L/2-p_3+cpw", "L/2-p_3+A1+cpw"'             ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+h","h1+b1*h+h2"'},
   %  % % {'Air bridge2_1', '"L/2-p_3-w_3-cpw-A1", "L/2-p_3-w_3-cpw"'     ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+h","h1+b1*h+h2"'},
   %  % % {'Air bridge3_1', '"L/2-p_3-w_3-A1-cpw", "L/2-p_3+A1+cpw"'      ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+b2*h","h1+b3*h+h2"'},
   %  % % {'Air bridge4_1', '"-L/2+p_3-cpw", "-L/2+p_3-A1-cpw"'           ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+h","h1+b1*h+h2"'},
   %  % % {'Air bridge5_1', '"-L/2+p_3+w_3+A1+cpw", "-L/2+p_3+w_3+cpw"'   ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+h","h1+b1*h+h2"'},
   %  % % {'Air bridge6_1', '"-L/2+p_3+w_3+A1+cpw", "-L/2+p_3-A1-cpw"'    ,'"-W/2+c1","-W/2+c1+A1"', '"h1+h2+b2*h","h1+b3*h+h2"'},
   %  % 
   % 
   % 
   % 
   % 
   % 
   % 
   % 
   % %  {'Slot1', '"-L/2+p_3-6", "-L/2+p_3+w_3-5"', '"-W/2-w1","-W/2+c1"', '"h1+h2","h1+h+h2"'}, 
   % % {'Slot2', '"L/2-p_3-w_3+5", "L/2-p_3+6"', '"-W/2-w1","-W/2+c1"', '"h1+h2","h1+h+h2"'},
   % %  {'Stub1', '"-L/2+p_3-5.5", "-L/2+p_3+w_3-5.5"', '"-W/2-w1","-W/2+c1+1"', '"h1+h2","h1+h+h2"'}, 
   % % {'Stub2', '"L/2-p_3-w_3+5.5", "L/2-p_3+5.5"', '"-W/2-w1","-W/2+c1+1"', '"h1+h2","h1+h+h2"'},
   % % 
   % % {'Slot3', '"-L/2+p_3-0.2", "-L/2+p_3+w_3+0.2"', '"W/2+w1-1.3","W/2-c1"', '"h1+h2","h1+h+h2"'}, 
   % % {'Slot4', '"L/2-p_3-w_3-0.2", "L/2-p_3+0.2"', '"W/2+w1-1.3","W/2-c1"', '"h1+h2","h1+h+h2"'},
   % % {'Stub3', '"-L/2+p_3+0.5", "-L/2+p_3+w_3-0.5"', '"W/2+w1-1.5","W/2-c1-1"', '"h1+h2","h1+h+h2"'}, 
   % % {'Stub4', '"L/2-p_3-w_3+0.5", "L/2-p_3-0.5"', '"W/2+w1-1.5","W/2-c1-1"', '"h1+h2","h1+h+h2"'},
   % % 
   % 

    % {'CPW_port1_1', '"-L/2-l1", "-L/2"', '"-W/2+c1-Y2","-W/2+c1+Y2"', '"h1+h2","h1+h+h2"'}, 
    % {'CPW_port2_1', '"-L/2-l1", "-L/2"', '"W/2-c1+Y2","W/2-c1-Y2"', '"h1+h2","h1+h+h2"'},
    % {'CPW_port1_2', '"L/2+l1", "L/2"', '"-W/2+c1-Y2","-W/2+c1+Y2"', '"h1+h2","h1+h+h2"'}, 
    % {'CPW_port2_2', '"L/2+l1", "L/2"', '"W/2-c1+Y2","W/2-c1-Y2"', '"h1+h2","h1+h+h2"'},
    % {'DGS1', '"-L/2-l1", "-L/2+v2-v1"', '"-W/2","W/2"', '"0","h"'},
    % {'DGS2', '"L/2+l1", "L/2-v2+v1"', '"-W/2","W/2"', '"0","h"'},
    % {'cut3', '"-L/2","L/2"', '"W/2+w1+W2","W/2-c1"', '"0","h"'},
    % {'cut4', '"-L/2","L/2"', '"-W/2-w1","-W/2+c1"', '"0","h"'}
};

% Create components in CST
for i = 1:length(components)
    comp = components{i};
    Cstbrick(mws, comp{1}, componentType, material, comp{2}, comp{3}, comp{4});
end


% Str_Name='Airsub1';
% Str_Component='Rogers';
% Str_Material='material1';
% Xrange='"L/2-p_3-w_3-A1-cpw", "L/2-p_3+A1+cpw"';
% Yrange='"-W/2+c1+Y2","-W/2+c1-Y2-A1"';
% Zrange='"h1+h2+b1*h","h1+b2*h+h2"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)
% 
% Str_Name='Airsub2';
% Str_Component='Rogers';
% Str_Material='material1';
% Xrange='"-L/2+p_3+w_3+A1+cpw", "-L/2+p_3-A1-cpw"';
% Yrange='"-W/2+c1+Y2","-W/2+c1-Y2-A1"';
% Zrange='"h1+h2+b1*h","h1+b2*h+h2"';
% Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)


% % Material definitions
% componentType = 'Rogers';
% material = 'material1';
% components = {
%    {'Air bridgesub1', '"-L/2+p_3-A2", "-L/2+p_3"'             ,'"-W/2+c1-Y1","-W/2+c1"', '"h1","h1+b2*h+h2"'},
%     {'Air bridgesub2', '"-L/2+p_3+w_3", "-L/2+p_3+w_3+A2"'     ,'"-W/2+c1-Y1","-W/2+c1"', '"h1","h1+b2*h+h2"'},
%     {'Air bridgesub3', '"L/2-p_3+A2",   "L/2-p_3"'             ,'"-W/2+c1-Y1","-W/2+c1"', '"h1","h1+b2*h+h2"'},
%     {'Air bridgesub4', '"L/2-p_3-w_3",  "L/2-p_3-w_3-A2"'     ,'"-W/2+c1-Y1","-W/2+c1"', '"h1","h1+b2*h+h2"'}, 
% };
% % Create components in CST
% for i = 1:length(components)
%     comp = components{i};
%     Cstbrick(mws, comp{1}, componentType, material, comp{2}, comp{3},comp{4});
% end
% 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Material definitions
componentType = 'copper';
material = 'Copper (annealed)';

% Component configurations [Name, X-range, Y-range, Z-range]
components = {

    % {'EBG1_1', '"-L/2+E1_1+Tr5", "-L/2+E1_2+Tr5"', '"W/2+w1-E1_3","W/2+w1-E1_4"', '"h1+h2","h1+h+h2"'},
    % {'EBG1_2', '"-L/2+E2_1+Tr5", "-L/2+E2_2+Tr5"', '"W/2+w1-E2_3","W/2+w1-E2_4"', '"h1+h2","h1+h+h2"'},
    % {'EBG1_3', '"-L/2+E3_1+Tr5", "-L/2+E3_2+Tr5"', '"W/2+w1-E3_3","W/2+w1-E3_4"', '"h1+h2","h1+h+h2"'},
    % {'EBG1_4', '"-L/2+E4_1+Tr5", "-L/2+E4_2+Tr5"', '"W/2+w1-E4_3","W/2+w1-E4_4"', '"h1+h2","h1+h+h2"'},
    % 
    % 
    % {'EBG2_1', '"L/2-E1_1+Tr6", "L/2-E1_2+Tr6"', '"W/2+w1-E1_3","W/2+w1-E1_4"', '"h1+h2","h1+h+h2"'},
    % {'EBG2_2', '"L/2-E2_1+Tr6", "L/2-E2_2+Tr6"', '"W/2+w1-E2_3","W/2+w1-E2_4"', '"h1+h2","h1+h+h2"'},
    % {'EBG2_3', '"L/2-E3_1+Tr6", "L/2-E3_2+Tr6"', '"W/2+w1-E3_3","W/2+w1-E3_4"', '"h1+h2","h1+h+h2"'},
    % {'EBG2_4', '"L/2-E4_1+Tr6", "L/2-E4_2+Tr6"', '"W/2+w1-E4_3","W/2+w1-E4_4"', '"h1+h2","h1+h+h2"'},

    % {'EBG3_1', '"-L/2+E1_1+Tr1", "-L/2+E1_2+Tr1"', '"W/2+w1-E1_3","W/2+w1-E1_4"', '"0","h"'},
    % {'EBG3_2', '"-L/2+E2_1+Tr1", "-L/2+E2_2+Tr1"', '"W/2+w1-E2_3","W/2+w1-E2_4"', '"0","h"'},
    % {'EBG3_3', '"-L/2+E3_1+Tr1", "-L/2+E3_2+Tr1"', '"W/2+w1-E3_3","W/2+w1-E3_4"', '"0","h"'},
    % {'EBG3_4', '"-L/2+E4_1+Tr1", "-L/2+E4_2+Tr1"', '"W/2+w1-E4_3","W/2+w1-E4_4"', '"0","h"'},
    % % 
    % {'EBG4_1', '"-L/2+E1_1+Tr2", "-L/2+E1_2+Tr2"', '"W/2+w1-E1_3","W/2+w1-E1_4"', '"x","y"'},
    % {'EBG4_2', '"-L/2+E2_1+Tr2", "-L/2+E2_2+Tr2"', '"W/2+w1-E2_3","W/2+w1-E2_4"', '"x","y"'},
    % {'EBG4_3', '"-L/2+E3_1+Tr2", "-L/2+E3_2+Tr2"', '"W/2+w1-E3_3","W/2+w1-E3_4"', '"x","y"'},
    % {'EBG4_4', '"-L/2+E4_1+Tr2", "-L/2+E4_2+Tr2"', '"W/2+w1-E4_3","W/2+w1-E4_4"', '"x","y"'},
    % 
    % {'EBG5_1', '"-L/2+E1_1+Tr3", "-L/2+E1_2+Tr3"', '"W/2+w1-E1_3","W/2+w1-E1_4"', '"x","y"'},
    % {'EBG5_2', '"-L/2+E2_1+Tr3", "-L/2+E2_2+Tr3"', '"W/2+w1-E2_3","W/2+w1-E2_4"', '"x","y"'},
    % {'EBG5_3', '"-L/2+E3_1+Tr3", "-L/2+E3_2+Tr3"', '"W/2+w1-E3_3","W/2+w1-E3_4"', '"x","y"'},
    % {'EBG5_4', '"-L/2+E4_1+Tr3", "-L/2+E4_2+Tr3"', '"W/2+w1-E4_3","W/2+w1-E4_4"', '"x","y"'},
    % 
    % {'EBG6_1', '"-L/2+E1_1+Tr4", "-L/2+E1_2+Tr4"', '"W/2+w1-E1_3","W/2+w1-E1_4"', '"x","y"'},
    % {'EBG6_2', '"-L/2+E2_1+Tr4", "-L/2+E2_2+Tr4"', '"W/2+w1-E2_3","W/2+w1-E2_4"', '"x","y"'},
    % {'EBG6_3', '"-L/2+E3_1+Tr4", "-L/2+E3_2+Tr4"', '"W/2+w1-E3_3","W/2+w1-E3_4"', '"x","y"'},
    % {'EBG6_4', '"-L/2+E4_1+Tr4", "-L/2+E4_2+Tr4"', '"W/2+w1-E4_3","W/2+w1-E4_4"', '"x","y"'},


};

% Create components in CST
for i = 1:length(components)
    comp = components{i};
    Cstbrick(mws, comp{1}, componentType, material, comp{2}, comp{3}, comp{4});
end






% % Material definitions
% componentType = 'copper';
% material = 'Copper (annealed)';
% components = {
%     {'stub1', '"-L/2+S1", "-L/2+S1_1"',               '"W/2-c1+g1", "W/2-c1+S1_2"', '"h1+h2","h1+h+h2"'}
%     % {'stub1-1', '"-L/2+S1+g3*g1", "-L/2+S1_1-g3*g1"', '"W/2-c1","W/2-c1+S1_2-g3*g1"', '"h1+h2","h1+h+h2"'}
%     {'stub2', '"-L/2+S2", "-L/2+S2_1"', '"W/2-c1+g1","W/2-c1+S2_2"', '"h1+h2","h1+h+h2"'}
%     % {'stub2-1', '"-L/2+S2+g3*g1", "-L/2+S2_1-g3*g1"', '"W/2-c1","W/2-c1+S2_2-g3*g1*0"', '"h1+h2","h1+h+h2"'}
%     % 
%     {'stub4', '"-L/2+S4", "-L/2+S4_1"', '"W/2-c1+g1", "W/2-c1+S4_2"', '"h1+h2","h1+h+h2"'}
%     % {'stub4-1', '"-L/2+S4+g3*g1", "-L/2+S4_1-g3*g1"', '"W/2-c1","W/2-c1+S4_2-g3*g1"', '"h1+h2","h1+h+h2"'}
%     {'stub5', '"-L/2+S5", "-L/2+S5_1"', '"-W/2+c1-g1","-W/2+c1-S5_2"', '"h1+h2","h1+h+h2"'}
%     {'stub5-1', '"-L/2+S5+g3*g1", "-L/2+S5_1-g3*g1"', '"-W/2+c1","-W/2+c1-S5_2"', '"h1+h2","h1+h+h2"'}
% 
%     % {'stub6', '"-L/2+S6", "-L/2+S6_1"',               '"-W/2+c1-g1","-W/2+c1-S6_2"','"h1+h2","h1+h+h2"'}
%     % {'stub6-1', '"-L/2+S6+g3*g1", "-L/2+S6_1-g3*g1"', '"-W/2+c1","-W/2+c1-S6_2"',   '"h1+h2","h1+h+h2"'}
%     % {'stub7', '"L/2-S7", "L/2-S7_1"',               '"-W/2+c1-g1","-W/2+c1-S7_2"','"h1+h2","h1+h+h2"'}
%     % {'stub7-1', '"L/2-S7-g3*g1", "L/2-S7_1+g3*g1"', '"-W/2+c1","-W/2+c1-S7_2"',   '"h1+h2","h1+h+h2"'}
%     % {'stub1_1', '"-L/2+T2",    "-L/2+S1"', '"W/2-c1","W/2-c1+x1"', '"h1+h2","h1+h+h2"'}
%     % {'stub2_1', '"-L/2+S1_1", "-L/2+S2"', '"W/2-c1","W/2-c1+x2"', '"h1+h2","h1+h+h2"'}
%     % {'stub3_1', '"-L/2+S2_1", "-L/2+S4"', '"W/2-c1","W/2-c1+x3"', '"h1+h2","h1+h+h2"'}
%     % {'stub5_1', '"-L/2+S4_1", "L/2-T2"', '"W/2-c1","W/2-c1+x5"', '"h1+h2","h1+h+h2"'}
%       % {'Cut_5', '"-L/2+2", "-L/2+p_3-cpw"', '"-W/2-w1","-W/2-w1+3"', '"h1+h2","h1+h+h2"'}
%       % {'Cut_6', '"L/2-2", "L/2-p_3+cpw"', '"-W/2-w1","-W/2-w1+3"', '"h1+h2","h1+h+h2"'}
% 
% };
% % Create components in CST
% for i = 1:length(components)
%     comp = components{i};
%     Cstbrick(mws, comp{1}, componentType, material, comp{2}, comp{3},comp{4});
% end


% Material and component type definitions
componentType = 'copper';
material = 'Copper (annealed)';

% Component definitions {Name, X-range, Y-range, Z-range}
components = {
    % {'SSPP1', '"-L/2-l1+SP1", "-L/2-l1+SP1_1"', '"-SP1_2+w2","SP1_2"', '"0","h"'},
    % {'SSPP2', '"L/2+l1-SP2_1", "L/2+l1-SP2"',    '"-SP1_2+w2","SP1_2"', '"0","h"'}
    % {'SSPP3', '"-L/2+SP3", "-L/2+SP3_1"',  '"W/2-c1+g4*Y1","W/2-c1+Y1+SP3_2-0.2"', '"0","h"'},
    % {'SSPP4', '"L/2-SP4",  "L/2-SP4_1"',   '"W/2-c1+g4*Y1","W/2-c1+Y1+SP4_2-0.2"', '"0","h"'},

     % {'SSPP3-1', '"-L/2+SP3", "-L/2+SP3_1_1"',      '"W/2-c1+SP3_2","W/2-c1+SP3_2_1"', '"0","h"'},
    % {'SSPP3-2', '"-L/2+SP3_1_1", "-L/2+SP3_1_2"',  '"W/2-c1+SP3_2_1","W/2-c1+SP3_2_2"', '"0","h"'},
    % {'SSPP3-3', '"-L/2+SP3_1_2", "-L/2+SP3_1_3"',  '"W/2-c1+SP3_2_2","W/2-c1+SP3_2_3"', '"0","h"'},
    % {'SSPP3-4', '"-L/2+SP3_1_3", "-L/2+SP3_1_4"',  '"W/2-c1+SP3_2_2","W/2-c1+SP3_2_1"', '"0","h"'},
    % {'SSPP3-5', '"-L/2+SP3_1_4", "-L/2+SP3_1_5"',  '"W/2-c1+SP3_2","W/2-c1+SP3_2_1"', '"0","h"'},
    % {'SSPP3-6', '"-L/2+SP3_1_5", "-L/2+SP3_1_6"',  '"W/2-c1+SP3_2_1","W/2-c1"', '"0","h"'},
    % % 
    % {'SSPP4-1', '"L/2-SP3",     "L/2-SP3_1_1"',      '"W/2-c1+SP3_2","W/2-c1+SP3_2_1"', '"0","h"'},
    % {'SSPP4-2', '"L/2-SP3_1_1", "L/2-SP3_1_2"',  '"W/2-c1+SP3_2_1","W/2-c1+SP3_2_2"', '"0","h"'},
    % {'SSPP4-3', '"L/2-SP3_1_2", "L/2-SP3_1_3"',  '"W/2-c1+SP3_2_2","W/2-c1+SP3_2_3"', '"0","h"'},
    % {'SSPP4-4', '"L/2-SP3_1_3", "L/2-SP3_1_4"',  '"W/2-c1+SP3_2_2","W/2-c1+SP3_2_1"', '"0","h"'},
    % {'SSPP4-5', '"L/2-SP3_1_4", "L/2-SP3_1_5"',  '"W/2-c1+SP3_2","W/2-c1+SP3_2_1"', '"0","h"'},
    % {'SSPP4-6', '"L/2-SP3_1_5", "L/2-SP3_1_6"',  '"W/2-c1+SP3_2_1","W/2-c1"', '"0","h"'},
    % 
    % {'SSPP5-1', '"-L/2+SP3", "-L/2+SP3_1_1"',      '"-W/2+c1-SP3_2",  "-W/2+c1-SP3_2_1"', '"0","h"'},
    % {'SSPP5-2', '"-L/2+SP3_1_1", "-L/2+SP3_1_2"',  '"-W/2+c1-SP3_2_1","-W/2+c1-SP3_2_2"', '"0","h"'},
    % {'SSPP5-3', '"-L/2+SP3_1_2", "-L/2+SP3_1_3"',  '"-W/2+c1-SP3_2_2","-W/2+c1-SP3_2_3"', '"0","h"'},
    % {'SSPP5-4', '"-L/2+SP3_1_3", "-L/2+SP3_1_4"',  '"-W/2+c1-SP3_2_2","-W/2+c1-SP3_2_1"', '"0","h"'},
    % {'SSPP5-5', '"-L/2+SP3_1_4", "-L/2+SP3_1_5"',  '"-W/2+c1-SP3_2",  "-W/2+c1-SP3_2_1"', '"0","h"'},
    % {'SSPP5-6', '"-L/2+SP3_1_5", "-L/2+SP3_1_6"',  '"-W/2+c1-SP3_2_1","-W/2+c1"', '"0","h"'},
    % 
    % 
    % {'SSPP6-1', '"L/2-SP3",     "L/2-SP3_1_1"',  '"-W/2+c1-SP3_2",  "-W/2+c1-SP3_2_1"', '"0","h"'},
    % {'SSPP6-2', '"L/2-SP3_1_1", "L/2-SP3_1_2"',  '"-W/2+c1-SP3_2_1","-W/2+c1-SP3_2_2"', '"0","h"'},
    % {'SSPP6-3', '"L/2-SP3_1_2", "L/2-SP3_1_3"',  '"-W/2+c1-SP3_2_2","-W/2+c1-SP3_2_3"', '"0","h"'},
    % {'SSPP6-4', '"L/2-SP3_1_3", "L/2-SP3_1_4"',  '"-W/2+c1-SP3_2_2","-W/2+c1-SP3_2_1"', '"0","h"'},
    % {'SSPP6-5', '"L/2-SP3_1_4", "L/2-SP3_1_5"',  '"-W/2+c1-SP3_2",  "-W/2+c1-SP3_2_1"', '"0","h"'},
    % {'SSPP6-6', '"L/2-SP3_1_5", "L/2-SP3_1_6"',  '"-W/2+c1-SP3_2_1","-W/2+c1"', '"0","h"'},



      % {'SSPP5', '"-L/2+SP5", "-L/2+SP5_1"',  '"W/2-c1","W/2-c1+SP5_2"', '"0","h"'},
      % {'SSPP6', '"L/2-SP6", "L/2-SP6_1"',    '"-W/2+c1","-W/2+c1-SP6_2+w2"', '"0","h"'},
      % {'SSPP7', '"-L/2+SP7","-L/2+SP7_1"',   '"-W/2+c1-g4*Y1","-W/2+c1-Y1-SP7_2+w2+0.2"', '"0","h"'},
      % {'SSPP8', '"L/2-SP8", "L/2-SP8_1"',    '"-W/2+c1-g4*Y1","-W/2+c1-Y1-SP8_2+w2+0.2"', '"0","h"'},
      % {'SSPP9', '"L/2-SP9",  "L/2-SP9_1"',   '"W/2-c1+g4*Y1*0","W/2-c1+Y1+SP9_2-0.2"', '"0","h"'},
      % {'SSPP10', '"-L/2+SP10","-L/2+SP10_1"','"W/2-c1+g4*Y1*0","W/2-c1+Y1+SP10_2-0.2"', '"0","h"'},
      
};

% Material and component type definitions
componentType = 'copper';
material = 'Copper (annealed)';



% Create components in CST
for i = 1:length(components)
    comp = components{i};  % Get current component cell array
    name = comp{1};
    xRange = comp{2};
    yRange = comp{3};
    zRange = comp{4};

    Cstbrick(mws, name, componentType, material, xRange, yRange, zRange);
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
component1 = 'copper:top layer';
componentNames = {'copper:cut1','copper:cut2'};
% Loop through the component names and perform CstSubtract operation
for i = 1:numel(componentNames)
    component2 = componentNames{i};
    CstSubtract(mws, component1, component2);
end

% component1 = 'copper:top layer';
% componentNames = {'copper:EBG1_1','copper:EBG1_3','copper:EBG2_1','copper:EBG2_3'};
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end

% component1 = 'copper:EBG3_1';
% componentNames = {'copper:EBG3_2'};
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end
% 
% component1 = 'copper:EBG4_1';
% componentNames = {'copper:EBG4_2'};
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end
% 
% component1 = 'copper:EBG5_1';
% componentNames = {'copper:EBG5_2'};
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end
% 
% component1 = 'copper:EBG6_1';
% componentNames = {'copper:EBG6_2'};
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
%  end

% component1 = 'copper:top layer';
% % Define an array of component names
% componentNames = {'copper:CPW_port1','copper:CPW_port2'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end

% component1 = 'copper:Air bridge3';
% % Define an array of component names
% componentNames = {'copper:Air bridgeslot1'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end
% 
% 
% component1 = 'copper:Air bridge6';
% % Define an array of component names
% componentNames = {'copper:Air bridgeslot2'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end
% 
% component1 = 'copper:Air bridge1';
% % Define an array of component names
% componentNames = {'copper:Air bridge1slot'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end
% 
% component1 = 'copper:Air bridge2';
% % Define an array of component names
% componentNames = {'copper:Air bridge2slot'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end
% 
% component1 = 'copper:Air bridge4';
% % Define an array of component names
% componentNames = {'copper:Air bridge4slot'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end
% 
% component1 = 'copper:Air bridge5';
% % Define an array of component names
% componentNames = {'copper:Air bridge5slot'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end

% component1 = 'copper:top layer';
% % Define an array of component names
% componentNames = {'copper:stub1','copper:stub2','copper:stub4','copper:stub5'};
%     % ,'copper:stub2','copper:stub4','copper:stub5','copper:stub1_1',...
%     % 'copper:stub2_1','copper:stub3_1','copper:stub5_1'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end


% component1 = 'copper:top layer';
% % Define an array of component names
% componentNames = {'copper:Slot3','copper:Slot4'};
% % Loop through the component names and perform CstSubtract operation
% for i = 1:numel(componentNames)
%     component2 = componentNames{i};
%     CstSubtract(mws, component1, component2);
% end

component1 = 'copper:top layer';
% Define an array of component names
componentNames = {'copper:taper1','copper:taper2','copper:taper3','copper:taper4'};
% Loop through the component names and perform CstSubtract operation
for i = 1:numel(componentNames)
    component2 = componentNames{i};
    CstSubtract(mws, component1, component2);
end


% component1 = 'copper:top layer';
% componentnames = {'copper:SIW_port1','copper:SIW_port2'};
% for i = 1:numel(componentnames)
%     component2=componentnames{i};
%     CstAdd(mws, component1, component2);
% end
% 


params = set_parameters(mws);
create_vias2(mws, params);

% components = { 'copper2:VL36','copper2:VL37','copper2:VL38','copper2:VL56','copper2:VL57','copper2:VL58'};
% 
% for i = 1:length(components)
%     component = components{i};
%     CstDelete(mws, component);
% end

% components = { 'copper1:SW8','copper1:SW15','copper1:SW22','copper1:SW44','copper1:SW66','copper1:SW73','copper1:SW80'};
% 
% for i = 1:length(components)
%     component = components{i};
%     CstDelete(mws, component);
% end


% % Example 1: Transform vias VL1 through VL39 by (-0.08, 0, 0)
 % transformVias(mws, 'copper2:VL', 39, 39, -0.08, 0, 0);
 % transformVias(mws, 'copper2:VL', 35, 35, 2.32, 0, 0);
 %  transformVias(mws, 'copper2:VL',59, 59, -2.32, 0, 0);

% create_Ecylinder(mws, 'solid1', 'Rogers', 'material1', '7.8', '0.8', 'z', 'h', 'h+h1+h2', '-2.6', '1.2', '0');


% component1='copper:Ground';
% componentDGS={'copper:DGS1','copper:DGS2'};
% for i=1:numel(componentDGS)
%     component2=componentDGS{i};
%     CstSubtract(mws,component1,component2); 
% end

% component1 = 'copper:Ground';
% componentnames = {'copper:SIW_port3','copper:SIW_port4'};
% for i = 1:numel(componentnames)
%     component2=componentnames{i};
%     CstAdd(mws, component1, component2);
% end
% component1='copper:Ground';
% component2='copper:DGS1';
% CstSubtract(mws, component1, component2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% port_num=',9';
% port='1';
% Yrange='"-3","3"';
% CstPort(mws,port_num,Yrange,port)
% 
% port_num=',3';
% port='2';
% Yrange='"-2","2"';
% CstPort(mws,port_num,Yrange,port)


% Define boundary configuration
boundarySettings = struct(...
    'Xmin', 'open(add space)', ...  % PEC on X-min
    'Xmax', 'open(add space)', ...  % PEC on X-max
    'Ymin', 'open(add space)', ...  % PEC on Y-min
    'Ymax', 'open(add space)', ...  % PEC on Y-max
    'Zmin', 'open(add space)', ...  % Ground plane
    'Zmax', 'open(add space)' ...       % PEC 
);

% % 3. Define symmetry (optional)
% symmetry = struct(...
%     'Xsymmetry', 'none', ...
%     'Ysymmetry', 'magnetic', ... % PMC symmetry in Y-direction
%     'Zsymmetry', 'none' ...
% );
% 
% % 4. Apply boundaries
% setCSTBoundary(mws, boundarySettings, symmetry);
% 
% mws.invoke('ChangeSolverType', 'HF Frequency Domain');
% 
% Define individual port properties
port_data(1) = struct(...
    'face_id', '45', ...
    'port_num', 1, ...
    'Xrange', '"-L/2", "-L/2"',...
    'Yrange', '"1", "1"',...
    'XrangeAdd', '"0","0"',...
    'YrangeAdd', '"3","3"',...
    'orientation', 'positive', ...
    'ref_plane', 0.5, ...
    'layer', 'copper:top layer');

port_data(2) = struct(...
    'face_id', '50', ...
    'port_num', 2, ...
    'Xrange', '"-L/2", "-L/2"',... 
    'Yrange', '"0.5", "0.5"', ...
    'XrangeAdd', '"0","0"',...
    'YrangeAdd', '"3","3"',...
    'orientation', 'positive', ...
    'ref_plane', 0.5, ...
    'layer', 'copper:top layer');

% port_data(1) = struct(...
%     'face_id', '9', ...
%     'port_num', 3, ...
%     'Yrange', '"-W/2-w1", "-W/2-w1"',...  
%     'Xrange', '"-L/2+p_3", "-L/2+p_3+w_3"',...
%     'XrangeAdd', '"2","2"',...
%     'YrangeAdd', '"0","0"',...
%     'orientation', 'positive', ...
%     'ref_plane', 0.5, ...
%     'layer', 'copper:top layer');
% 
% port_data(2) = struct(...
%     'face_id', '3', ...
%     'port_num', 4, ...
%     'Yrange', '"-W/2-w1", "-W/2-w1"',... 
%     'Xrange', '"L/2-p_3-w_3", "L/2-p_3"',...
%     'XrangeAdd', '"2","2"',...
%     'YrangeAdd', '"0","0"',...
%     'orientation', 'positive', ...
%     'ref_plane', 0.5, ...
%     'layer', 'copper:top layer');

% Create ports
Cst4PortAdv(mws, port_data);
mws.invoke('ChangeSolverType', 'HF Frequency Domain'); % Project-level setting

% mws.invoke('Rebuild'); % First rebuild the structure
% mws.invoke('StoreSettings'); % Then store all settings

solver = mws.invoke('Solver');
disp(['ACTIVE SOLVER: ', mws.invoke('GetSolverType')]);
% invoke(solver, 'Start');
% 




% invoke(mws, 'Save');%Save
% invoke(mws, 'Quit');%Exit
% 
% Define frequencies (GHz)
frequencies = [0.2,0.65,0.84,1.23,1.45,2.5,3.6,4.5,6,8,10,14,20,25,30,37,38,38.5,39,40,42.5,43,45.1,50,52,55];  

% Create E-field monitors
for f = frequencies
    monitor = mws.invoke('Monitor');
    monitor.invoke('Reset');
    monitor.invoke('Name', ['E-field_', num2str(f), 'GHz']);
    monitor.invoke('FieldType', 'Efield');
    monitor.invoke('Frequency', num2str(f));
    monitor.invoke('Dimension', 'Volume');
    monitor.invoke('Create');
end

% Create H-field monitors
for f = frequencies
    monitor = mws.invoke('Monitor');
    monitor.invoke('Reset');
    monitor.invoke('Name', ['H-field_', num2str(f), 'GHz']);
    monitor.invoke('FieldType', 'Hfield');
    monitor.invoke('Frequency', num2str(f));
    monitor.invoke('Dimension', 'Volume');
    monitor.invoke('Create');
end

disp('Successfully created field monitors');

% copyAndTranslateComponent('copper:EBG1_2', 'copper:EBG1_2_copy', 10, 0, 0);
% copyAndTranslateComponent('copper:EBG1_2', 4, 0, 0);
% 
% port_data = struct(...
%     'face_id',     {'32';      '33';      '9';       '3'}, ...
%     'port_num',    {1;         2;         3;         4}, ...
%     'Xrange',      {'"-L/2","-L/2"'; '"-L/2","-L/2"'; '"L/2-p_3-w_3","L/2-p_3"'; '"L/2-p_3-w_3","L/2-p_3"'}, ...
%     'Yrange',      {'"2","2"';       '"2","2"';       '"-W/2-w1","-W/2-w1"';     '"-W/2-w1","-W/2-w1"'}, ...
%     'XrangeAdd',   {'"0","0"';       '"0","0"';       '"1","1"';                 '"1","1"'}, ...
%     'YrangeAdd',   {'"1","1"';       '"1","1"';       '"0","0"';                 '"0","0"'}, ...
%     'orientation', {'positive';      'negative';      'positive';                'positive'}, ...
%     'ref_plane',   0.5, ...
%     'layer',       'copper:top layer');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% Set up farfield monitors and start simulation
% farfield_frequencies = 5.1:0.5:10.5;  % Frequency range in GHz
% setup_farfield_monitors(mws, farfield_frequencies);



%% Set up optimization parameters
opt_params.task_name = 'opt';
opt_params.task_path = 'D:\PhD From 2023 on\project\opt';
opt_params.fmin = 18;
opt_params.fmax = 22;
opt_params.max_freq_range = 'False';
opt_params.sim_type = 'Opt';
opt_params.optimizer_type = 'Trust_Region';
opt_params.start_from_current = 'False';

% Define parameters to optimize
opt_params.parameters = {
    % Name,   Enabled, Init,  Min,  Max
    'v_d',    'True',  0.28, 0.26, 0.32;
    'v_sep',  'True',  0.6,  0.5,  0.9
};

% Define optimization goal
opt_params.goal.description = '1DC:.\S-Parameters\S2,1';
opt_params.goal.select = 'True';
opt_params.goal.result_name = 'D:\PhD From 2023 on\projectDual_band filter.cst\1DC:.\S-Parameters\S1,1';
opt_params.goal.scalar_type = 'magdB20';
opt_params.goal.operator = '<';
opt_params.goal.target = -20;
opt_params.goal.range_type = 'range';
opt_params.goal.range = '18,22';

% Call the optimization setup function
% setup_optimization(mws, opt_params);

% ... (any additional post-optimization code)
% invoke(mws, 'Save');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
