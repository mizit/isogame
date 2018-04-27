///content_create(type, content);

enum CONTENT
{
    TYPE = 0,
    CONT = 1
}

var l_cont = ds_list_create();
l_cont[| CONTENT.TYPE] = argument0;
l_cont[| CONTENT.CONT] = argument1;
return l_cont;
