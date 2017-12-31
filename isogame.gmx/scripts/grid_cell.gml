///grid_cell(x, y, z);
var l_x = argument0;
var l_y = argument1;
var l_z = argument2;

with (obj_general)
{
    var l_layer = layers_list[| l_z];
    var l_grid = l_layer[| LAYER.GRID];
    return l_grid[# l_x, l_y];
}
