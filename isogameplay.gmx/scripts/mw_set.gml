///mw_set(SKILL);

if (argument0 < SKILL.HEAL)
{
    obj_gg.weapon_script = mw_get_script(argument0);
}
else
{
    obj_gg.magick_script = mw_get_script(argument0);
}
