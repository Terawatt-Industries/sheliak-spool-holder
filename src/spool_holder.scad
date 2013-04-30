spool_holder();

module spool_holder() {
	rotate([-90, 0, 0])
	difference() {
		spool_holder_without_holes();
		spool_holder_holes();
	}
}	// close module

module spool_holder_holes() {
	translate([-77.5, 0, 60])
		rotate([0, 90, 90])
			cylinder(r=4, h=41, center=true, $fn=12);
	translate([77.5, 0, 60])
		rotate([0, 90, 90])
			cylinder(r=4, h=41, center=true, $fn=12);

	// m4 screw mount hole
	translate([52.5, -10, -0.01])
		cylinder(r=2.1, h=10, center=true, $fn=12);
	// countersink
	translate([52.5, -10, 4.499])
		cylinder(r=3.65, h=10, center=true, $fn=12);
	// m4 screw mount hole
	translate([-52.5, -10, -0.01])
		cylinder(r=2.1, h=10, center=true, $fn=12);
	// countersink
	translate([-52.5, -10, 4.499])
		cylinder(r=3.65, h=10, center=true, $fn=12);
}

module spool_holder_without_holes() {
minkowski() {

union() {
// triangle bottom
rotate([0, -90, 0])
linear_extrude(height = 160, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );
// triangle right arm
translate([41.5, 0, 40])
rotate([0, 135, 0])
linear_extrude(height = 113.1371, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );
// triangle left arm
translate([-41.5, 0, 40])
rotate([0, 45, 0])
linear_extrude(height = 113.1371, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );
// threaded rod holders
hull() {
// repeat left arm to hull rod holder
translate([-41.5, 0, 40])
rotate([0, 45, 0])
linear_extrude(height = 56.56855, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );

translate([-77.5, 0, 60])
rotate([0, 90, 90])
cylinder(r=12, h=5, center=true, $fn=12);
}	// close hull

hull() {
// repeat right arm to hull rod holder
translate([41.5, 0, 40])
rotate([0, 135, 0])
linear_extrude(height = 56.56855, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );

translate([77.5, 0, 60])
rotate([0, 90, 90])
cylinder(r=12, h=5, center=true, $fn=12);
}	// close hull

}	// close union

cylinder(r=2.5, h=0.01, center=false, $fn=9);
//	rotate([0, 90, 0]) cylinder(r=2.5, h=0.01, center=true, $fn=12);
}	// close minkowski

// base support
hull() {
union() {
// repeat bottom triange arm for hull
rotate([0, -90, 0])
linear_extrude(height = 166, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );

translate([-70, 0, 0])
rotate([0, 45, 0])
linear_extrude(height = 9, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );

translate([68, 0, -1])
rotate([0, 135, 0])
linear_extrude(height = 9, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );
}
translate([-3, -7.5, 0]) cube([150, 25, 2], center=true);
}
// square base support w/all this hull bizness
translate([0, -7.5, -2.5]) cube([170, 25, 5], center=true);

// support arms
hull() {
// repeat left arm to hull left support
translate([-41.5, 0, 40])
rotate([0, 45, 0])
linear_extrude(height = 20, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );

translate([-20, 0, 20])
rotate([0, 135, 0])
linear_extrude(height = 56.56855, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );
}


hull() {
// repeat right arm to hull right support
translate([41.5, 0, 40])
rotate([0, 135, 0])
linear_extrude(height = 20, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );

translate([20, 0, 20])
rotate([0, 45, 0])
linear_extrude(height = 56.56855, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );
}
// top triangle support closure
hull () {
// triangle right arm
translate([5, 0, 75])
rotate([0, 135, 0])
linear_extrude(height = 10, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );
// triangle left arm
translate([-5, 0, 75])
rotate([0, 45, 0])
linear_extrude(height = 10, center = true, convexity = 0, twist = 0)
polygon( points=[[0,0],[1,0.5],[1.25,1],[1.25,1.5],[1,2],[0,2.5]] );
}
}
