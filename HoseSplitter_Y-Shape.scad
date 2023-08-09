//
//  HoseSplitter_Y-Shape.scad
//  flower-box-hose-system
//
//  Author: Marius Montebaur
//  montebaur.tech, github.com/montioo
//

include <Parameters.scad>
use <HoseConnector.scad>

$fn = 100;


// Creates a connector for two hoses or more where all connections are placed at an angle.
// @param ports: A list of [angle, hose_type] pairs which describes what kind of hose
//   can be attached at which angle.
//      angle: angle (degree) at which a connector should be placed.
//      hose_type: The type of hose to use, see Parameters.scad
// @param middle_pipe_length: Length of the offset between intersection point and connectors.
// @param sphere_multiplier: For improved stability and grip while attaching/removing
//      hoses, a sphere in the middle can be added. Its diameter is the pipe's outer
//      diameter * sphere_multiplier./

// TODO: refactor this class
module MultiConnectorY(hose_params=[[6, 8, 10, 5], [6, 8, 10, 5]], angles=[0, 180], middle_pipe_length=12, sphere_multiplier=1.7) {
    // Creates a water intersection in arbitrary angles
    
    pipe_length = middle_pipe_length;
    max_outer_dia = max( [ for (hose_param = hose_params) hose_param[1] ] );
    max_inner_dia = max( [ for (hose_param = hose_params) hose_param[0] ] );

    difference() {
        union() {
            for (counter=[0:len(hose_params)-1]) {
                angle = angles[counter];
                rotate([-90, 0, angle]) {
                    translate([0, 0, pipe_length]) HoseConnector(hose_params[counter][0], hose_params[counter][1], hose_params[counter][2], hose_params[counter][3]);
                    cylinder(h=pipe_length, d=hose_params[counter][1]);
                }
            }
            sphere(d=max_outer_dia*sphere_multiplier);
        }

        for (counter=[0:len(hose_params)-1]) {
            angle = angles[counter];
            inner_dia = hose_params[counter][0];
            rotate([-90, 0, angle]) translate([0, 0, -0.01]) {
                cylinder(h=pipe_length+0.02, d=inner_dia);
                cylinder(h=max_outer_dia/3, d2=inner_dia, d1=max_inner_dia);
            }
        }
    }
}


// Example usages:

// Y-connector for 3 8mm inner diameter tubes (hose_type = 1 for all of them)
// at angles 0 deg, 150 deg and 210 deg.
// MultiConnectorY([[0, 1], [150, 1], [210, 1]]);

// Y-connector for 3 4mm inner diameter tubes (hose_type = 0 for all of them)
// and also adapting the length of the connector's tubes and the size of the sphere
// in the center.
// MultiConnectorY([[0, 0], [150, 0], [210, 0]], middle_pipe_length=8, sphere_multiplier=1.2);

// Using standard parameterization.
// MultiConnectorY();

// Y-connector with an inlet for 8mm inner diameter hoses (hose_type = 1) at angle 0.
// and two outlets for hoses with 4mm inner diameter.
// Before printing, remove the differece operator.
difference() {
    MultiConnectorY();

    // !! Difference added for visualiztion purposes.
    translate([-40, -40, 0]) cube([80, 80, 40]);
}
