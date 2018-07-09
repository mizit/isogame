///draw_map_doors(tile);

var arg_tile = argument0;

if (!instance_exists(obj_map))
{
    show_message("Map doesn't exists!");
    return 0;
}
var l_map = instance_find(obj_map, 0);

draw_set_color(arg_tile[| MAP_TILE.COLOUR]);
var base_coord = 2000;
var drawing_x = l_map.center_x + (- arg_tile[| MAP_TILE.X] + arg_tile[| MAP_TILE.Y]) * TCELLSIZETOX * l_map.scale;
var drawing_y = l_map.center_y + (base_coord * 2 - arg_tile[| MAP_TILE.Y] - arg_tile[| MAP_TILE.X]) * TCELLSIZETOZ / 2 * l_map.scale;
var drawing_sprite = s_map_portal;
//show_message(arg_tile[| MAP_TILE.WAYS]);
if (arg_tile[| MAP_TILE.WAYS] & WAYS.DOWN)
{
    //show_message(arg_tile[| MAP_TILE.WAYS]);
    //show_message(arg_tile[| MAP_TILE.WAYS] & WAYS.UP);
    draw_sprite_ext(drawing_sprite, -1,
    drawing_x + TCELLSIZETOX / 2 * l_map.scale,
    drawing_y - TCELLSIZETOZ * 3 / 4 * l_map.scale,
    l_map.scale, l_map.scale, 0, c_white, 1);
}
if (arg_tile[| MAP_TILE.WAYS] & WAYS.UP)
{
    draw_sprite_ext(drawing_sprite, -1,
    drawing_x - TCELLSIZETOX / 2 * l_map.scale,
    drawing_y - TCELLSIZETOZ / 4 * l_map.scale,
    l_map.scale, l_map.scale, 0, c_white, 1);
}
if (arg_tile[| MAP_TILE.WAYS] & WAYS.LEFT)
{
    draw_sprite_ext(drawing_sprite, -1,
    drawing_x + TCELLSIZETOX / 2 * l_map.scale,
    drawing_y - TCELLSIZETOZ / 4 * l_map.scale,
    l_map.scale, l_map.scale, 0, c_white, 1);
}
if (arg_tile[| MAP_TILE.WAYS] & WAYS.RIGHT)
{
    draw_sprite_ext(drawing_sprite, -1,
    drawing_x - TCELLSIZETOX / 2 * l_map.scale,
    drawing_y - TCELLSIZETOZ * 3 / 4 * l_map.scale,
    l_map.scale, l_map.scale, 0, c_white, 1);
}
