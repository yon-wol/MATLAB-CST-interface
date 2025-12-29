function setup_farfield_monitors(mws, freq_range)
    % SETUP_FARFIELD_MONITORS Creates frequency monitors and starts simulation
    %
    % Inputs:
    %   mws - CST microwave studio object
    %   freq_range - Array of frequencies for monitors (in GHz)
    
    %% Set the Monitor of the far field pattern
    monitor = invoke(mws, 'Monitor');
    
    % Create monitors for each frequency
    for i = 1:length(freq_range)
        Str_name = ['Farfield (f=', num2str(freq_range(i)), ')'];
        
        sCommand = sprintf(['With Monitor\n' ...
                           '.Reset\n' ...
                           '.Name "%s"\n' ...
                           '.Dimension "Volume"\n' ...
                           '.Domain "Frequency"\n' ...
                           '.FieldType "Farfield"\n' ...
                           '.Frequency %f\n' ...
                           '.Create\n' ...
                           'End With'], ...
                           Str_name, freq_range(i));
        
        invoke(mws, 'AddToHistory', ['define farfield monitor: ', Str_name], sCommand);
    end
    
    %% Simulation starts
    solver = invoke(mws, 'Solver');
    invoke(solver, 'Start');
    
    disp(['Farfield monitors set up at frequencies: ' num2str(freq_range)]);
    disp('Simulation started...');
end