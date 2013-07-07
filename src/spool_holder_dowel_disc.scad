// parametric spool holder
// author Free Beachler for Terawatt Industries

use <spool_holder.scad>
use <acetal_bushing.scad>

base_width = 75;
m4_diameter = 4 + 0.1;
height = 30;
overflow = 0.01;	//avoid manifold errors

spool_holder_dowel_disc(base_width, m4_diameter, height, overflow);
//acetal_bushing();

module spool_holder_dowel_disc(bw, m4d, h, o) {
	difference() {
		// base
		cylinder(r = bw * 1.05 / 2, h = h, $fn = 100);
		// donut
		rotate_extrude(convexity = 10, $fn = 100)
			translate([bw * 1.25 / 2, h + h * 0.2, 0])
				scale([1, 0.8, 1]) circle(r = bw * 1.65 / 3 + o, $fn = 100);
		// cutoff top
		translate([-bw / 2, -bw / 2, h - 8]) cube([bw, bw, h]);
		// screw holes
//		translate([-bw / 2, 0, 0 + o * 2]) rotate([90, 0, 0]) spool_holder_gasket_screw_holes_positive(bw, 0, 4, o);
		translate([-bw / 2, 0, 30 + o * 2]) rotate([90, 0, 0]) spool_holder_dowel_screw_holes_positive(bw, 0, 4, o);
		translate([0, 0, -0.01]) rotate([0, 0, 0]) cylinder(r = 15.1 / 2 + 0.2, h = h + 0.02, $fn = 50);
	}
}

