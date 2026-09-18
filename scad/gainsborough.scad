use <keygen.scad>
include <gainsborough.gen.scad>

module gainsborough_classic(bitting="",
                       outline_name="5-pin",
                       warding_name="TE2") {

    name = "Gainsborough";

    /*
        Bitting is specified from bow to tip, 0-8, with 0 being the shallowest cut and 8 being the deepest.
        Example: 25363
    */

echo(outline_5pin_points);

    outlines_k = ["5-pin"];
    outlines_v = [
		[
			outline_5pin_points,
			outline_5pin_paths,
			[-outline_5pin_points[0][0], -outline_5pin_points[0][1]],
			"",
			""
		]
	];
    wardings_k = ["TE2"];
    wardings_v = [warding_TE2_points];

    outline_param = key_lkup(outlines_k, outlines_v, outline_name);
    outline_points = outline_param[0];
    outline_paths = outline_param[1];
    offset = outline_param[2];
    engrave_points = outline_param[3];
    engrave_paths = outline_param[4];

    warding_points = key_lkup(wardings_k, wardings_v, warding_name);
    
    cut_locations = [for(i=[.240:0.1563:1.1783]) i*25.4];
    depth_table = [for(i=[0.337:-0.015:0.187]) i*25.4];
    heights = key_code_to_heights(bitting, depth_table);

    difference() {
        if($children == 0) {
            key_blank(outline_points,
                      warding_points,
                      outline_paths=outline_paths,
                      //engrave_right_points=engrave_points,
                      //engrave_right_paths=engrave_paths,
                      //engrave_left_points=engrave_points,
                      //engrave_left_paths=engrave_paths,
                      offset=offset,
                      plug_diameter=12.7);
        } else {
            children(0);
        }
        key_bitting(heights, cut_locations, .7874);
    }
}

// Defaults
bitting="";
outline="5-pin";
warding="TE2";
gainsborough_classic(bitting, outline, warding);
