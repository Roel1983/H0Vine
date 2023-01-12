// res: 0.15
// flow 120%

width = 190;
height = 20;
height_variant = 1;
rot_variant = 5;

distance = 25;

stick = 0.75;
hor = [0.2, 0.9];

number = ceil(width / distance);
for (i=[0:number]) {
    rnd = i * 7 % 11 / 11;
    rnd2_tmp = (i * 13 % 19 / 19) - .5;
    rnd2 = pow(rnd2_tmp, 2) * ((rnd2_tmp > 0) ? 1 : -1);
    x = ((i-.5) - ((number -1) / 2) ) * width / (number + .5);
    h = height + (rnd - .5) * height_variant;
    translate([x, h / 2, stick / 2]) rotate(rot_variant * rnd2)  cube ([stick, h, stick], true);
}
for(yr=hor) {
    y = height * yr;
    translate([0, y, stick * 0.75]) cube([width, stick, stick*1.5], true);

}

