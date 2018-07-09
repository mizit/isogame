///draw_map_tile_coord(x, y, scale);

var arg_x = argument0;
var arg_y = argument1;
var arg_scale = argument2;

draw_primitive_begin(pr_trianglestrip);
draw_vertex(arg_x - TCELLSIZETOX * arg_scale, arg_y - TCELLSIZETOZ / 2 * arg_scale);
draw_vertex(arg_x, arg_y);
draw_vertex(arg_x, arg_y - TCELLSIZETOZ * arg_scale);
draw_vertex(arg_x + TCELLSIZETOX * arg_scale, arg_y - TCELLSIZETOZ / 2 * arg_scale);
draw_primitive_end();

var l_col = draw_get_colour();
var l_border_width = 1;
draw_set_color(c_aqua);
draw_line_width(
arg_x - TCELLSIZETOX * arg_scale, 
arg_y - TCELLSIZETOZ / 2 * arg_scale, 
arg_x, 
arg_y - TCELLSIZETOZ * arg_scale, l_border_width * scale);
draw_line_width(
arg_x, 
arg_y - TCELLSIZETOZ * arg_scale, 
arg_x + TCELLSIZETOX * arg_scale, 
arg_y - TCELLSIZETOZ / 2 * arg_scale, l_border_width * scale);
draw_line_width(
arg_x + TCELLSIZETOX * arg_scale, 
arg_y - TCELLSIZETOZ / 2 * arg_scale,
arg_x, 
arg_y, l_border_width * scale);
draw_line_width(
arg_x, 
arg_y, 
arg_x - TCELLSIZETOX * arg_scale, 
arg_y - TCELLSIZETOZ / 2 * arg_scale, l_border_width * scale);
draw_set_color(l_col);
