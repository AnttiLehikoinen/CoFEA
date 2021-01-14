%calculate_torque_curve Torque curve of a synchronous machine.
%
% This script calculates the torque curve versus pole angle, from static
% analysis using one rotor position.

angles = linspace(0, pi, 21); %pole angles to analyse
problem = MagneticsProblem(motor); %creating a problem

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Running analysis with 40 Arms/mm^2

Jrms = 40e6; %current density Arms

%setting source
circuit = stator.winding.circuit;
Ipeak = sqrt(2)*Jrms * circuit.copper_area_per_turn_and_coil();
Is = xy(Ipeak*[cos(angles); sin(angles)], problem);
circuit.set_source('uniform coil current', Is);

%setting parameters
pars = SimulationParameters('rotorAngle', 0*angles/dim.p);

%solving problem
static_solution = problem.solve_static(pars);


%plotting torque
figure(6); clf; hold on; box on;
T = motor.compute_torque( static_solution );
plot(angles/pi*180, T);
xlabel('Load angle (deg)');
ylabel('Torque (Nm)');


%plotting flux
figure(5); clf; hold on; box on;
[~, ind] = max(T);
motor.plot_flux(static_solution, ind);

%saving currents
headers = {'Pole angle (deg)', 'Ia', 'Ib', 'Ic'};
fname = fullfile('..', 'Files', 'specifications.xlsx');

xlswrite(fname, headers, 'Icoil @ 40 Arms per mm^2');
xlswrite(fname, [angles/pi*180; Is]', 'Icoil @ 40 Arms per mm^2', 'A2');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% running analysis at 20 Arms/mm^2

Jrms = 20e6; %current density Arms
Ipeak = sqrt(2)*Jrms * circuit.copper_area_per_turn_and_coil();
Is = xy(Ipeak*[cos(angles); sin(angles)], problem);
circuit.set_source('uniform coil current', Is);
static_solution = problem.solve_static(pars);
T20 = motor.compute_torque( static_solution );

xlswrite(fname, headers, 'Icoil @ 20 Arms per mm^2');
xlswrite(fname, [angles/pi*180; Is]', 'Icoil @ 20 Arms per mm^2', 'A2');