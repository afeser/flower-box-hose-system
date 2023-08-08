include <Parameters.scad>
use <HoseConnector.scad>

module MultiConnectorY(hose_connector_type=[0, 0, 0, 0]) {
    // 25 mm is for single output area
    number_outputs = len(hose_connector_type);
    area_needed = number_outputs / 2 + number_outputs % 2; // there are 2 sides, if there are 5 outputs, we need 3x25mm in each side!
    cube([25, area_needed*25, 40]);
    
    // Add each output one by one
    union(){
        for(counter=[0:number_outputs-1]){
            
            if(counter < area_needed){
                // Outputs in button
                translate([25/2, counter*25+25/2, 0]) rotate([180, 0, 0]) HoseConnector(hose_connector_type[counter]);
            }else{
                // Outputs on top
                translate([25/2, (counter-area_needed)*25+25/2, 40]) HoseConnector(hose_connector_type[counter]);
            }
        }
    }
    
}

MultiConnectorY();