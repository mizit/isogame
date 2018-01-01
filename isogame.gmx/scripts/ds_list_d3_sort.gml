///ds_list_d3_sort(id);

var l_list = argument0;
var test = 1;
for (var i = 0; i < ds_list_size(l_list); i++)
{
    for (var j = 1; j < ds_list_size(l_list); j++)
    {
        var B = l_list[| j - 1];
        var A = l_list[| j];
        /*if (((A.gx + A.length) < B.gx) && (A.gy <= (B.gy + B.width)) && (A.gz <= (B.gz + B.height))) ||
        ((A.gx <= (B.gx + B.length)) && ((A.gy + A.width) < B.gy) && (A.gz <= (B.gz + B.height))) ||
        ((A.gx <= (B.gx + B.length)) && (A.gy <= (B.gy + B.width)) && ((A.gz + A.height) < B.gz))
        {
            l_list[| j - 1] = B;
            l_list[| j] = A;
        }*/
        if ((A.gx + A.length) <= B.gx) || ((A.gy + A.width) <= B.gy) || ((A.gz + A.height) <= B.gz)
        {
            l_list[| j - 1] = A;
            l_list[| j] = B;
        }
    }
}
