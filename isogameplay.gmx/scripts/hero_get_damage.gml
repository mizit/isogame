///hero_get_damage(dmg);

var arg_dmg = argument0;

if (buff_find_name(obj_gg, "undestructible") == noone)
{
    with (obj_gg)
    {
        hp = max(0, hp - arg_dmg);
        var buff_undestructible = buff_create("undestructible", noone, noone, s_buff_indestructible, 15, BUFF_FLAG.UNIQUE);
        ds_list_add(buff_list, buff_undestructible);
        if (hp <= 0)
        {
            //hero dies
        }
    }
}
