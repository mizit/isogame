///cling_of_x(clinger, goal);

var l_obj1 = argument0;
var l_obj2 = argument1;

if (l_obj1.gx < l_obj2.gx)
{
    l_obj1.gx = l_obj2.gx - l_obj1.length;
}
else
{
    l_obj1.gx = l_obj2.gx + l_obj2.length;
}
