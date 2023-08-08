//
//  HoseConnector.scad
//  flower-box-hose-system
//
//  Author: Marius Montebaur
//  montebaur.tech, github.com/montioo
//

include <Parameters.scad>

$fn = 100;


// Model of the connector that fits into a tube.
// @param inner_diameter: where the water flows
// @param outer_diameter: the diameter of the pipe
// @param number_tooth: number of teeth
// @param tooth_length: length of each tooth
// Tooth will be outer_diameter+max(1mm, 0.1*outer_diameter) in size
// Inner tooth will be inner_diameter-max(1mm, 0.1*inner_diameter) in size
module HoseConnector(inner_diameter, outer_diameter, number_tooth, tooth_length) {
    difference() {
        for (i = [0 : number_tooth-1]) {
            translate([0, 0, i*number_tooth/2]) cylinder(
                h=tooth_length,
                d1=max(outer_diameter+1,1.1*outer_diameter),
                d2=inner_diameter
            );
        }
        // Remove the inner part for the water to flow
        translate([0, 0, -0.01]) cylinder(
            h=number_tooth * tooth_length + 2 * 0.01,
            d=inner_diameter-max(inner_diameter*0.1, 1)
        );
    }
}

// Example for a connector modeled after hose_type 0:
HoseConnector(inner_diameter=6, outer_diameter=8, number_tooth=10, tooth_length=5);
