function set_boundary(mws)
    sCommand = '';
    sCommand = [sCommand 'With Boundary'];
    sCommand = [sCommand 10 '.Xmin "expanded open"'];
    sCommand = [sCommand 10 '.Xmax "expanded open"'];
    sCommand = [sCommand 10 '.Ymin "expanded open"'];
    sCommand = [sCommand 10 '.Ymax "expanded open"'];
    sCommand = [sCommand 10 '.Zmin "expanded open"'];
    sCommand = [sCommand 10 '.Zmax "expanded open"'];
    sCommand = [sCommand 10 '.Xsymmetry "none"'];
    sCommand = [sCommand 10 '.Ysymmetry "none"'];
    sCommand = [sCommand 10 '.Zsymmetry "none"'];
    sCommand = [sCommand 10 'End With'];
    invoke(mws, 'AddToHistory', 'define boundary', sCommand);
end