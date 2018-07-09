///door_auto_set();

var l_top_list = noone;
var l_bottom_list = noone;
var l_left_list = noone;
var l_right_list = noone;

if (file_exists(string(room_x - 1) + "x" + string(room_y)))
{
    l_bottom_list = door_sorted_list(door_sort_bottom);
}
if (file_exists(string(room_x + 1) + "x" + string(room_y)))
{
    l_top_list = door_sorted_list(door_sort_top);
}
if (file_exists(string(room_x) + "x" + string(room_y - 1)))
{
    l_left_list = door_sorted_list(door_sort_left);
}
if (file_exists(string(room_x) + "x" + string(room_y + 1)))
{
    l_right_list = door_sorted_list(door_sort_right);
}

if (l_bottom_list)
{
    var l_dr = l_bottom_list[| 0];
    l_dr.goal = string(room_x - 1) + "x" + string(room_y);
    ds_list_delete_value(l_top_list, l_dr);
    ds_list_delete_value(l_left_list, l_dr);
    ds_list_delete_value(l_right_list, l_dr);
    ds_list_destroy(l_bottom_list);
}
if (l_top_list)
{
    var l_dr = l_top_list[| 0];
    l_dr.goal = string(room_x + 1) + "x" + string(room_y);
    ds_list_delete_value(l_left_list, l_dr);
    ds_list_delete_value(l_right_list, l_dr);
    ds_list_destroy(l_top_list);
}
if (l_left_list)
{
    var l_dr = l_left_list[| 0];
    l_dr.goal = string(room_x) + "x" + string(room_y - 1);
    ds_list_delete_value(l_right_list, l_dr);
    ds_list_destroy(l_left_list);
}
if (l_right_list)
{
    var l_dr = l_right_list[| 0];
    l_dr.goal = string(room_x) + "x" + string(room_y + 1);
    ds_list_destroy(l_right_list);
}

