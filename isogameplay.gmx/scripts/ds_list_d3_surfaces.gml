///ds_list_d3_surfaces(id);

var l_list = argument0;

for (var i = 0; i < ds_list_size(l_list); i++)
{
    var A = l_list[| i];
    surface_clear(A.surf);
    surface_set_target(A.surf);
    draw_sprite(A.sprite_index, A.image_index, A.sprite_xoffset, A.sprite_yoffset);
    surface_reset_target();
}

for (var i = 0; i < ds_list_size(l_list); i++)
{
    for (var j = 0; j < ds_list_size(l_list); j++)
    {
        var A = l_list[| i];
        var B = l_list[| j];
        if ((A.gx + A.length) <= B.gx) || ((A.gy + A.width) <= B.gy) || ((A.gz + A.height) <= B.gz)
        {
            var ax, bx, ay, by;
            ax = get_2d_x(A);
            bx = get_2d_x(B);
            ay = get_2d_y(A);
            by = get_2d_y(B);
            if (!surface_exists(A.surf))
            {
                A.surf = surface_create(A.sprite_width, A.sprite_height);
            }
            if (!surface_exists(B.surf))
            {
                B.surf = surface_create(B.sprite_width, B.sprite_height);
            }
            surface_set_target(A.surf);
            draw_set_blend_mode(bm_subtract);
            draw_surface(B.surf, bx - ax, by - ay);
            //draw_set_colour(c_black);
            //draw_rectangle(0, 0, 20, 20, 0);
            draw_set_blend_mode(bm_normal);
            surface_reset_target();
            
            surface_set_target(A.area_surf);
            draw_set_blend_mode(bm_subtract);
            draw_surface(B.surf, bx - ax - 1, by - ay + 1);
            draw_set_blend_mode(bm_normal);
            surface_reset_target();
        }
    }
}
