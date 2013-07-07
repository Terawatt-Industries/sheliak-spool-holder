// parametric spool holder
// author Free Beachler for Terawatt Industries

module acetal_bushing() {
	difference() {
		union() {
			color([0, 109, 1]) cylinder(r = 8 / 2 + 2 + 0.2, h = 8 + 1, $fn = 50);
			translate([0, 0, 0.25]) cylinder(r1 = 15.1 / 2 + 0.2, r2 = 15.35 / 2 + 0.2, h = 8, $fn = 50);
			translate([0, 0, 8 + 0.25 - 0.01]) cylinder(r = 15.1 / 2 + 2 + 0.2, h = 0.5, $fn = 50);
		}
		translate([0, 0, -0.01]) cylinder(r = 8 / 2 + 0.2, h = 10, $fn = 50);
	}
}