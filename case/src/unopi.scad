
module dsub(sc,sz,dp){
    $fn=64;
    
    cs=(sz/2)-2.6;
    cs2=(sz/2)-4.095;
    ns=(sz/2)+4.04;
     translate([1.66,-ns,0]){
    cylinder(r=1.6,h=10);
    }
    translate([1.66,ns,0]){
    cylinder(r=1.6,h=10);
    }
    
    scale([sc,sc,sc]){
    
    hull(){
    translate([0,-cs,0]){
    cylinder(r=2.6,h=10);
    }
    translate([0,cs,0]){
    cylinder(r=2.6,h=10);
    }
    translate([3.28,-cs2,0]){
    cylinder(r=2.6,h=10);
    }
    translate([3.28,cs2,0]){
    cylinder(r=2.6,h=10);
    }
}
}
}

module roundedcube(xdim ,ydim ,zdim,rdim) {
    hull(){
        translate([rdim,rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,rdim,0])cylinder(h=zdim,r=rdim);

        translate([rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
        translate([xdim-rdim,ydim-rdim,0])cylinder(h=zdim,r=rdim);
    }
}

module shell(xdim, ydim, zdim) {
    translate([-1,-1, -1]) difference() {
        roundedcube(xdim+4, ydim+4, zdim+3, 3);
        translate([2,2,2]) cube([xdim, ydim, zdim+2], center =false);
    }
}

$fn = 64;


 // translate([2, 3.5, 5]) import("unopi-pcb.stl");
module bottom() {
    difference() {
        union() {
            difference() {
                
                shell(87.5, 62, 22); 
                translate([82, 7, 19]) rotate([0, 90, 0]) roundedcube(18, 51, 10, 3);
                translate([7.5, 3, 4]) rotate([90, 0, 0]) roundedcube(10,5,5, 2);
                translate([23.5, 3, 4]) rotate([90, 0, 0]) roundedcube(20,7,5, 2);
                translate([51.5, 3, 6]) rotate([90, 0, 0]) roundedcube(8,6,5, 2);
                
                translate([-4, 22, -2]) cube([9,16,7], center = false);   
               
                }
            translate([5.5, 7, 0]) cylinder(h = 3, r = 4);
            translate([63.5, 7, 0]) cylinder(h = 3, r = 4);
            translate([63.5, 56, 0]) cylinder(h = 3, r = 4);
            translate([5.5, 56, 0]) cylinder(h = 3, r = 4);
        }
        translate([5.5, 7, -3]) cylinder(7, 4.3, 1.3);
        translate([63.5, 7, -3]) cylinder(7, 4.3, 1.3);
        translate([63.5, 56, -3]) cylinder(7, 4.3, 1.3);
        translate([5.5, 56, -3]) cylinder(7, 4.3, 1.3);
        translate([-5, 62/2, 18]) rotate([0, 90, 0]) dsub(1.2, 17.04, 2);
    }
    
}

module top() {
rotate([0, 180, 0]) translate([10, 0, -3])
//translate([0,0,24])
    difference() {
        /*
        union(){
            translate([-1, -1, 0]) roundedcube(87.5+4, 62+4, 4, 3);
            translate([5.5, 7, -19]) cylinder(h = 20, r = 3.5);
            translate([63.5, 7, -19]) cylinder(h = 20, r = 3.5);
            translate([63.5, 56, -19]) cylinder(h = 20, r = 3.5);
            translate([5.5, 56, -19]) cylinder(h = 20, r = 3.5);
        }
        translate([5.5, 7, -19]) cylinder(h = 20, r = 1.2);
        translate([63.5, 7, -19]) cylinder(h = 20, r = 1.2);
        translate([63.5, 56, -19]) cylinder(h = 20, r = 1.2);
        translate([5.5, 56, -19]) cylinder(h = 20, r = 1.2);
        for(i=[40:5:62])
            translate([-3, i, 2]) cube([100,2,10]);
*/
        translate([43.75, 15, 3.6]) linear_extrude(height = .4) text(text = "ZX-Uno π", halign="center");
    }
    
}
//bottom();
top();