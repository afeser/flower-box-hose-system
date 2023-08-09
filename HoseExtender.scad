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
    MultiConnectorY(
        hose_params=[
            [7, 8, 10, 5],
            [14, 16, 10, 5]],
        angles=[0, 180],
        middle_pipe_length=12,
        sphere_multiplier=1.0
    );
}

ExtenderConnector();

