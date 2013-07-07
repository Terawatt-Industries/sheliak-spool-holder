// parametric spool holder
// author Free Beachler for Terawatt Industries

w = 60;
l = 60;
elev = 45;
bott_r = 25;
top_r = 15;
m4_diameter = 4 - 0.2;	//self-tapping for M4

spool_holder_feet(w, l, elev, bott_r, top_r, m4_diameter);

module spool_holder_feet(w, l, e, rb, rt, m4d) {
	difference() {
		spool_hoder_feet_base(w, l, e, rb, rt, m4d);
		translate([0, 0, e / 2]) spool_holder_feet_screw_holes_positive(w, l, e, m4d);
	}
}

module spool_hoder_feet_base(w, l, e, rb, rt, m4d) {
	for (x = [0, w - 15 * 0.5]) {
		for (y = [l - 15 * 0.5]) {
			translate([x, y, 0]) cylinder(r1 = rb, r2 = rt, h = e, $fn=50);
		}
	}
//	translate([w - 15 * 0.5, 0, 0]) cylinder(r = rb, r2 = rt, h = e, $fn=50);
}

module spool_holder_feet_screw_holes_positive(w, l, e, m4d) {
	for (x = [0, w - 15 * 0.5]) {
		for (y = [l - 15 * 0.5]) {
			translate([x, y, 0]) cylinder(r = m4d / 2, h = e, $fn=50);
		}
	}
//	translate([w - 15 * 0.5, 0, 0]) cylinder(r = m4d / 2, h = e, $fn=50);
}