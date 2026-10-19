clear; close('all'); clc;
start_toolkit;
d = epanet('leticia.inp');
link_index=2;

Status = [0 0 0 0 0 1 1 0 0 1 0 1 0 1 0 1 0 1 0 1 0 0 0 0 1 1]';
d.openHydraulicAnalysis;
d.initializeHydraulicAnalysis;
i=1;tstep=1; F=[];
while (tstep>0)
    t=d.runHydraulicAnalysis;
    d.setLinkStatus(link_index, Status(i)); i=i+1;
    F = [F; d.getLinkFlows];
    tstep=d.nextHydraulicAnalysisStep;
end
d.closeHydraulicAnalysis;
Flows = F(:, link_index);
T = table(Flows, Status);

fprintf('\nFlows and status for node index 2:\n')
T
d.unload