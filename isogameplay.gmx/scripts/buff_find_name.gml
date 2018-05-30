///buff_find_name(id, name);

var arg_id = argument0;
var arg_name = argument1;

with (arg_id)
{
    var list_size = ds_list_size(buff_list);
    for (var i = 0; i < list_size; i++)
    {
        var buff_current = buff_list[| i];
        if (buff_current[| BUFF.NAME] == arg_name)
        {
            return buff_current;
        }
    }
}
return noone;
