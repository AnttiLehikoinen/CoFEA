

%%{
inds20 = [9, 13, 14, 15, 18];
Ts20 = [2.30304, 3.40839, 3.51168, 3.50756, 2.37412]*motor.symmetrySectors;

inds = [11, 14, 16, 17, 19];
Ts = [4.39907, 5.4451, 5.66066, 5.51455, 3.44461]*motor.symmetrySectors;

figure(10); clf; hold on; box on; grid on;
hemd20 = plot(angles/pi*180, T20, 'b', 'linewidth', 1);
plot(angles(inds20)/pi*180, Ts20, 'bd', 'linewidth', 2);

hemd = plot(angles/pi*180, T, 'r', 'linewidth', 1);
plot(angles(inds)/pi*180, Ts, 'rd', 'linewidth', 2);

legend('20 Arms/mm^2', '20 Arms/mm^2 (FEMM)', ...
    '40 Arms/mm^2', '40 Arms/mm^2 (FEMM)', 'linewidth', 1);

xlabel('Load angle (deg)');
ylabel('Torque (Nm)');

return
%}




xlabel('Load angle (deg)');
ylabel('Torque (Nm)');