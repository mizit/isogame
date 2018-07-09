///global_map_load();
//ATTENTION - this fuction is returning a list

if (! file_exists("strategy.sav"))
{
    return noone;
}

//open global file, and create first list of rooms
var l_file = file_text_open_read("strategy.sav");
var l_map_size = file_text_read_real(l_file);

var map_list = ds_list_create();

for (var map_ind = 0; map_ind < l_map_size; map_ind++)
{
    map_list[| map_ind] = map_tile_create(file_text_read_real(l_file),
    file_text_read_real(l_file));
}

file_text_close(l_file);

//looking for doors in every room
for (var map_ind = 0; map_ind < l_map_size; map_ind++)
{
    var l_map = map_list[| map_ind];
    var l_file = file_text_open_read(string(l_map[| MAP_TILE.X]) + "x" +
    string(l_map[| MAP_TILE.Y]));
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
            if (object_is_ancestor(l_obj, obj_portal_up) || (l_obj == obj_portal_up))
            {
                l_map[| MAP_TILE.WAYS] |= WAYS.UP;
            }
            if (object_is_ancestor(l_obj, obj_portal_down) || (l_obj == obj_portal_down))
            {
                l_map[| MAP_TILE.WAYS] |= WAYS.DOWN;
            }
            if (object_is_ancestor(l_obj, obj_portal_right) || (l_obj == obj_portal_right))
            {
                l_map[| MAP_TILE.WAYS] |= WAYS.RIGHT;
            }
            if (object_is_ancestor(l_obj, obj_portal_left) || (l_obj == obj_portal_left))
            {
                l_map[| MAP_TILE.WAYS] |= WAYS.LEFT;
            }
        }
    }
    file_text_close(l_file);
}
return map_list;
