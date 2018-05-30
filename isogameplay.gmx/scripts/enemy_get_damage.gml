///enemy_get_damage(id, dmg);

var arg_enemy = argument0;
var arg_dmg = argument1;

with (arg_enemy)
{
    hp = max(0, hp - arg_dmg);
    if (hp <= 0)
    {
         state |= ENEMY_FLAG.DEAD;
    }
}

