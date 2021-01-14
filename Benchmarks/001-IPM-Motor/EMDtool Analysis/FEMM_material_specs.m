%required material specs to FEMM

mat = dim.stator_core_material;

B = sqrt( mat.data.B_squared );
H = B .* mat.data.reluctivity_wrt_Bsquared;


H = H( B < 3 );
B = B( B < 3);


%PM specs
mat = dim.magnet_material;
Br = mat.material_properties.Br * (1 + mat.material_properties.alpha_Br*(...
    dim.temperature_rotor-20));

mur = 1.05;
mu0 = pi*4e-7;

Hc = Br / (mur*mu0)

%magnet remanence angles
apole = pi/dim.p;

angle_cw = -180 + (apole/2 + dim.angle_mag)/pi*180
angle_ccw = -180 + (apole/2 - dim.angle_mag)/pi*180