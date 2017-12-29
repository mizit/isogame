///layer_cell_create(name);

enum LAYER
{
    NAME = 0,
    GRID = 1
}

var l_name = argument0;

var l_cell = ds_list_create();
l_cell[| LAYER.NAME] = l_name;
l_cell[| LAYER.GRID] = ds_grid_create(TMAPSIZE, TMAPSIZE);
ds_grid_set_region(l_cell[| LAYER.GRID], 0, 0, TMAPSIZE, TMAPSIZE, noone);
return l_cell;
