///cling_of_y(clinger, goal);

var l_obj1 = argument0;
var l_obj2 = argument1;

if (l_obj1.gy < l_obj2.gy)
{
    l_obj1.gy = l_obj2.gy - l_obj1.width;
}
else
{
    l_obj1.gy = l_obj2.gy + l_obj2.width;
}
