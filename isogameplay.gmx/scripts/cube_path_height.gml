///cube_path_height(id, height);

var l_obj = argument0;
var l_height = argument1;

cube_path_free(l_obj);
with (l_obj)
ds_list_add(path, point_3d_create(gx, gy, gz), point_3d_create(gx, gy, gz + l_height));
