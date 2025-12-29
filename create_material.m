function create_material(mws, er1)
    sCommand = '';
    sCommand = [sCommand 'With Material'];
    sCommand = [sCommand 10 '.Reset'];
    sCommand = [sCommand 10 '.Name "material1"'];
    sCommand = [sCommand 10 '.FrqType "all"'];
    sCommand = [sCommand 10 '.Type "Normal"'];
    sCommand = [sCommand 10 '.Epsilon ' num2str(er1)];
    sCommand = [sCommand 10 '.Create'];
    sCommand = [sCommand 10 'End With'];
    invoke(mws, 'AddToHistory', 'define material: material1', sCommand);
end