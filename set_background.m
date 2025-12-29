function set_background(mws)
    sCommand = '';
    sCommand = [sCommand 'With Background'];
    sCommand = [sCommand 10 '.ResetBackground'];
    sCommand = [sCommand 10 '.Type "Normal"'];
    sCommand = [sCommand 10 'End With'];
    invoke(mws, 'AddToHistory', 'define background', sCommand);
end