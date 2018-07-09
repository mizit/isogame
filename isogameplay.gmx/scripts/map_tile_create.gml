///map_tile_create(x, y);

enum MAP_TILE
{
    X = 0,
    Y = 1,
    WAYS = 2,
    COLOUR = 3
}

enum WAYS
{
    LEFT = 1,
    RIGHT = 2,
    UP = 4,
    DOWN = 8
}

var arg_x = argument0;
var arg_y = argument1;

var ans = ds_list_create();
ans[| MAP_TILE.X] = arg_x;
ans[| MAP_TILE.Y] = arg_y;
ans[| MAP_TILE.WAYS] = 0;
ans[| MAP_TILE.COLOUR] = c_red;
return ans;
