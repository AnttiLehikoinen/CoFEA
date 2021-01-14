# IPM Motor Benchmark


## Problem statement

Nonlinear 2D-electromagnetic analysis is performed on a simplified IPM (interior permanent magnet) motor, with its cross-section illustrated below.

```{figure} ./IPM_geometry.png
---
width: 400px
alt: IPM Geometry
name: IPM Geometry
---
Illustration of the motor cross-section.
```

Detailed specifications as well as different models can be found on GitHub:

* [Motor dimensions and specifications](https://github.com/AnttiLehikoinen/CoFEA/tree/master/Benchmarks/001-IPM-Motor/Files)

* [FEMM model of the motor](https://github.com/AnttiLehikoinen/CoFEA/tree/master/Benchmarks/001-IPM-Motor/FEMM%20Analysis)

* [EMDtool analysis scripts](https://github.com/AnttiLehikoinen/CoFEA/tree/master/Benchmarks/001-IPM-Motor/EMDtool%20Analysis)

Furthermore, the main assumptions are listed below:

* Nonlinear materials are modelled with single-valued non-hysteretic BH-curves, found in the [Excel sheet](https://github.com/AnttiLehikoinen/CoFEA/blob/master/Benchmarks/001-IPM-Motor/Files/specifications.xlsx)

<<<<<<< HEAD
* Permanent magnets are magnetically linear, of grade N42SH, and cannot be demagnetized. The rotor temperature is assumed to be 100 C, resulting in a remanence flux density of 1.18 T. The relative permeability is 1.05.
=======
* Permanent magnets are magnetically linear and cannot be demagnetized.
>>>>>>> e1240282b0f36471fef5338a69e3c34970ff2e60

* Stator winding is modelled as infinitely stranded.

## Magnetostatic Analysis

Only one rotor position is analysed here. The pole angle is changed by adjusting the angle of the stator current vector. Two current densities are analysed, 40 Arms/mm<sup>2</sup> and 20 Arms/mm<sup>2</sup>. Different comparisons
are presented below.

### Comparison between FEMM and EMDtool

Results from the open-source [FEMM](https://www.femm.info/wiki/HomePage) are compared with the proprietary [EMDtool](https://www.smeklab.com/emdtool/) Matlab toolbox.

```{figure} ./IPM_torque_curves.png
---
width: 400px
alt: Torque curves
name: Torque curves
---
Torque curves
```

```{figure} ./IPM_flux_FEMM.png
---
width: 400px
alt: Flux density from FEMM.
name: Flux density from FEMM.
---
Flux density plot from FEMM.
```

```{figure} ./IPM_flux_EMDtool.png
---
width: 400px
alt: Flux density from EMDtool.
name: Flux density from EMDtool.
---
Flux density plot from EMDtool.
```

## Time-stepping Analysis

TDB.

## Conclusions

TBD.