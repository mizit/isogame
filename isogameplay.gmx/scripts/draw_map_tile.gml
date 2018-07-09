///draw_map_tile(tile);

var arg_tile = argument0;

if (!instance_exists(obj_map))
{
    show_message("Map doesn't exists!");
    return 0;
}
var l_map = instance_find(obj_map, 0);

draw_set_color(arg_tile[| MAP_TILE.COLOUR]);
var base_coord = 2000;
var drawing_x = l_map.center_x + (arg_tile[| MAP_TILE.X] - arg_tile[| MAP_TILE.Y]) * TCELLSIZETOX * l_map.scale;
var drawing_y = l_map.center_y + (- base_coord * 2 + arg_tile[| MAP_TILE.Y] + arg_tile[| MAP_TILE.X]) * TCELLSIZETOZ / 2 * l_map.scale;
var drawing_sprite = s_portal;
draw_map_tile_coord(drawing_x, drawing_y, l_map.scale);

