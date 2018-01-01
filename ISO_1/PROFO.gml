//***********
/*
 TD = ID_G[I].depth;
 ID_G[I].depth = ID_G[J].depth;
 ID_G[J].depth = TD;
 TEMP = ID_G[I];
 ID_G[I] = ID_G[J];
 ID_G[J] = TEMP;
 //show_message("** DEPTH1 **##" + string(ID_G[I].NAME) + "   depth: " + string(ID_G[I].depth) + "##" + string(ID_G[J].NAME) + "   depth: " + string(ID_G[J].depth));
//STEP1();// TENERE ASSOLUTT  
*/
__arg0 = 0;
if (argument_count > 0)
    __arg0 = argument[0];
if (argument_count > 1)
    __arg1 = argument[1];

 TD = ID_G[__arg0].depth;
 ID_G[__arg0].depth = ID_G[__arg1].depth;
 ID_G[__arg1].depth = TD;
 TEMP = ID_G[__arg0];
 ID_G[__arg0] = ID_G[__arg1];
 ID_G[__arg1] = TEMP;

