%The following string can be written as a function
function Cstbrick(mws,Str_Name,Str_Component,Str_Material, Xrange, Yrange, Zrange)
sCommand = '';

sCommand = [sCommand 'With Brick'];
sCommand = [sCommand 10 '.Reset'];
sCommand = [sCommand 10 '.Name "',Str_Name, '"'];
sCommand = [sCommand 10 '.Component "', Str_Component, '"'];
sCommand = [sCommand 10 '.Material "', Str_Material, '"']; %Yes, if the variable name here is not enclosed in double quotes, then after you manually modify the data in the parameter list in CST, you will not be prompted to press F7 to update. Instead, you need to open the history list and click Update.
sCommand = [sCommand 10 '.Xrange ', Xrange];
sCommand = [sCommand 10 '.Yrange ', Yrange];
sCommand = [sCommand 10 '.Zrange ', Zrange];
sCommand = [sCommand 10 '.Create'];
sCommand = [sCommand 10 'End With'];
invoke(mws, 'AddToHistory',['define brick:',Str_Component,':',Str_Name], sCommand);
% invoke(plot, 'ZoomToStructure');
%The above string can be written as a function
end