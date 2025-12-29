function CstSubtract(mws,component2,component1)

Solid = invoke(mws,'Solid');
invoke(Solid,'Subtract',component2,component1);

end