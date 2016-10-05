body_height = 3;
body_thickness = 1;
main_d = 30;
flap_width = 3;
flap_length = 8;
flap_hole_pos = 9;
flap_hole_d = 2;
pacicka_mid_height = 8;
pacicka_height = 12;
pacicka_top_d = 26;
pacicka_hole_d = 28;
pacicka_width = 10;
pacicka_pos = 11;

union () {
  difference () {
    cylinder (body_height, d=main_d);
    difference () {
      translate ([0, 0, body_thickness]) {
        cylinder (body_height, d=main_d-body_thickness);
      }
      for (rot=[0, 180]) rotate ([0, 0, rot]) {
        translate ([-flap_width/2, main_d/2-flap_length, 0]) {
          cube ([flap_width, flap_length, body_height]);
        }
      }
    }
    for (rot=[0, 180]) rotate ([0, 0, rot]) {
      translate ([0, flap_hole_pos, body_thickness]) {
        cylinder (body_height, d=flap_hole_d, $fn=10);
      }
    }
  }
  intersection () {
    union () {
      cylinder (pacicka_mid_height, d=pacicka_hole_d);
      cylinder (body_height, d=main_d);
      translate ([0, 0, pacicka_mid_height]) {
        cylinder (pacicka_height-pacicka_mid_height,
                  d1=main_d-body_thickness,
                  d2=pacicka_top_d);
      }
    }
    for (rot=[0, 180]) rotate ([0, 0, rot]) {
      translate ([-pacicka_width/2, pacicka_pos, -500]) {
        cube ([pacicka_width, 1000, 1000]);
      }
    }
  }
}
