///cube_path_move();
///can be used only in obj_sqr_path ot obj_enemy

if (goal == noone)          //choosing goal at first time
{
    if (ds_list_size(path) > 0)
    {
        goal = 0;
    }
    else
    {
        exit;           //if path doesn't exist doesn't work
    }
}

//when point was arrived
var p_goal = path[| goal];
if ((gx == p_goal[| COORD.X]) && (gy == p_goal[| COORD.Y]) && (gz == p_goal[| COORD.Z]))
{
    switch (cycled)
    {
    case 1:
    if (goal < ds_list_size(path) - 1)
    {
        goal++;
    }
    else
    {
        goal = 0;
    }
    break;
    case 0:
    if (goal < ds_list_size(path) - 1)
    {
        goal++;
    }
    else
    {
        cycled = -1;
        goal--;
    }
    break;
    case 2:
    if (goal > 0)
    {
        goal--;
    }
    else
    {
        cycled = 0;
        goal++;
    }
    break;
    case 3:
    if (goal > 0)
    {
        goal--;
    }
    else
    {
        goal = ds_list_size(path) - 1;
    }
    break;
    }
}


p_goal = path[| goal];
dx = sign(p_goal[| COORD.X] - gx) * (min(gspeed, abs(p_goal[| COORD.X] - gx)));
dy = sign(p_goal[| COORD.Y] - gy) * (min(gspeed, abs(p_goal[| COORD.Y] - gy)));
dz = sign(p_goal[| COORD.Z] - gz) * (min(gspeed, abs(p_goal[| COORD.Z] - gz)));


