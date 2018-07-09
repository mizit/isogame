///global_map_delete(id);

var arg_map = argument0;

for (var i = 0; i < ds_list_size(arg_map); i++)
{
    ds_list_destroy(arg_map[| i]);
}
ds_list_destroy(arg_map);
