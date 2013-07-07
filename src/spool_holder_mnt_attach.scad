// parametric spool holder
// author Free Beachler for Terawatt Industries

use <spool_holder_base.scad>

w = 100;
l = 190;
t = 5;
shd = 75 - 20; 	// screw hole distance = base width - padding of 10*2
slide_len = 100;
m4_diameter = 4 + 0.2;

spool_attachment(w, l, t, shd, slide_len, m4_diameter);

module spool_attachment(w, l, t, shd, sldlen, m4d) {
	difference() {
		minkowski() {
			difference() {
				hull() {
					cube([15 * 3 - 10, 15 * 3 - 10, t - 0.01]);
					// extension
					translate([-40 * 0.5, -40, 0]) cube([40, 20, t - 0.01]);
				}
				translate([10, 10, 0]) cube([15 * 3 - 10, 15 * 3 - 10, t - 0.01]);
			}
			cylinder(r = 5, h = 0.01, $fn=50);
		}
		base_attach_screw_holes_positive(w, l, t, shd, sldlen, m4d);
		translate([0, -37.5, 0]) machine_attach_screw_holes_positive(30, t, m4d);
	}
}

module machine_attach_screw_holes_positive(spc, t, m4d) {
	for (x = [-spc * 0.5, spc * 0.5]) {
		translate([x, 0, -0.01]) cylinder(r = m4d / 2, h = t + 1, $fn=50);
	}
}