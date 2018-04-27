///buff_create(name, start_effect, effect, sprite, time, flag);

enum BUFF
{
    NAME = 0,
    START_EFFECT = 1,
    EFFECT = 2,
    SPRITE = 3,
    BASE_TIME = 4,
    TIME = 5,
    FLAG = 6
}

enum BUFF_FLAG
{
    POSITIVE = 1,
    UNIQUE = 2
}

var l_buff = ds_list_create();
l_buff[| BUFF.NAME] = argument0;
l_buff[| BUFF.START_EFFECT] = argument1;
l_buff[| BUFF.EFFECT] = argument2;
l_buff[| BUFF.SPRITE] = argument3;
l_buff[| BUFF.BASE_TIME] = argument4;
l_buff[| BUFF.TIME] = argument4;
l_buff[| BUFF.FLAG] = argument5;

return l_buff;
