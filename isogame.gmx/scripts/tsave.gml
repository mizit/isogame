///tsave(fname);

if (instance_exists(obj_general))
{
    with (obj_general)
    {
        var l_file = file_text_open_write(argument0);
        file_text_write_real(l_file, ds_list_size(list_pos_obj));
        for (var i = 0; i < ds_list_size(list_pos_obj); i++)
        {
            file_text_writeln(l_file);
            file_text_write_string(l_file, object_get_name(list_pos_obj[| i]));
            file_text_writeln(l_file);
            file_text_write_real(l_file, instance_number(list_pos_obj[| i]) - 1);
            with(list_pos_obj[| i])
            {
                if (gx != noone) && (gy != noone) && (gz != noone)
                {
                    file_text_write_real(l_file, gx);
                    file_text_write_real(l_file, gy);
                    file_text_write_real(l_file, gz);
                }
            }
        }
        file_text_close(l_file);
    }
}


