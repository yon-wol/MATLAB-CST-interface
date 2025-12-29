function params = set_parameters(mws)
    % Basic parameters for patch antenna modeling
    params.W = 10;  % TL width
    params.L = 32;  % TL length
    params.h = 0.017;  % copper height
    params.h1 = 0.25;  % substrate1 height
    params.h2 = 0.15;  % substrate2 height
    params.h3 = 0.18;  % substrate2 height
    params.h4 = 0.1;  % substrate2 height
    params.v_d = 0.36;  % via diameter
    params.v_sep = 0.8;  % separation distance between vias
    params.l1 = 0;  % length extention
    params.w1 = 1.4;  % width extention
    params.w2 = 0;  % width extention
    params.c1 = 3;  %cut1 from W
    params.im1 = 1;  %cut1 from W
    params.b1 = 3;  %hight of air bridge
    params.b2 = 3;  %hight of air bridge
    params.b3 = 6;  %hight of air bridge
    params.A1 = 0.15;  %cut1 from W
    params.A3 = 1.5;  %port via from port
    params.A2 = 3;  %cut1 from W
    params.cpw = 0.5;  %width of port cpw
    params.g4 = 1;  % EBG length and width
    params.Y1 = 0.15;  %WIDTH OF CPW
    params.Y2 = 0.15;  %WIDTH OF CPW
    params.v1 = 0.4;  % via1 from cut1
    params.v2 = 4;  % via1 from L
    params.v3 = 3.4;  % via1 from 
    params.v4 = 0.8; %via 2 from via 1
    params.v5 = 1; %via 2 from via 1
    params.T1 = 1.145; %width Taper 1
    params.T2 = 4; %length Taper 1
    params.T3 = 2; %length Taper 1
    params.k1 = 1; %length Taper 1
    params.k2 = 1.25; %length Taper 1
    params.k3 = 0.1; %length Taper 1
    params.Tap_1 = 1; %length Taper 1
    params.Tap_2 = 2; %length Taper 1
    params.x1 = 0.5; %width Taper 1
    params.x2 = 0.0; %length Taper 1
    params.x3 = 0; %length Taper 1
    params.x4 = 0.0; %length Taper 1
    params.x5 = 0.5; %length Taper 1
    params.T4 = params.l1/2; %length Taper 1
    params.p = 0.8;  % repitition
    params.p1 = 0.8;  % repitition
    params.p_3 = 7.6;  % SIW_port from L
    params.hs = 0.2;  % depth of feed line
    params.w_3 = 0.6;  % width of SIW_port
    params.w_4 = 0.8;  % width of MSL1/2
    params.w_5 = 1.05;  % width of MSL3/4
    % params.l_1 = ;  % width of MSL3/4
    params.S1 = 7.0;  % Stub1 from L
    params.S1_1 = 8.4;  % width of Stub1
    params.S1_2 = 3;  % v.width of Stub2
    params.S2 = 15.2;  % Stub2 from L
    params.S2_1 = 16.8;  % width of Stub1
    params.S2_2 = 3;  % v.width of Stub2
    params.S3 = 17.0;  % Stub3 from L
    params.S3_1 = 18.6;  % width of Stub3
    params.S3_2 = 2;  % v.width of Stub3
    params.S4 = 22.6;  % Stub4 from L
    params.S4_1 = 24.0;  % width of Stub4
    params.S4_2 = 3;  % v.width of Stub4
    params.S5 = 15.2;  % Stub4 from L
    params.S5_1 = 17.4;  % width of Stub4
    params.S5_2 = 3.0;  % v.width of Stub4
    params.S6 = 3.8;  % Stub4 from L
    params.S6_1 = 6.0;  % width of Stub4
    params.S6_2 = 3.0;  % v.width of Stub4
    params.S7 = 3.8;  % Stub4 from L
    params.S7_1 = 6.0;  % width of Stub4
    params.S7_2 = 3.5;  % v.width of Stub4


    params.SP1 = 0.4;  % SSPP1 from L
    params.SP1_1 = 3;  % width of SSPP1
    params.SP1_2 = 3.5+params.w2;  % v.width of SSPP1
    params.SP2 = 0.4;  % SSPP2 from L
    params.SP2_1 = 3;  % width of SSPP2
    params.SP2_2 = 3.5;  % V.width of SSPP2 
    params.SP3 = 4.6;  % SSPP3 from L
    params.SP3_1 = 8.4;  % width of SSPP3
    params.SP3_2 = 8.15;  % V.width of SSPP3
    params.SP4 = 4.6;  % SSPP4 from L
    params.SP4_1 = 8.4;  % width of SSPP4
    params.SP4_2 = 8.15;  % V.width of SSPP4
    params.SP5 = 13.4;  % SSPP5 from L
    params.SP5_1 = 17.4;  % width of SSPP5
    params.SP5_2 = 8.4;  % V.width of SSPP5
    params.SP6 = 12.4;  % SSPP6 from L
    params.SP6_1 = 19.4;  % width of SSPP6
    params.SP6_2 = 8.4;  % V.width of SSPP6
    params.SP7 = 2.6;  % SSPP5 from L
    params.SP7_1 = 2.6;  % width of SSPP5
    params.SP7_2 = 8.15;  % V.width of SSPP5
    params.SP8 = 2.6;  % SSPP6 from L
    params.SP8_1 = 2.6;  % width of SSPP6
    params.SP8_2 = 8.15;  % V.width of SSPP6
    params.SP9 = 11;  % SSPP5 from L
    params.SP9_1 = 12;  % width of SSPP5
    params.SP9_2 = 8.15;  % V.width of SSPP5
    params.SP10 = 11;  % SSPP6 from L
    params.SP10_1 = 12;  % width of SSPP6
    params.SP10_2 = 8.15;  % V.width of SSPP6

    params.SP3_1_1 = params.SP3_1+1;   % length of 
    params.SP3_1_2 = params.SP3_1_1+1; % length of
    params.SP3_1_3 = params.SP3_1_2+1; % length of
    params.SP3_1_4 = params.SP3_1_3+1; % length of
    params.SP3_1_5 = params.SP3_1_4+1; % length of
    params.SP3_1_6 = params.SP3_1_5+1; % length of

    params.SP3_2_1 = params.SP3_2+1;  %   width of
    params.SP3_2_2 = 1;  %   width of
    params.SP3_2_3 = 2;  %   width of
    params.SP3_2_4 = .5;  %   width of
    params.SP3_2_5 = 3.5;  %   width of
    params.SP3_2_6 = 3.5;  %   width of


    params.E1_1 = 8.0;  % EBG1_1 FROM L
    params.E1_2 = params.E1_1+4;  % EBG1_1 LENGTH
    params.E1_3 = -1;  % EBG1_1 FROM W
    params.E1_4 = params.E1_3+2;  % EBG1_1 WIDTH
    params.g1 = 0.15;  % EBG slot gap
    params.g2 = 2;  % EBG length and width
    params.g3 = 3;  % EBG length and width
    params.Tr1 = -5;  % translet scale
    params.Tr2 = 15;  % translet scale
    params.Tr3 = 2;  % translet scale
    params.Tr4 = 11;  % translet scale
    params.Tr5 = 2;  % translet scale
    params.Tr6 = -2;  % translet scale
    params.x = 0;  % translet scale
    params.y = params.h;  % translet scale


    params.E2_1 = params.E1_1+params.g1;  % EBG1_1 FROM L
    params.E2_2 = params.E1_2-params.g1;  % EBG1_1 LENGTH
    params.E2_3 = params.E1_3+params.g1;  % EBG1_1 FROM -W
    params.E2_4 = params.E1_4-params.g1;  % EBG1_1 WIDTH

    params.E3_1 = params.E1_1+(params.E1_2-params.E1_1)/2+2*params.g1;  % EBG1_1 FROM L
    params.E3_2 = params.E1_1+(params.E1_2-params.E1_1)/2-2*params.g1;  % EBG1_1 LENGTH
    params.E3_3 = params.E2_4;  % EBG1_1 FROM -W
    params.E3_4 = params.c1+1.25;  % EBG1_1 WIDTH

    params.E4_1 = params.E1_1+(params.E1_2-params.E1_1)/2+params.g1/2;  % EBG1_1 FROM L
    params.E4_2 = params.E1_1+(params.E1_2-params.E1_1)/2-params.g1/2;  % EBG1_1 LENGTH
    params.E4_3 = params.E2_4;  % EBG1_1 FROM -W
    params.E4_4 = params.c1+1.4;  % EBG1_1 WIDTH
    
    
    % Store parameters in CST
    param_names = fieldnames(params);
    for i = 1:length(param_names)
        invoke(mws, 'StoreParameter', param_names{i}, params.(param_names{i}));
    end
end