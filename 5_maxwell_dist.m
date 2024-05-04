micro_12 = table2array(readtable('c-12 (n, ,elastic, y).csv'));
E= 10^-6 * micro_12(:,1);
maxwell = 2*pi/(pi*8.617*10^-11 * 300)^1.5 .*sqrt(E) .* exp(E/(-8.617*10^-11 * 300));
watt = 0.453 .*exp(-1.036*E).*sinh(sqrt(2.29*E));
plot(E,maxwell)
xlim([0,2])
hold on
loglog(E,watt)
hold off