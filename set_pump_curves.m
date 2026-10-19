clear; close('all'); clc;
start_toolkit;
d = epanet('leticia.inp');
esults = d.getComputedTimeSeries;

nodeID = '10';
indexNode = d.getNodeIndex(nodeID);
figure;
subplot(2,1,1);
plot(Results.Time, Results.Pressure(:,indexNode));
title('Before set curve');
xlabel('Time (hrs)'); 
ylabel(['Pressure (', d.NodePressureUnits,')'])  
headCurve = d.getLinkPumpHeadCurveIndex;
d.setCurve(headCurve,[2000 250]); 
pumpIndex = d.getLinkPumpIndex;
d.getCurveIndex
d.setLinkPumpHeadCurveIndex(pumpIndex, headCurve)
Results = d.getComputedTimeSeries;  
subplot(2,1,2);
plot(Results.Time, Results.Pressure(:,indexNode));
title('After set curve');
xlabel('Time (hrs)'); 
ylabel(['Pressure (', d.NodePressureUnits,')'])
d.unload