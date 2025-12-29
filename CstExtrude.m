function CstExtrude(mws,Str_Name,Origin,Uvector, Vvector,Point,LineTo1,LineTo2,LineTo3)
Str_Component='copper';
Str_Material='Copper (annealed)';
Str_Mode='Pointlist';
Str_Height='h';
Str_Twist='0';
Str_Taper='0.0';
%The following string can be written as a function
sCommand = '';
sCommand = [sCommand 'With Extrude'];
sCommand = [sCommand 10 '.Reset'];
sCommand = [sCommand 10 '.Name "',Str_Name, '"'];
sCommand = [sCommand 10 '.Height "', Str_Height, '"'];
sCommand = [sCommand 10 '.Twist "', Str_Twist, '"'];
sCommand = [sCommand 10 '.Mode "',Str_Mode, '"'];
sCommand = [sCommand 10 '.Component "', Str_Component, '"'];
sCommand = [sCommand 10 '.Material "', Str_Material, '"'];
sCommand = [sCommand 10 '.Taper "', Str_Taper, '"'];
sCommand = [sCommand 10 '.Height ', '"h"'];
sCommand = [sCommand 10 '.Origin ', Origin];%The two variables here are used as strings corresponding to the variables in the parameter list in CST. If the variable names here are not enclosed in double quotes, then after manually modifying the data in the parameter list in CST, a prompt will not appear asking you to press F7 to update. Instead, you need to open the history list yourself and click Update.
sCommand = [sCommand 10 '.Uvector ', Uvector];
sCommand = [sCommand 10 '.Vvector ', Vvector];
sCommand = [sCommand 10 '.Point ', Point];
sCommand = [sCommand 10 '.LineTo ', LineTo1];
sCommand = [sCommand 10 '.LineTo ', LineTo2];
sCommand = [sCommand 10 '.LineTo ', LineTo3];
sCommand = [sCommand 10 '.Create'];
sCommand = [sCommand 10 'End With'] ;
invoke(mws, 'AddToHistory',['define extrude:',Str_Component,':',Str_Name,Str_Mode,Str_Height,Str_Twist,Str_Taper], sCommand);
end