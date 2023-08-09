include <Parameters.scad>
use <HoseConnector.scad>

// Return max. of the first element of the given array!
function get_max(array, counter=0) = len(array) == counter ? 0 : max(get_max(array, counter+1), array[counter][1]);

module SquareHoseMultiplier(hose_connector_params) {
    number_outputs = len(hose_connector_params);
    // Length of X and Y axis of the rectangle(choose the best from the inputs! (20% error margin!)
    area_for_single_output = max(1.2*get_max(hoses), 2+get_max(hoses));
        
    area_needed = ceil(number_outputs / 2); // there are 2 sides, if there are 5 outputs, we need 3x25mm in each side!
    // Wall size of the box from everywhere of the cube (rectangular water splitter)!
    wall_size = 6;
    
    difference(){
            union(){
                // Create the cube that stores the water
                difference(){
                    cube([area_for_single_output+2*wall_size, area_needed*area_for_single_output+2*wall_size, 40+2*wall_size]);
                    translate([wall_size, wall_size, wall_size]) cube([area_for_single_output, area_needed*area_for_single_output, 40]);
                }
            
                // Add each output one by one
                for(counter=[0:number_outputs-1]){
                    
                    if(counter < area_needed){
                        // Outputs in button
                        translate([area_for_single_output/2+wall_size, counter*area_for_single_output+area_for_single_output/2+wall_size, 0]){
                            rotate([180, 0, 0]){
                                HoseConnector(
                                    inner_diameter=hose_connector_params[counter][0],
                                    outer_diameter=hose_connector_params[counter][1],
                                    number_tooth=hose_connector_params[counter][2],
                                    tooth_length=hose_connector_params[counter][3]
                                );
                            }
                        }
                    }else{
                        // Outputs on top
                        translate([area_for_single_output/2+wall_size, (counter-area_needed)*area_for_single_output+area_for_single_output/2+wall_size, 40]){
                            HoseConnector(
                                inner_diameter=hose_connector_params[counter][0],
                                outer_diameter=hose_connector_params[counter][1],
                                number_tooth=hose_connector_params[counter][2],
                                tooth_length=hose_connector_params[counter][3]
                            );
                        }       
                    }
                }
            }
        
        // Open a hole in the rectangle
        // Sorry for the copy paste! please fix this...
        union(){
                for(counter=[0:number_outputs-1]){
                    if(counter < area_needed){
                        // Outputs in button
                        translate([area_for_single_output/2+wall_size, counter*area_for_single_output+area_for_single_output/2+wall_size, 0]){
                            rotate([180, 0, 0]){
                                translate([0, 0, -wall_size]) cylinder(h=wall_size+1, d=hose_connector_params[counter][0]);
                            }
                        }
                    }else{
                        // Outputs on top
                        translate([area_for_single_output/2+wall_size, (counter-area_needed)*area_for_single_output+area_for_single_output/2+wall_size, 40]){
                            translate([0, 0, wall_size]) cylinder(h=wall_size+1, d=hose_connector_params[counter][0]);

                        }       
                    }
                }
            }
        
    }
        
        
    

    
}



// [inner_diameter=6, outer_diameter=8, number_tooth=10, tooth_length=5]
hoses = [
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
];
SquareHoseMultiplier(hose_connector_params=hoses);