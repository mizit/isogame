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
        //show_message(lengthdir_y(TMAPSIZE * d3_cell_size, ANGO));
        var l_surf = surface_create(TMAPSIZE * TCELLSIZE,
        TMAPSIZE * TCELLHIGHT);
        surface_set_target(l_surf);
        for (var i = 0; i < ds_list_size(list_set_obj); i++)
        {
            var obj = list_set_obj[| i];
            if (surface_exists(obj.surf))
            {
                draw_surface_ext(obj.surf, -obj.sprite_xoffset * d3_mult + surface_get_width(l_surf) / 2 + 
                lengthdir_x(obj.gx * d3_cell_size, -ANGO) + lengthdir_y(d3_cell_size * obj.gy, ANGO),
                -obj.sprite_yoffset * d3_mult + surface_get_height(l_surf) * 0.18 + 
                (lengthdir_y(obj.gy * d3_cell_size, -ANGO) + 
                lengthdir_x(d3_cell_size * obj.gx, ANGO)) * ASPECT - obj.gz * d3_mult * TCELLHIGHT,
                d3_mult, d3_mult, 0, c_white, 1);
            }
        }
        surface_reset_target();
        surface_save(l_surf, argument0 + ".png");
        surface_free(l_surf);
    }
}


