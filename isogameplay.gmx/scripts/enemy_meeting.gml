///enemy_meeting();
//return obj_enemy if meet it

for (var i = 0; i < instance_number(obj_enemy); i++)
{
    var tmp = instance_find(obj_enemy, i);
    if (cube_meeting(gx, gy, gz - 0.1, tmp))
    {
        return tmp;
    }
    if (cube_meeting(gx, gy, gz + 0.1, tmp))
    {
        return tmp;
    }
}
return noone;
