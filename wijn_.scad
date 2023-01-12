$fn=128;
PI =3.14;

linear_extrude(.5) branch(-10, 3) {
    branch(45, 8){
        branch(60, 8) {
            branch(-135, 6);
            branch(60, 5);
        };
        branch(-60, 4) {
            branch(90, 6);
        }
    }
    branch(-15, 10) {
        branch(90, 8);
        branch(-60, 4) {
            branch(90, 6);
            branch(-30, 8) {
                branch(60, 6);
            }
        }
    }
}

module branch(a, l) {
    r = abs((180 * l) / (PI * a));
    if(a > 0) {
        translate([-r,0]) {
            curve(r, .24, 0,a);
            rotate(a) translate([r,0]) {
                circle(.24);
                children();
            }
        }
    } else {
        translate([r,0]) {
            curve(r, .24, 180+a,180);
            rotate(a) translate([-r,0]) {
                circle(.24);
                children();
            }
        }
    }
    
}

module curve(r1, r2, a1, a2) {
    difference() {
        pie(r1 + r2, a1, a2);
        circle(r1 - r2);
    }
    //for(a=[a1, a2]) rotate(a) translate([r1,0])circle(r=r2);
}

module pie(r, a1, a2) {
    if (a1 !=0) {
        rotate(a1) pie(r, 0, a2-a1);
    } else {
        if (a2 <= 90) {
            intersection() {
                circle(r=r);
                square(r);
                rotate(-90+a2)square(r);
            }
        } else if (a2 < 180){
            intersection() {
                circle(r=r);
                union() {
                    square(r);
                    rotate(a2-90)square(r);
                }
            }
        } else if (a2 <= 270){
            difference() {
                circle(r=r);
                rotate(-90) square(r);
                rotate(a2) square(r);
            }
        } else {
            difference() {
                circle(r=r);
                intersection() {
                    rotate(-90) square(r);
                    rotate(a2) square(r);
                }
            }
        }
    }
}