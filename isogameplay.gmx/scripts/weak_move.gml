///weak_move(id, dx, dy, dz);

var l_obj = argument0;
var l_dx = argument1;
var l_dy = argument2;
var l_dz = argument3;

var l_retval = 0;       //return 1 if x-push is possible, 2 if y-push, 3 if all push, if not - 0

with (l_obj)
{
    var oldx, oldy, oldz;
    oldx = gx;
    oldy = gy;
    oldz = gz;
    if (l_dx != 0)
    {
        gx += l_dx;
        if ((gx < 0) || (gx > TMAPSIZE - 1))
        {
            gx = oldx;
        }
        else
        {
            var check_collision = 0;
            for (var i = 0; i < instance_number(obj_physical); i++)
            {
                var tmp = instance_find(obj_physical, i);
                if (tmp != id)
                {
                    if (cube_collision(id, tmp))
                    {
                        check_collision = 1;
                        gx = oldx;
                        break;
                    }
                }
            }
            if (!check_collision)
            {
                l_retval |= RET.X;
            }
        }
    }
    else
    {
        l_retval |= RET.X;
    }
    if (l_dy != 0)
    {
        gy += l_dy;
        if ((gy < 0) || (gy > TMAPSIZE - 1))
        {
            gy = oldy;
        }
        else
        {
            var check_collision = 0;
            for (var i = 0; i < instance_number(obj_physical); i++)
            {
                var tmp = instance_find(obj_physical, i);
                if (tmp != id)
                {
                    if (cube_collision(id, tmp))
                    {
                        check_collision = 1;
                        gy = oldy;
                        break;
                    }
                }
            }
            if (!check_collision)
            {
                l_retval |= RET.Y;
            }
        }
    }
    else
    {
        l_retval |= RET.Y;
    }
    if (l_dz != 0)
    {
        gz += l_dz;
        if (gz < 0)
        {
            gz = oldz;
        }
        else
        {
            var check_collision = 0;
            for (var i = 0; i < instance_number(obj_physical); i++)
            {
                var tmp = instance_find(obj_physical, i);
                if (tmp != id)
                {
                    if (cube_collision(id, tmp))
                    {
                        check_collision = 1;
                        gz = oldz;
                        break;
                    }
                }
            }
            if (!check_collision)
            {
                l_retval |= RET.Z;
            }
        }
    }
    else
    {
        l_retval |= RET.Z;
    }
}
return l_retval;
