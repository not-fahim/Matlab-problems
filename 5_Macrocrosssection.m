micro_12 = table2array(readtable('c-12 (n, ,elastic, y).csv'));
micro_235 = table2array(readtable('U-235(z,capture,fission).csv'));
micro_238 = table2array(readtable('U-238(n,elastic, y,fission).csv'));

n_12 = 8.402*10^22;
n_235 = 3.7891*10^18;
n_238 = 5.2678 * 10 ^ 20;

%converting energy to mEV
macro_12(:,1) = 10^-6 * micro_12(:,1);
macro_235(:,1) = 10^-6 * micro_235(:,1);
macro_238(:,1) = 10^-6 * micro_238(:,1);

E= 10^-6 * micro_12(:,1);
maxwell = 2*pi/(pi*8.617*10^-11 * 300)^1.5 .*sqrt(E) .* exp(E/(-8.617*10^-11 * 300));
watt = 4.5*10^7*0.453 .*exp(-1.036*E).*sinh(sqrt(2.29*E));

macro_12(:,2) = n_12  * micro_12(:,2) ;
macro_12(:,3) = n_12 * micro_12(:,3) ;
macro_235(:,2) = n_235*  micro_235(:,2);
macro_235(:,3) = n_235*  micro_235(:,3);
macro_238(:,2) = n_238 *  micro_238(:,2);
macro_238(:,3) = n_238*  micro_238(:,3);
macro_238(:,4) = n_238*  micro_238(:,4);


figure(1)

loglog( macro_12(:,1), macro_12(:,2))

title('macroscopic cross section vs energy')
xlabel('energy MeV')
ylabel('cross section (cm^-1)')
hold on
loglog( macro_235(:,1), macro_235(:,2))
loglog( macro_235(:,1), macro_235(:,3))
loglog( macro_238(:,1), macro_238(:,2))
loglog( macro_238(:,1), macro_238(:,3))
loglog( macro_238(:,1), macro_238(:,4))
set(gca, 'XScale', 'log', 'YScale', 'log')

yyaxis right
ylabel('number density(#/MeV)')
loglog(E,maxwell,'--')
loglog(E,watt,':')


legend('c-12(n,elastic)','U-235(n,y)','U-235(n,fission)','U-238(n,elastic)','U-238(n,capture)','U-238(n,fission)','Maxwellian Distribution at 300k','Watt spectrum')
set(gca, 'XScale', 'log', 'YScale', 'log')
hold off



figure(2)

semilogx( macro_12(:,1), macro_12(:,2))
xlim([0,23])

title('macroscopic cross section vs energy')
xlabel('energy MeV')
ylabel('cross section (cm^-1)')
hold on
semilogx( macro_235(:,1), macro_235(:,2))
semilogx( macro_235(:,1), macro_235(:,3))
semilogx( macro_238(:,1), macro_238(:,2))
semilogx( macro_238(:,1), macro_238(:,3))
semilogx( macro_238(:,1), macro_238(:,4))

yyaxis right
ylabel('number density (#/MeV)')
semilogx(E,maxwell,'--')
semilogx(E,watt,':')


legend('c-12(n,elastic)','U-235(n,y)','U-235(n,fission)','U-238(n,elastic)','U-238(n,capture)','U-238(n,fission)','Maxwellian Distribution at 300k','Watt spectrum')

hold off