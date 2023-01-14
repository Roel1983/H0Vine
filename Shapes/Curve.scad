use <Pie.scad>

$fn = 128;

Curve(
    r1 = 11,
    r2 = .5,
    a1 = -15,
    a2 = 60
);

module Curve(
    r1,
    r2,
    a1,
    a2
) {
    difference() {
        Pie(r1 + r2, a1, a2);
        circle(r1 - r2);
    }
}