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
        continue;
    }
    var l_ins_num = file_text_read_real(l_file);
    for (var j = 0; j < l_ins_num; j++)
    {
        var tmp = instance_create(-1000, -1000, l_obj);
        tmp.gx = file_text_read_real(l_file);
        tmp.gy = file_text_read_real(l_file);
        tmp.gz = file_text_read_real(l_file);
        if (object_is_ancestor(tmp.object_index, obj_solid))
        {
            ds_list_add(obj_general.list_solid, tmp);
        }
        else if (object_is_ancestor(tmp.object_index, obj_move))
        {
            ds_list_add(obj_general.list_move, tmp);
        }
    }
}
ds_list_d3_sort(obj_general.list_solid);
file_text_close(l_file);
