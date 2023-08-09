include <Parameters.scad>

include <Parameters.scad>
use <HoseSplitter_Y-Shape.scad>
use <SquareHoseMultiplier.scad>


difference(){
    union(){
        SquareHoseMultiplier(hose_connector_params=[
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        [7, 8, 10, 5],
        ]);

        rotate([90, 0, 0]) {
            translate ([40, 10, 0]){
                MultiConnectorY(
                    hose_params=[
                        [7, 8, 10, 5],
                        [14, 16, 10, 5]],
                    angles=[0, 180],
                    middle_pipe_length=12,
                    sphere_multiplier=1.0
                );
            }
        }
    }
    //translate([0, 0, -50]) cube([10, 500, 500]);
}