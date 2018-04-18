///cube_path_free(id);

var l_obj = argument0;

with (l_obj)
{
    for (var i = 0; i < ds_list_size(path); i++)
    {
        ds_list_destroy(path[| i]);
    }
    ds_list_clear(path);
}
