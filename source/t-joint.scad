
use <zcube.scad>;
use <bolts.scad>;
include <sizes.scad>;

module clip(size = 20) {
	half = radius+thickness;
	
	render() rotate([180, -90, 0]) difference() {
		union() {
			cylinder(r=radius+thickness, h=size);
			translate([-half/2, 0, 0]) zcube([half, half*2, size]);
		}
		
		cylinder_inner(size, radius);
		
		translate([half, 0, 0]) zcube([half, half*2, size]);
	}
}

module mask(size = 40) {
	offset = sqrt(size*size+size*size);
	translate([0, offset/2, 0]) rotate([0, 0, 45]) cube([size, size, size], true);
	
}

difference() {
	translate([-20, 0, 0]) clip(40);
	mask();
}

intersection() {
	rotate([0, 0, 90]) clip(20);
	mask();
}
