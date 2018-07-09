///hero_appearing(id);

var arg_hero = argument0;

switch hero_appears
{
    case DIRECTION.UP:
    {
        var l_portal = obj_portal_up;
        if (instance_number(l_portal) > 0)
        {
            arg_hero.gx = l_portal.gx;
            arg_hero.gy = l_portal.gy + 1;
            arg_hero.gz = l_portal.gz;
            return 1;
        }
        break;
    }
    case DIRECTION.DOWN:
    {
        var l_portal = obj_portal_down;
        if (instance_number(l_portal) > 0)
        {
            arg_hero.gx = l_portal.gx;
            arg_hero.gy = l_portal.gy - 1;
            arg_hero.gz = l_portal.gz;
            return 1;
        }
        break;
    }
    case DIRECTION.LEFT:
    {
        var l_portal = obj_portal_left;
        if (instance_number(l_portal) > 0)
        {
            arg_hero.gx = l_portal.gx + 1;
            arg_hero.gy = l_portal.gy;
            arg_hero.gz = l_portal.gz;
            return 1;
        }
        break;
    }
    case DIRECTION.RIGHT:
    {
        var l_portal = obj_portal_right;
        if (instance_number(l_portal) > 0)
        {
            arg_hero.gx = l_portal.gx - 1;
            arg_hero.gy = l_portal.gy;
            arg_hero.gz = l_portal.gz;
            return 1;
        }
        break;
    }
    default:
    {
        arg_hero.gx = 5;
        arg_hero.gy = 6;
        arg_hero.gz = 6;
        return 0;
    }
}
