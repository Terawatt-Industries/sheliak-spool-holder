// parametric spool holder
// author Free Beachler for Terawatt Industries

use <spool_holder.scad>
use <spool_holder_base.scad>
use <spool_holder_dowel_disc.scad>
use <spool_holder_feet.scad>
use <spool_holder_mnt_attach.scad>
use <acetal_bushing.scad>

w = 100;
l = 270;
t = 10;
shd = 75 - 20; 	// screw hole distance = base width - padding of 10*2
slide_len = 180;
m4_diameter = 4 + 0.1;

spool_holder_assembly();

module spool_holder_assembly(w = w, l = l, t = t, shd = shd, slide_len = slide_len, m4_diameter = m4_diameter) {
	color([0, 0, 0]) sheliak_spool_holder_base(w, l, t, shd, slide_len, m4_diameter);
	rotate([90, 0, 0]) translate([w / 2, t, -40]) spool_holder(75, 140, 4, 0.01, 1);
	rotate([90, 0, 0]) translate([w / 2, t, -slide_len - 40]) mirror([0, 0, 1]) spool_holder(75, 140, 4, 0.01, 1);
	translate([50, 0, 150]) {
		translate([0, 40 + 1, 0]) rotate([-90, 0, 0]) spool_holder_dowel_disc(75, 4, 30, 0.01);
		translate([0, 50 - 1, 0]) rotate([90, 0, 0]) acetal_bushing();
		translate([0, slide_len + 40 - 2, 0]) rotate([90, 0, 0]) spool_holder_dowel_disc(75, 4, 30, 0.01);
		translate([0, slide_len + 30, 0]) rotate([-90, 0, 0]) acetal_bushing();
	}
	translate([0, 0, -55]) spool_holder_feet(w, l, 55, 25, 15);
	translate([-5, -5, t]) spool_attachment(w, l, 5, shd, slide_len, m4_diameter);
}