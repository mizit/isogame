///ds_list_d3_sum(src1, src2, dst);

var l_src1 = argument0;
var l_src2 = argument1;
var l_dst = argument2;

ds_list_clear(l_dst);
ds_list_copy(l_dst, l_src1);
for (var i = 0; i < ds_list_size(l_src2); i++)
{
    var l_test = 0;
    var A = l_src2[| i];
    for (var j = 0; j < ds_list_size(l_dst); j++)
    {
        var B = l_dst[| j];
        if ((A.gx + A.length) <= B.gx) || ((A.gy + A.width) <= B.gy) || ((A.gz + A.height) <= B.gz)
        {
            ds_list_insert(l_dst, j, A);
            l_test = 1;
            break;
        }
    }
    if (!l_test)
    {
        ds_list_add(l_dst, A);
    }
}
