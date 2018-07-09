///map_load(fname);
///call once from obj_general

var l_file = file_text_open_read(argument0);
var l_obj_num = file_text_read_real(l_file);

for (var i = 0; i < l_obj_num; i++)
{
    file_text_readln(l_file);
    var l_obj_name = file_text_read_string(l_file);
    var l_obj = asset_get_index(l_obj_name);
    if (l_obj < 0)
    {
        file_text_readln(l_file);
        l_obj_name = file_text_read_string(l_file);
        continue;
    }
    var l_ins_num = file_text_read_real(l_file);
    for (var j = 0; j < l_ins_num; j++)
    {
        var tmp = instance_create(-1000, -1000, l_obj);
        tmp.gx = file_text_read_real(l_file);
        tmp.gy = file_text_read_real(l_file);
        tmp.gz = file_text_read_real(l_file) - 1;
        if (object_is_ancestor(tmp.object_index, obj_solid) || object_is_ancestor(tmp.object_index, obj_non_physical))
        {
            ds_list_add(obj_general.list_solid, tmp);
        }
        else if (object_is_ancestor(tmp.object_index, obj_move))
        {
            ds_list_add(obj_general.list_move, tmp);
        }
        else if (object_is_ancestor(tmp.object_index, obj_tile_parent))
        {
            //ds_list_add(obj_general.list_tile, tmp);
            ds_grid_set(obj_general.floor_grid, tmp.gx, tmp.gy, tmp);
        }
        else 
        {
            ds_list_add(obj_general.list_tile, tmp);
        }
    }
}
for(var i = 0; i < TMAPSIZE; i++)
{
    for (var j = 0; j < TMAPSIZE; j++)
    {
        if(obj_general.floor_grid[#i, j] == noone)
        {
            var tmp = instance_create(0, 0, obj_invisible_wall);
            tmp.gx = i;
            tmp.gy = j;
            tmp.gz = 0;
        }
    }
}
ds_list_d3_sort(obj_general.list_solid);
//ds_list_d3_sort(obj_general.list_tile);
file_text_close(l_file);
