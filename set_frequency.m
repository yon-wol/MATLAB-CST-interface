function set_frequency(mws, Frq)
    sCommand = '';
    sCommand = [sCommand 'Solver.FrequencyRange ' int2str(Frq(1)) ',' int2str(Frq(2))];
    invoke(mws, 'AddToHistory', 'define frequency range', sCommand);
end