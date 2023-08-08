//
//  Parameters.scad
//  flower-box-hose-system
//
//  Author: Marius Montebaur
//  montebaur.tech, github.com/montioo
//

//
// Parameterization for Hose Connectors.
//
// This file holds the measures that are employed by all adapters.
// Additional information is available here:
//  https://montebaur.tech/hose_connectors.html


// Parameters for 8mm x 1.5mm hoses
// (8mm inner diameter and the wall strength: 8mm + 2*1.5mm = 11mm diameter)
// ===============================================

// inner and outer diameter refer to the 3D printed connectors, NOT the hose.
hosetype0_pipe_inner_dia = 6;
hosetype0_pipe_outer_dia = 8;
hosetype0_outer_dia_lower = 7.75;
hosetype0_outer_dia_upper = 9;
hosetype0_tooth_length = 5;
hosetype0_tooth_number = 10;


// Parameters for 6mm x 1mm
// ===============================================

// inner and outer diameter refer to the 3D printed connectors, NOT the hose.
hosetype1_pipe_inner_dia = 12;
hosetype1_pipe_outer_dia = 16;
hosetype1_outer_dia_lower = 14;
hosetype1_outer_dia_upper = 17;
hosetype1_tooth_length = 5;
hosetype1_tooth_number = 8;




// Your custom parameters ...
// 1. Add your parameterization instead of dots (...)
// 2. Add the variables to the lists below
// 3. Index your parameters by index 2 in each list (the lists
//    are imported in file in this project).
// A schematic for the parameters can be found here:
//   https://montebaur.tech/projects/hose_connectors.html#parameterization
// ===============================================

// hcXmm_pipe_inner_dia = ...;
// hcXmm_pipe_outer_dia = ...;
// hcXmm_outer_dia_lower = ...;
// hcXmm_outer_dia_upper = ...;
// hcXmm_tooth_length = ...;
// hcXmm_tooth_number = ...;


// These variables are available throughout the project (after using
// `include <Parameters.scad>`) and hold parameterizations for hoses
// with different diameters.
// A schematic for the parameters can be found here:
//   https://montebaur.tech/projects/hose_connectors.html#parameterization
hc_pipe_inner_dia =  [hosetype0_pipe_inner_dia,  hosetype1_pipe_inner_dia ];  // a
hc_pipe_outer_dia =  [hosetype0_pipe_outer_dia,  hosetype1_pipe_outer_dia ];  // b
hc_outer_dia_lower = [hosetype0_outer_dia_lower, hosetype1_outer_dia_lower ];  // c
hc_outer_dia_upper = [hosetype0_outer_dia_upper, hosetype1_outer_dia_upper ];  // d
hc_tooth_length =    [hosetype0_tooth_length,    hosetype1_tooth_length ];  // e
hc_tooth_number =    [hosetype0_tooth_number,    hosetype1_tooth_number ];  // #teeth
