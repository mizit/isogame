///push_3d(id, dx, dy, dz);

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
            var minx = 10000;
            for (var i = 0; i < instance_number(obj_physical); i++)
            {
                var tmp = instance_find(obj_physical, i);
                if (tmp != id) && (tmp != other)
                {
                    if (cube_collision(id, tmp))
                    {
                        check_collision = 1;
                        if (object_is_ancestor(tmp.object_index, obj_move))
                        {
                            if (push_3d(tmp, l_dx, 0, 0) & RET.X)
                            {
                                l_retval |= RET.X;
                            }
                            else
                            {
                                //minx = min(minx, gap_of_x(id, tmp));
                                cling_of_x(id, tmp);
                                //gx = oldx;
                                //break;
                            }
                        }
                        else
                        {
                            //minx = min(minx, gap_of_x(id, tmp));
                            cling_of_x(id, tmp);
                            //gx = oldx;
                            //break;
                        }
                    }
                }
            }
            if (!check_collision)
            {
                l_retval |= RET.X;
            }
            /*else
            {
                gx += minx;
            }*/
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
                if (tmp != id) && (tmp != other)
                {
                    if (cube_collision(id, tmp))
                    {
                        check_collision = 1;
                        if (object_is_ancestor(tmp.object_index, obj_move))
                        {
                            if (push_3d(tmp, 0, l_dy, 0) & RET.Y)
                            {
                                l_retval |= RET.Y;
                            }
                            else
                            {
                                cling_of_y(id, tmp);
                                //gy = oldy;
                                //break;
                            }
                        }
                        else
                        {
                            cling_of_y(id, tmp);
                            //gy = oldy;
                            //break;
                        }
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
                if (tmp != id) && (tmp != other)
                {
                    if (cube_collision(id, tmp))
                    {
                        check_collision = 1;
                        if (object_is_ancestor(tmp.object_index, obj_move))
                        {
                            if (push_3d(tmp, 0, 0, l_dz) & RET.Z)
                            {
                                l_retval |= RET.Z;
                            }
                            else
                            {
                                gz = oldz;
                                break;
                            }
                        }
                        else
                        {
                            gz = oldz;
                            break;
                        }
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
