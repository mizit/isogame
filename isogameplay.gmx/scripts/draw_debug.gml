///draw_debug(obj);

var arg_obj = argument0;

if (is_decor(arg_obj))
{
    var lx, ly, rx, ry;
    lx = obj_general.d3_x + (arg_obj.gx - arg_obj.gy) * TCELLSIZETOX - arg_obj.sprite_xoffset;
    ly = obj_general.d3_y + (arg_obj.gx + arg_obj.gy) * TCELLSIZETOZ / 2 - arg_obj.sprite_yoffset;
    rx = lx + arg_obj.sprite_width;
    ry = ly + arg_obj.sprite_height;
    draw_rectangle(lx, ly, rx, ry, 1);
    return 0;
}
var fbx, fby, ftx, fty;

fbx = obj_general.d3_x + (arg_obj.gx - arg_obj.gy) * TCELLSIZETOX + (arg_obj.length - arg_obj.width) * TCELLSIZETOX;
fby = obj_general.d3_y + (arg_obj.gx + arg_obj.gy) * TCELLSIZETOZ / 2 - arg_obj.gz * TCELLHIGHT +
    (arg_obj.width + arg_obj.length - 2) * TCELLSIZETOZ / 2;
            
ftx = fbx;
fty = fby - TCELLHIGHT * arg_obj.height;
        
var lbx, lby, ltx, lty;
lbx = fbx - TCELLSIZETOX * arg_obj.length;
ltx = lbx;
lby = fby - arg_obj.length * TCELLSIZETOZ / 2;
lty = lby - TCELLHIGHT * arg_obj.height;
        
var rbx, rby, rtx, rty;
rbx = fbx + TCELLSIZETOX * arg_obj.width;
rtx = rbx;
rby = fby - arg_obj.width * TCELLSIZETOZ / 2;
rty = rby - TCELLHIGHT * arg_obj.height;
        
var btx, bty;
btx = ftx + (arg_obj.width - arg_obj.length) * TCELLSIZETOX;
bty = fty - (arg_obj.width + arg_obj.length) * TCELLSIZETOZ / 2;
        
draw_line(fbx, fby, ftx, fty);
draw_line(lbx, lby, ltx, lty);
draw_line(fbx, fby, lbx, lby);
draw_line(ltx, lty, ftx, fty);
draw_line(rbx, rby, rtx, rty);
draw_line(fbx, fby, rbx, rby);
draw_line(rtx, rty, ftx, fty);
draw_line(ltx, lty, btx, bty);
draw_line(rtx, rty, btx, bty);
