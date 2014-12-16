function [ output_args ] = bland_altman( BPM_est,BPM_true )
% calculates and displays the bland altman plot

%check if inputArrays have the same size
assert((length(BPM_est)==length(BPM_true)), 'Inputarray have different sizes')
figure(1);
clf;
title('Bland-Altman')
hold on;
numberOfEstimates = length(BPM_est);
X = [];
Y = [];
for t=1:numberOfEstimates,
   X = [X (BPM_est(t)+BPM_true(t))/2];
   Y = [Y BPM_est(t)-BPM_true(t)];
end
axis([min(X)-2,max(X)+2,min(Y)-2,max(Y)+2]);
plot(X,Y,'r.');
mittelwert = mean(Y);

xLimits = get(gca,'XLim');
xAx = xLimits(1):1:xLimits(2);

plot(xAx,mittelwert*ones(length(xAx)))
output_args = mean(X);

arr = (mittelwert*ones(length(xAx)))+(ones(length(xAx))*std(Y)*1.96);
plot(xAx,arr);
arr1 = (mittelwert*ones(length(xAx)))+(ones(length(xAx))*std(Y)*(-1.96));
plot(xAx,arr1);
end