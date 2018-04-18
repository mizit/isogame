///cube_collision(id_cube, id_bullet);

var l_cube = argument0;
var l_bullet = argument1;

var l_x1, l_x2, l_y1, l_y2, l_z1, l_z2;
var l_b_length, l_b_width;

switch (l_bullet.my_dir)
{
    case DIRECTION.RIGHT:
    l_x1 = l_bullet.gx + l_bullet.length / 2 - l_bullet.gspeed / 2;
    l_y1 = l_bullet.gy + l_bullet.width / 2;
    l_b_length = l_bullet.length + l_bullet.gspeed;
    l_b_width = l_bullet.width;
    break;
    case DIRECTION.LEFT:
    l_x1 = l_bullet.gx + l_bullet.length / 2 + l_bullet.gspeed / 2;
    l_y1 = l_bullet.gy + l_bullet.width / 2;
    l_b_length = l_bullet.length + l_bullet.gspeed;
    l_b_width = l_bullet.width;
    break;
    case DIRECTION.UP:
    l_x1 = l_bullet.gx + l_bullet.length / 2;
    l_y1 = l_bullet.gy + l_bullet.width / 2 + l_bullet.gspeed / 2;
    l_b_length = l_bullet.length;
    l_b_width = l_bullet.width + l_bullet.gspeed;
    break;
    case DIRECTION.DOWN:
    l_x1 = l_bullet.gx + l_bullet.length / 2;
    l_y1 = l_bullet.gy + l_bullet.width / 2 - l_bullet.gspeed / 2;
    l_b_length = l_bullet.length;
    l_b_width = l_bullet.width + l_bullet.gspeed;
    break;
}

l_z1 = l_bullet.gz + l_bullet.height / 2;
l_x2 = l_cube.gx + l_cube.length / 2;
l_y2 = l_cube.gy + l_cube.width / 2;
l_z2 = l_cube.gz + l_cube.height / 2;

if (abs(l_x2 - l_x1) < ((l_b_length + l_cube.length) / 2)) &&
    (abs(l_y2 - l_y1) < ((l_b_width + l_cube.width) / 2)) &&
    (abs(l_z2 - l_z1) < ((l_bullet.height + l_cube.height) / 2))
{
    return true;
}
return false;
