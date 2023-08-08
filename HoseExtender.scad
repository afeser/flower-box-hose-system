//
//  HoseExtender.scad
//  flower-box-hose-system
//
//  Author: Marius Montebaur
//  montebaur.tech, github.com/montioo
//

include <Parameters.scad>
use <HoseSplitter_Y-Shape.scad>

$fn = 100;


// Uses a water splitter (i.e.) a water intersection with arbitrary angles.
module ExtenderConnector() {
    MultiConnectorY(ports=[[0, 2], [180, 1]], middle_pipe_length=8, sphere_multiplier=1.0);
}
module Multipler() {
    MultiConnectorY(ports=[
    [0, 2],
    [30, 2],
    [60, 2],
    [90, 2],
    [120, 2],
    [150, 2],
    [180, 2],
    [210, 2],
    [240, 2],
    [270, 2],
    [300, 2],
    [330, 2]
    ], middle_pipe_length=20, sphere_multiplier=3.0);
}
// Uses a water splitter (i.e.) a water intersection with arbitrary angles.
// Has differently sized hoses at either size and thus creates an adapter.
module AdapterConnector() {
    // Creates a water intersection in arbitrary angles
    MultiConnectorY(ports=[[0, 0], [180, 1]]);
}


//ExtenderConnector();

Multipler();
