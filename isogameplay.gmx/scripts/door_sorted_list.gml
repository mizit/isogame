///door_sorted_list(scr);
//argument - compare script

var arg_scr = argument0;

var l_list = ds_list_create();
for (var i = 0; i < instance_number(obj_door_parent); i++)
{
    var l_door = instance_find(obj_door_parent, i);
    if (l_door.goal == noone)
    {
        ds_list_add(l_list, l_door);
    }
}
for (var i = 0; i < ds_list_size(l_list); i++)
{
    for (var j = 0; j < (ds_list_size(l_list) - 1); j++)
    {
        if (script_execute(arg_scr, l_list[| j], l_list[| j + 1]))
        {
            var tmp = l_list[| j];
            l_list[| j] = l_list[| j + 1];
            l_list[| j + 1] = tmp;
        } 
    }
}
return l_list;
