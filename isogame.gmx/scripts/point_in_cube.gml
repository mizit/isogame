///point_in_cube(x, y, z, cubeid);
var l_x = argument0;
var l_y = argument1;
var l_z = argument2;
var l_cube = argument3;

if (l_x > l_cube.gx) && (l_x < l_cube.gx + l_cube.length) &&
    (l_y > l_cube.gy) && (l_y < l_cube.gy + l_cube.width) &&
    (l_z > l_cube.gz) && (l_z < l_cube.gz + l_cube.height) 
{
    return true;
}
return false;
