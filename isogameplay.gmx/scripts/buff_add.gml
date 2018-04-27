///buff_add(owner, buff);

var l_owner = argument0;
var l_buff = argument1;

if (l_buff[| BUFF.FLAG] & BUFF_FLAG.UNIQUE)
{
    for (var i = 0; i < ds_list_size(l_owner.buff_list); i++)
    {
        var tmp_buff = l_owner.buff_list[| i];
        if (tmp_buff[| BUFF.NAME] == l_buff[| BUFF.NAME])
        {
            tmp_buff[| BUFF.TIME] = tmp_buff[| BUFF.BASE_TIME];
            ds_list_destroy(l_buff);
            return 0;
        }
    }
}
var new_buff = ds_list_create();
ds_list_copy(new_buff, l_buff)
ds_list_add(l_owner.buff_list, new_buff);
if (script_exists(new_buff[| BUFF.START_EFFECT]))
{
    with (l_owner)
    {
        script_execute(new_buff[| BUFF.START_EFFECT]);
    }
}
