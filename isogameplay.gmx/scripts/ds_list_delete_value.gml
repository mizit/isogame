///ds_list_delete_value(id, value);
if (!ds_exists(argument0, ds_type_list))
    return 0;
var l_pos = ds_list_find_index(argument0, argument1);
ds_list_delete(argument0, l_pos);
