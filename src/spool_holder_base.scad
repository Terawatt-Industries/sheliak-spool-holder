// parametric spool holder
// author Free Beachler for Terawatt Industries

use <spool_holder.scad>

w = 100;
l = 260;
t = 10;
shd = 75 - 20; 	// screw hole distance = base width - padding of 10*2
slide_len = 180;
m4_diameter = 4 + 0.1;

sheliak_spool_holder_base(w, l, t, shd, slide_len, m4_diameter);
% rotate([90, 0, 0]) translate([w / 2, t, -40]) spool_holder(75, 140, 4, 0.01, 1);
% rotate([90, 0, 0]) translate([w / 2, t, -slide_len - 40]) mirror([0, 0, 1]) spool_holder(75, 140, 4, 0.01, 1);

module sheliak_spool_holder_base(w, l, t, shd, sldlen, m4d) {
	difference() {
		union() {
			cube([w - 15 / 2, l - 15 / 2, t]);
			translate([w - 15 / 2, 0, 0]) cylinder(r = 15, h = t, $fn=50);
			translate([w - 15 / 2, l - 15 / 2, 0]) cylinder(r = 15, h = t, $fn=50);
			translate([0, l - 15 / 2, 0]) cylinder(r = 15, h = t, $fn=50);
			//wings
			translate([w - 15 * 1.5, 15 * 1.75, 0]) mirror([1, 1, 0]) rotate([0, 0, -90]) fancy_wing(15, t);
			translate([w - 15 * 2.25, 15, 0]) rotate([0, 0, -90]) fancy_wing(15, t);
			translate([w - 15 * 1.5, l - 15 * 2.25, 0]) mirror([0, 0, 0]) rotate([0, 0, 0]) fancy_wing(15, t);
			translate([w - 15 * 2.25, l - 15 * 1.5, 0]) rotate([0, 0, 90]) mirror([0, 1, 0]) fancy_wing(15, t);
			translate([15, l - 15 * 2.25, 0]) mirror([1, 0, 0]) rotate([0, 0, 0]) fancy_wing(15, t);
			translate([15 * 1.75, l - 15 * 1.5, 0]) mirror([0, 0, 0]) rotate([0, 0, 90]) fancy_wing(15, t);
			// rounded corner for mnt attachment
			translate([-5, -5, 0]) spool_holder_mnt_attach();
		}
		// base holder screw holes and slots
		translate([0, 50, -0.1]) base_holder_slots_positive(w, l, t + 1, shd, sldlen, m4d);
		translate([w / 2, 28, 0]) base_holder_fixed_screw_holes_positive(w, l, t, shd, sldlen, m4d);
		// feet screw holes
		translate([w - 15 / 2, 0, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
		translate([0, l - 15 / 2, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
		translate([w - 15 / 2, l - 15 / 2, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
		// base attachment screwholes
		translate([-5, -5, 0]) base_attach_screw_holes_positive(w, l, t, shd, sldlen, m4d);
	}
}

module spool_holder_mnt_attach() {
	minkowski() {
		cube([15 * 3 - 10, 15 * 3 - 10, t - 0.01]);
		cylinder(r = 5, h = 0.01, $fn=50);
	}
}

module spool_holder_base(w, l, t, shd, sldlen, m4d) {
	difference() {
		minkowski() {
			difference() {
				cube([w - 5, l - 5, t]);
				//% translate([t * 2 - 1, -1, -0.1]) base_corner_positive(t);
				translate([w - 5 + 1, t * 2 - 1, -0.1]) rotate([0, 0, 90]) base_corner_positive(t);
				translate([w - 5 - t * 2 + 1, l - 5 + 1, -0.1]) rotate([0, 0, 180]) base_corner_positive(t);
				translate([-1, l - 5 - t * 2 + 1, -0.1]) rotate([0, 0, -90]) base_corner_positive(t);
			}
			translate([0, 0, 0]) cylinder(r = 2.5, h = 0.01, $fn=50);
		}
		// base holder screw holes and slots
		translate([0, 50, -0.1]) base_holder_slots_positive(w, l, t + 1, shd, sldlen, m4d);
		// base attachment screwholes
		base_attach_screw_holes_positive(w, l, t, shd, sldlen, m4d);
	}
}

module fancy_wing(r, h) {
	// round corner 1
	translate([0, 0, 0]) 
	difference() { 
		translate([r - 0.01, 0.01, 0.01]) cube([r * 0.5, r, h]);
		intersection() {
			cube([r * 2, r * 2, h + 1]);
			translate([r * 2, 0, 0]) cylinder(r = r, h = h + 1 + 0.02);
		}
		cube([5, 5, 5]);
	}
}

module base_corner_positive(t) {
	rotate([0, 0, 90]) intersection() {
		cube([t * 2, t * 2, t + 1]);
		translate([0, 0, 0]) rotate([0, 0, 45]) cube([t * 4, t * 4, t + 1]);
	}
}

module base_attach_screw_holes_positive(w, l, t, shd, sldlen, m4d) {
		translate([25, 5, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
		translate([5, 25, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
		translate([5, 5, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
}

module base_holder_fixed_screw_holes_positive(w, l, t, shd, sldlen, m4d) {
	translate([-shd / 2, 0, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
	translate([shd / 2, 0, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
}

module base_holder_slots_positive(w, l, t, shd, sldlen, m4d) {
	translate([w / 2, 0, 0]) {
		translate([-shd / 2 - m4d / 2, 0, 0]) cube([m4d, sldlen, t]);
		translate([shd / 2 - m4d / 2, 0, 0]) cube([m4d, sldlen, t]);
		// round end rail 1
		translate([-shd / 2, 0, -0.01]) cylinder(r = m4d / 2, h = t, $fn=50);
		translate([-shd / 2, sldlen, 0]) cylinder(r = m4d / 2, h = t, $fn=50);
		// round end rail 2
		translate([shd / 2, 0, -0.01]) cylinder(r = m4d / 2, h = t, $fn=50);
		translate([shd / 2, sldlen, 0]) cylinder(r = m4d / 2, h = t, $fn=50);
	}
}