function createCSTFrequencyMonitors(cstApp, monitorType, frequencies, varargin)
% CREATECSTFREQUENCYMONITORS - Creates multiple frequency-domain field monitors
%
% Inputs:
%   cstApp      - ActiveX CST application object
%   monitorType - 'Efield' or 'Hfield'
%   frequencies - Array of frequencies (in GHz) for monitors
% Optional Name-Value Pairs:
%   'VolumeType'    - 'Volume' or 'Surface' (default: 'Volume')
%   'Subvolume'     - [xmin,xmax,ymin,ymax,zmin,zmax] (default: full structure)
%   'NamePrefix'    - Base name for monitors (default: 'E-field'/'H-field')
%   'Coordinates'   - 'Structure' or 'Free' (default: 'Structure')

    % Parse optional parameters
    p = inputParser;
    addParameter(p, 'VolumeType', 'Volume', @ischar);
    addParameter(p, 'Subvolume', [], @isnumeric);
    addParameter(p, 'NamePrefix', '', @ischar);
    addParameter(p, 'Coordinates', 'Structure', @ischar);
    parse(p, varargin{:});
    
    % Set default name prefix if not specified
    if isempty(p.Results.NamePrefix)
        prefix = [upper(monitorType(1)) monitorType(2:end) '-field'];
    else
        prefix = p.Results.NamePrefix;
    end
    
    % Create monitor for each frequency
    for f = frequencies
        monitor = cstApp.invoke('Monitor');
        monitor.invoke('Reset');
        
        % Set monitor properties
        monitor.invoke('Name', sprintf('%s (f=%.1f)', prefix, f));
        monitor.invoke('Dimension', p.Results.VolumeType);
        monitor.invoke('Domain', 'Frequency');
        monitor.invoke('FieldType', monitorType);
        monitor.invoke('MonitorValue', num2str(f));
        monitor.invoke('Coordinates', p.Results.Coordinates);
        
        % Handle subvolume if specified
        if ~isempty(p.Results.Subvolume)
            sv = p.Results.Subvolume;
            monitor.invoke('UseSubvolume', 'True');
            monitor.invoke('SetSubvolume', ...
                num2str(sv(1)), num2str(sv(2)), ...
                num2str(sv(3)), num2str(sv(4)), ...
                num2str(sv(5)), num2str(sv(6)));
            monitor.invoke('SetSubvolumeInflateWithOffset', 'False');
        else
            monitor.invoke('UseSubvolume', 'False');
        end
        
        monitor.invoke('Create');
        fprintf('Created %s monitor at %.1f GHz\n', monitorType, f);
    end
end