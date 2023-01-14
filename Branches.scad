use <Shapes/Curve.scad>

$fn=128;

Branches();

module Branches() {
    linear_extrude(.5) {
        Branch(-10, 3) {
            Branch(45, 8){
                Branch(60, 8) {
                    Branch(-135, 6);
                    Branch(60, 5);
                };
                Branch(-60, 4) {
                    Branch(90, 6);
                }
            }
            Branch(-15, 10) {
                Branch(90, 8);
                Branch(-60, 4) {
                    Branch(90, 6);
                    Branch(-30, 8) {
                        Branch(60, 6);
                    }
                }
            }
        }
    }

    module Branch(a, l) {
        r = abs((180 * l) / (PI * a));
        if(a > 0) {
            translate([-r,0]) {
                Curve(r, .24, 0,a) children();
                rotate(a) translate([r,0]) {
                    circle(.24);
                    children();
                }
            }
        } else {
            translate([r,0]) {
                Curve(r, .24, 180+a,180);
                rotate(a) translate([-r,0]) {
                    circle(.24);
                    children();
                }
            }
        }
        
    }
}