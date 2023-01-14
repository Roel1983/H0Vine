Pie(10, 15, 60);

module Pie(r, a1, a2) {
    if (a1 !=0) {
        rotate(a1) Pie(r, 0, a2-a1);
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