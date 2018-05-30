///scr_knife();

if (instance_number(obj_knife) >= 3)
{
    return 0;
}
var tmp = instance_create(0, 0, obj_knife);
tmp.my_dir = obj_gg.last_direction;
switch(obj_gg.last_direction)
{
    case DIRECTION.LEFT:
    tmp.gx = obj_gg.gx;// - 1;
    tmp.gy = obj_gg.gy;
    break;
    case DIRECTION.RIGHT:
    tmp.gx = obj_gg.gx;// + 1;
    tmp.gy = obj_gg.gy;
    break;
    case DIRECTION.UP:
    tmp.gx = obj_gg.gx;
    tmp.gy = obj_gg.gy;// - 1;
    break;
    case DIRECTION.DOWN:
    tmp.gx = obj_gg.gx;
    tmp.gy = obj_gg.gy;// + 1;
    break;
}
tmp.gz = obj_gg.gz + 0.5;
ds_list_add(obj_general.list_move, tmp);
