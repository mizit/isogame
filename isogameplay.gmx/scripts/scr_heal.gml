///scr_heal();

if (obj_gg.magick > 0) && (obj_gg.hp < obj_gg.hp_max)
{
    obj_gg.magick--;
    hp_add(1);
}
