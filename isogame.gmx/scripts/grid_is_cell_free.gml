///grid_is_cell_free(x, y, z);
var l_x = argument0;
var l_y = argument1;
var l_z = argument2;

with (obj_general)
{
    if (l_z >= ds_list_size(layers_list))
    {
        return 0;
    }
    if (l_x >= TMAPSIZE) || (l_y >= TMAPSIZE)
    {
        return 0;
    }
    var l_layer = layers_list[| l_z];
    var l_grid = l_layer[| LAYER.GRID];
    if (l_grid[# l_x, l_y] == noone)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
