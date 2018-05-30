///set_shadow(sprite or noone);
var l_sprite = argument0;

if (surface_exists(shadow_surf))
{
    surface_free(shadow_surf);
}
if (surface_exists(area_surf))
{
    surface_free(area_surf);
}
if (surface_exists(area_surf_mask))
{
    surface_free(area_surf_mask);
}

if (!sprite_exists(l_sprite))
{
    shadow_ltx = 0;
    shadow_lty = 0;
    shadow_rbx = TCELLSIZETOX * (length + width);
    shadow_rby = (TCELLSIZETOZ / 2) * (length + width);
    shadow_xoffset = length * TCELLSIZETOX;
    shadow_yoffset = shadow_rby;
    
    shadow_surf = surface_create(shadow_rbx, shadow_rby);
    surface_clear(shadow_surf);
    
    surface_set_target(shadow_surf);
    draw_set_colour(c_black);
    draw_primitive_begin(pr_trianglefan);
    draw_vertex(0, width * (TCELLSIZETOZ / 2));
    draw_vertex(width * TCELLSIZETOX, 0);
    draw_vertex(shadow_rbx, length * (TCELLSIZETOZ / 2));
    draw_vertex(length * TCELLSIZETOX, shadow_rby);
    draw_primitive_end();
    surface_reset_target();
    
}
else
{
    if (l_sprite == s_noone_shadow)
    {
        shadow_ltx = 0;
        shadow_lty = 0;
        shadow_rbx = 0;
        shadow_rby = 0;
        shadow_xoffset = 0;
        shadow_yoffset = 0;
        return 0;
    }
    shadow_ltx = 0;
    shadow_lty = 0;
    shadow_rbx = sprite_get_width(l_sprite);
    shadow_rby = sprite_get_height(l_sprite);
    shadow_xoffset = sprite_get_xoffset(l_sprite);
    shadow_yoffset = sprite_get_yoffset(l_sprite);
    
    shadow_surf = surface_create(shadow_rbx, shadow_rby);
    
    surface_set_target(shadow_surf);
    draw_sprite(l_sprite, -1, shadow_xoffset, shadow_yoffset);
    surface_reset_target();
}
area_surf = surface_create(TCELLSIZETOX * (length + width), (TCELLSIZETOZ / 2) * (length + width));
area_surf_mask = surface_create(TCELLSIZETOX * (length + width), (TCELLSIZETOZ / 2) * (length + width));
surface_set_target(area_surf_mask);
draw_rectangle(0, 0, shadow_rbx, shadow_rby, 0);
draw_set_blend_mode(bm_subtract);
draw_primitive_begin(pr_trianglefan);
draw_vertex(0, width * (TCELLSIZETOZ / 2));
draw_vertex(width * TCELLSIZETOX, 0);
draw_vertex(TCELLSIZETOX * (length + width), length * (TCELLSIZETOZ / 2));
draw_vertex(length * TCELLSIZETOX, (TCELLSIZETOZ / 2) * (length + width));
draw_primitive_end();
draw_set_blend_mode(bm_normal);
surface_reset_target();
