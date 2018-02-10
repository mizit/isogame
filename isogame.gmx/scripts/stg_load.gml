///stg_load();
instance_destroy(obj_stg_place);
instance_destroy(obj_stg_place_plane);

var file = file_text_open_read("strategy.sav");
var num = file_text_read_real(file);
for (var i = 0; i < num; i++)
{
    var lx = file_text_read_real(file);
    var ly = file_text_read_real(file);
    with (obj_stg_general)
    {
        var tmp = instance_create(room_width / 2 + (lx - stg_null_point) * stepx,
        room_height / 2 + (ly - stg_null_point) * stepy, obj_stg_place);
        tmp.stg_x = lx;
        tmp.stg_y = ly;
    }
}
file_text_close(file);
