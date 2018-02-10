///stg_save();

var file = file_text_open_write("strategy.sav");

var num = instance_number(obj_stg_place);
file_text_write_real(file, num);
file_text_writeln(file);
for (var i = 0; i < num; i++)
{
    var tmp = instance_find(obj_stg_place, i);
    file_text_write_real(file, tmp.stg_x);
    file_text_write_real(file, tmp.stg_y);
}
file_text_close(file);
