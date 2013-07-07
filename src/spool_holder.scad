// parametric spool holder
// author Free Beachler for Terawatt Industries

spool_holder(75, 140, 4 + 0.2, 0.01, 1);

module spool_holder(bw, spelev, m4d, o, mirr) {
	if (mirr) {
		mirror([0, 1, 0]) spool_holder_assembly(bw, spelev, m4d, o);
	} else {
		spool_holder_assembly(bw, spelev, m4d, o);
	}
}

module spool_holder_assembly(bw, spelev, m4d, o) {
	translate([-bw / 2, 0, 0]) rotate([90, 0, 0])
	difference() {
		union() {
			spool_holder_base(bw, m4d, o);
			spool_holder_arm(bw, spelev, m4d, o);
		}
		spool_holder_base_screw_holes_positive(bw, m4d, o);
//		spool_holder_gasket_screw_holes_positive(bw, spelev, m4d, o);
		spool_holder_dowel_screw_holes_positive(bw, spelev, m4d, o);
	}
}

module spool_holder_base(bw, m4d, o) {
	cube([bw, 25, 5]);
}

module spool_holder_arm(bw, spelev, m4d, o) {
	translate([(bw - bw * 0.4) / 2, 0, 0]) cube([bw * 0.4, 5, spelev * 0.6]);
	hull() {
		translate([(bw - 5) / 2, 5, 0]) cube([5, 10, spelev]);
		hull() {
			translate([(bw - bw * 0.4) / 2, 0, spelev * 0.6]) cube([bw * 0.4, 5, 30]);
			translate([bw / 2, 5, spelev - o]) rotate([90, 0, 0]) cylinder(r = bw * 0.7 / 2, h = 5, $fn = 50);
		}
	}
}

module spool_holder_base_screw_holes_positive(bw, m4d, o) {
	translate([10, 25 / 2, -o]) cylinder(r = m4d / 2 + + m4d * 0.07, h = 50, $fn = 50);
	translate([bw - 10, 25 / 2, -o]) cylinder(r = m4d / 2 + o, h = 50, $fn = 50);
}

module spool_holder_dowel_screw_holes_positive(bw, spelev, m4d, o) {
	translate([bw / 2, -5, spelev]) {
		// spool dowel holes
		translate([0, 50 - o, -o]) rotate([90, 0, 0]) cylinder(r = 8 / 2 + 8 * 0.1, h = 100, $fn = 50);
		// counterflush
		translate([0, 100 - o, -o]) rotate([90, 0, 0]) cylinder(r = 20 / 2 + 8 * 0.1, h = 90, $fn = 50);
	}
}

module spool_holder_gasket_screw_holes_positive(bw, spelev, m4d, o) {
	translate([bw / 2, 5, spelev]) {
		// gasket attachment holes
		translate([0, 19, 0]) rotate([0, -90, 0]) {
			for (i = [bw * 0.22 + o, -bw * 0.22 - o]) {
				translate([-5, 5 - o, i]) rotate([90, 0, 0]) cylinder(r = m4d / 2 + m4d * 0.07, h = 50, $fn = 50);
			}
			translate([bw * 0.3 * sin(60), 5 - o, 0]) rotate([90, 0, 0]) cylinder(r = m4d / 2 + m4d * 0.07, h = 50, $fn = 50);
			// counterflush
			for (i = [bw * 0.22 + o, -bw * 0.22 - o]) {
				translate([-5, 4.5 - o, i]) rotate([90, 0, 0]) cylinder(r = m4d  + 1 + o, h = 25, $fn = 50);
			}
			translate([bw * 0.3 * sin(60), 4.5 - o, 0]) rotate([90, 0, 0]) cylinder(r = m4d  + 1 + o, h = 25, $fn = 50);
		}
	}
}