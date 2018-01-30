///ds_list_d3_sort(id);

var l_list = argument0;
var test = 1;
for (var i = 0; i < ds_list_size(l_list); i++)
{
    for (var j = 1; j < ds_list_size(l_list); j++)
    {
        var B = l_list[| j - 1];
        var A = l_list[| j];
        if ((A.gx + A.length) <= B.gx) || ((A.gy + A.width) <= B.gy) || ((A.gz + A.height) <= B.gz)
        {
            l_list[| j - 1] = A;
            l_list[| j] = B;
        }
    }
}

for (var i = 0; i < ds_list_size(l_list); i++)
{
    var A = l_list[| i];
    surface_clear(A.surf);
    surface_set_target(A.surf);
    draw_sprite(A.sprite_index, -1, A.sprite_xoffset, A.sprite_yoffset);
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
            ax = -A.sprite_xoffset + lengthdir_x(A.gx * TCELLSIZE, -45) + lengthdir_y(TCELLSIZE * A.gy, 45);
            bx = -B.sprite_xoffset + lengthdir_x(B.gx * TCELLSIZE, -45) + lengthdir_y(TCELLSIZE * B.gy, 45);
            ay = -A.sprite_yoffset + (lengthdir_y(A.gy * TCELLSIZE, -45) + lengthdir_x(TCELLSIZE * A.gx, 45)) * ASPECT - A.gz * TCELLHIGHT;
            by = -B.sprite_yoffset + (lengthdir_y(B.gy * TCELLSIZE, -45) + lengthdir_x(TCELLSIZE * B.gx, 45)) * ASPECT - B.gz * TCELLHIGHT;
            surface_set_target(A.surf);
            draw_set_blend_mode(bm_subtract);
            draw_surface(B.surf, bx - ax, by - ay);
            draw_set_colour(c_black);
            //draw_rectangle(0, 0, 20, 20, 0);
            draw_set_blend_mode(bm_normal);
            surface_reset_target();
        }
    }
}
