// parametric box w/lid
// author:  free beachler
// license:  CC 3.0 Share-Alike w/Attribution

base_thickness = 7.5;
wall_thickness = 4.5;
inside_height = 30;	// box height, not including base
width = 70;
leadout = 70;

box_with_inset_lid(base_thickness, wall_thickness, inside_height, width, leadout);

module box_with_inset_lid(bt, wt, h, w, l, hand) {
	box(bt, wt, h, w, l, hand);
	inset_lid(wt, h, w, l);
}

module box(bt, wt, h, w, l) {
	difference() {
		hull() {
		minkowski() {
			translate([-w / 2 + 3, -l / 2 + 3, 0]) cube([w - 3 * 2, l - 3 * 2, bt]);
			cylinder(r = 3, h = 0.01, center = false, $fn = 100);
		}
			translate([-w / 2, -l / 2, bt]) cube([w, l, h]);
		}
		// rounded corners inside
		minkowski() {
			translate([-w / 2 + wt / 2 + 5, -l / 2 + wt / 2 + 5, wt + bt]) cube([w - wt - 5 * 2, l - wt - 5 * 2, h + bt + wt]);
			cylinder(r = 5, h = 0.01, center = false);
		}
	}
}

module inset_lid(wt, h, w, l) {
	translate([w / 2 + 10, -l / 2 + 5, 0]) {
		minkowski() {
			cube([w - wt - 5 * 2 - 0.1, l - wt - 5 * 2 - 0.1, 10]);
			cylinder(r = 5, h = 0.01, center = false);
		}
	}
}

module peg_stop(bt) {
	translate([0, 0, bt + 3]) rotate([180, 0, 0]) {
		cylinder(r = 4, h = bt, center = false);
		translate([0, 0, bt]) cylinder(r = 8, h = 3, center = false);
	}
}