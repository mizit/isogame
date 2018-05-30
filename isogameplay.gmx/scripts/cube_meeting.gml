///cube_meeting(x, y, z, obj);
var l_cube1 = id;
var l_x = argument0;
var l_y = argument1;
var l_z = argument2;
var l_cube2 = argument3;

if !(l_cube1.physics_on && l_cube2.physics_on)
{
    return false;
}

var l_x1, l_x2, l_y1, l_y2, l_z1, l_z2;
l_x1 = l_x + l_cube1.length / 2;
l_y1 = l_y + l_cube1.width / 2;
l_z1 = l_z + l_cube1.height / 2;
l_x2 = l_cube2.gx + l_cube2.length / 2;
l_y2 = l_cube2.gy + l_cube2.width / 2;
l_z2 = l_cube2.gz + l_cube2.height / 2;

if (abs(l_x2 - l_x1) < ((l_cube1.length + l_cube2.length) / 2)) &&
    (abs(l_y2 - l_y1) < ((l_cube1.width + l_cube2.width) / 2)) &&
    (abs(l_z2 - l_z1) < ((l_cube1.height + l_cube2.height) / 2))
{
    return true;
}
return false;
