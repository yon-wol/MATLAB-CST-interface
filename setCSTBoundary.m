function setCSTBoundary(cstApp, boundaryType, symmetrySettings)
% SETCSTBOUNDARY - Configures boundary conditions in CST Microwave Studio
%
% Inputs:
%   cstApp          - ActiveX CST application object
%   boundaryType    - Struct with boundary settings ('electric', 'open', etc.)
%   symmetrySettings- Struct with symmetry options ('none', 'electric', 'magnetic')
%
% Example boundaryType struct:
%   boundaryType.Xmin = 'electric';
%   boundaryType.Xmax = 'open';
%   boundaryType.Ymin = 'magnetic';
%   ... (all 6 faces)

    % Get Boundary object
    boundary = cstApp.invoke('Boundary');
    
    % Set boundaries for each face
    faces = {'Xmin', 'Xmax', 'Ymin', 'Ymax', 'Zmin', 'Zmax'};
    for i = 1:length(faces)
        if isfield(boundaryType, faces{i})
            boundary.invoke(faces{i}, boundaryType.(faces{i}));
        end
    end
    
    % Set symmetry conditions
    if nargin > 2
        symFaces = {'Xsymmetry', 'Ysymmetry', 'Zsymmetry'};
        for i = 1:length(symFaces)
            if isfield(symmetrySettings, symFaces{i})
                boundary.invoke(symFaces{i}, symmetrySettings.(symFaces{i}));
            end
        end
    end
    
    % Finalize
    boundary.invoke('ApplyInAllDirections', 'False');
    disp('CST boundaries configured successfully.');
end