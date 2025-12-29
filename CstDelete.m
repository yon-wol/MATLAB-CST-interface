function CstDelete(mws,component1)
Solid = invoke(mws,'Solid');
invoke(Solid,'Delete',component1);
end