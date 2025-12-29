function initialize_units(mws)
    sCommand = '';
    sCommand = [sCommand 'With Units'];
    sCommand = [sCommand 10 '.Geometry "mm"'];
    sCommand = [sCommand 10 '.Frequency "ghz"'];
    sCommand = [sCommand 10 '.Time "ns"'];
    sCommand = [sCommand 10 'End With'];
    invoke(mws, 'AddToHistory', 'define units', sCommand);
end