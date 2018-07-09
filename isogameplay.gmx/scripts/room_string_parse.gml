///room_string_parse(string);

var arg_str = argument0;

room_x = 0;
room_y = 0;
for (var i = 0; i < 4; i++)
{
    room_x = room_x * 10 + real(string_char_at(arg_str, i + 1));
    room_y = room_y * 10 + real(string_char_at(arg_str, i + 6));
}
