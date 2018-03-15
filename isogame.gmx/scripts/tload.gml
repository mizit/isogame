///tload(fname);

with (obj_sqr_parent)
{
    instance_destroy();
}
instance_destroy(obj_general);
instance_create(0, 0, obj_general);

var l_file = file_text_open_read(argument0);
var l_obj_num = file_text_read_real(l_file);

for (var i = 0; i < l_obj_num; i++)
{
    file_text_readln(l_file);
    var l_obj_name = file_text_read_string(l_file);
    var l_obj = asset_get_index(l_obj_name);
    if (l_obj < 0)
    {
        return 0;
    }
    var l_ins_num = file_text_read_real(l_file);
    for (var j = 0; j < l_ins_num; j++)
    {
        var tmp = instance_create(-1000, -1000, l_obj);
        tmp.gx = file_text_read_real(l_file);
        tmp.gy = file_text_read_real(l_file);
        tmp.gz = file_text_read_real(l_file);
        if (object_is_ancestor(tmp.object_index, obj_tile_parent))
        {
            var l_layer = obj_general.layers_list[| 0];
            var l_grid = l_layer[| LAYER.GRID];
            l_grid[# tmp.gx, tmp.gy] = tmp;
            ds_list_add(obj_general.list_set_tile, tmp);
        }
        if (object_is_ancestor(tmp.object_index, obj_sqr_parent))
        {
            while(ds_list_size(obj_general.layers_list) < (tmp.gz + tmp.height))
            {
                ds_list_add(obj_general.layers_list, layer_cell_create("layer" + string(ds_list_size(obj_general.layers_list))));
            }
            for (var k = tmp.gz; k < (tmp.gz + tmp.height); k++)
            {
                var l_layer = obj_general.layers_list[| k];
                var l_grid = l_layer[| LAYER.GRID];
                ds_grid_set_region(l_grid, tmp.gx, tmp.gy, tmp.gx + tmp.length - 1, 
                tmp.gy + tmp.width - 1, tmp);
            }
            ds_list_add(obj_general.list_set_obj, tmp);
        }
        
            
    }
}
ds_list_d3_sort(obj_general.list_set_obj);
file_text_close(l_file);
