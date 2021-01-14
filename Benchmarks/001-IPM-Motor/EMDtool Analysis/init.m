%Initialize model

addpath(genpath('../../../../EMDtool'));

dim = struct();

%general dimensions
dim.p = 4;
dim.Qs = 24;
dim.delta = 1e-3; %total effective airgap
dim.leff = 70e-3;

dim.temperature_rotor = 100;
dim.temperature_stator = 120;

%winding parameters
winding = DistributedWindingSpec(dim);
winding.N_layers = 2;
winding.filling_factor = 0.5;
winding.N_series = 6;
winding.a = 1;
winding.connection = defs.star; %virtual

dim.stator_winding = winding;
dim.symmetry_sectors = dim.stator_winding.symmetry_period();

%stator dimensions
dim.Sout = 0.058;
dim.Sin = dim.Sout*0.62;

dim.htt_s = 1.5e-3;
dim.htt_taper_s = 0.7e-3;
dim.wso_s = 2e-3;
dim.r_slotbottom_s = 1e-3;
dim.hslot_s = 15e-3;
dim.wtooth_s = 5e-3;

%materials
dim.stator_core_material = M250_35A();
dim.stator_stacking_factor = 0.95;
dim.stator_wedge_material = 0;


%rotor dimensions
dim.Rout = dim.Sin - dim.delta;
dim.Rin = 30.86e-3 / 2;

dim.w_mag = 11e-3;
dim.h_mag = 3e-3;
dim.w_pocket_in = 0.5e-3;
dim.w_pocket_out = 0.8e-3;

dim.w_bridge = 1.0e-3;
dim.w_barrier = 2e-3; %measured on the outermost point
dim.w_bridge_out = 1.e-3;

dim.angle_mag = pi/180 * 35;

dim.magnet_material = PMlibrary.create('N42SH');
dim.rotor_stacking_factor = 0.95;
dim.rotor_core_material = M250_35A();

%creating
stator = Stator(dim);
rotor = VIPM1(dim);

%exporting dxf
%{
dxf_file = stator.export_dxf(fullfile('..', 'Files', 'geometry.dxf'), 'skip_save', true, ...
    'Nrep', 3, ...
    'rep_angle', 2*pi/dim.Qs);
rotor.export_dxf(dxf_file, 'Nrep', 1,'rep_angle', pi/dim.p)
%}

%exporting full-symmetry-sector dxf file
%{
R = GeometryReplicator(stator);
R.replicate();
stator.mesh_elementary_geometry('delete_files', false);


R = GeometryReplicator(rotor);
R.replicate();
rotor.mesh_elementary_geometry('delete_files', false);
return
%}


figure(1); clf; hold on; box on; axis equal;
stator.plot_geometry();
rotor.plot_geometry();

%return

stator.mesh_geometry();
rotor.mesh_geometry();


figure(2); clf; hold on; box on; axis equal;
rotor.visualize(); 
rotor.plot_edges(rotor.edges.shell, 'r', 'linewidth', 2);

%return

motor = RFmodel(dim, stator, rotor);


figure(2); clf;
motor.visualize('plot_ag', false, 'linestyle', 'none');


%exporting descriptive excel
%motor.save_to_excel( fullfile('..', 'Files', 'specifications.xlsx') );