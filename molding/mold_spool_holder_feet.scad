// author: f beachler
// license:  all rights reserved

use <parametric_box.scad>;
use <../src/spool_holder_feet.scad>;

part_1();
part_2();

module part_1() {
	union() {
		box(5, 8, 50, 80 + 40, 48 + 40);
		translate([-28, -50, 0]) spool_holder_feet(60, 60, 45, 25, 15, 4 - 0.2);
	}
	pegs1();
	channels();
}

module part_2() {
	translate([75 + 40 + 20, 0, 0]) {
		% translate([-28, -50, 0]) spool_holder_feet(60, 60, 45, 25, 15, 4 - 0.2);
		difference() {
			box(5, 8, 40, 80 + 40, 48 + 40);
			translate([0, 0, -5]) pegs1();
		}
	}
}

module pegs1() {
	for (x = [-48, 48]) {
		for (y = [-31, 31]) {
			translate([x, y, 13 - 0.01])
			rotate([0, 0, 0]) cylinder(r = 3.5, h = 5 + 1);
		}
	}
}

module channels() {
	translate([-10, 0, 13 - 0.01]) cube([15, 2, 2.5]);
}