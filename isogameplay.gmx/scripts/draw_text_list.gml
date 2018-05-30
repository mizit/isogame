///draw_text_list(x, y, delta_y, ...);
//retval y

if (argument_count < 4)
{
    show_message("Error in draw_text_list. There is not enough arguments!");
    return 0;
}

var arg_x = argument[0];
var arg_y = argument[1];
var arg_delta_y = argument[2];

for (var i = 3; i < argument_count; i++)
{
    draw_text(arg_x, arg_y, argument[i]);
    arg_y += arg_delta_y;
}
return arg_y;
