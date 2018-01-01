 if(ID_G[argument0].depth < ID_G[argument1].depth){
  if (ID_G[argument0].X1 + ID_G[argument0].a > ID_G[argument1].X1
   and ID_G[argument0].Z1 >= ID_G[argument1].Z1 + ID_G[argument1].c 
   and ID_G[argument0].Y1 < ID_G[argument1].Y1 + ID_G[argument1].b){
   PROFO(argument0,argument1);
  }else{
   if (ID_G[argument0].X1  >= ID_G[argument1].X1 + ID_G[argument1].a
    and ID_G[argument0].Z1 + ID_G[argument0].c > ID_G[argument1].Z1
    and ID_G[argument0].Y1 < ID_G[argument1].Y1 + ID_G[argument1].b){
    PROFO(argument0,argument1);
   }else{
    if (ID_G[argument0].X1 + ID_G[argument0].a > ID_G[argument1].X1
     and ID_G[argument0].Z1 + ID_G[argument0].c > ID_G[argument1].Z1
     and ID_G[argument0].Y1 + ID_G[argument0].b <= ID_G[argument1].Y1){
     PROFO(argument0,argument1);
    }
   } 
  } 
 }else{
  if(ID_G[argument0].depth > ID_G[argument1].depth){
   if (ID_G[argument0].X1 < ID_G[argument1].X1 + ID_G[argument0].a
    and ID_G[argument0].Z1 < ID_G[argument1].Z1 + ID_G[argument0].c
    and ID_G[argument0].Y1 + ID_G[argument0].b > ID_G[argument1].Y1){
    PROFO(argument0,argument1);
   }
  }
 }
 argument1 = argument1 + 1;
 if(argument1 == B1){
  argument1 = 0;
  argument0 += 1;
 } 
 if(argument0 == B1){
  argument0 = 0;
  argument1 = 0;
  exit;
 }
 DEPTH2(argument0,argument1);
