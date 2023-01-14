use <Rack.scad>
use <Branches.scad>

rotate(90, [1, 0, 0]) {
    Rack();
    for (x = [-80, -55, -20, 7, 40, 63]) {
        translate([x, 0, 2]) {
            color("brown") Branches();
        }
    }
}