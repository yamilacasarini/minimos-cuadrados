function [retval] = mincuadr (m)

  
#Inicializo variables para pedir datos despues
 prompt = {"Cantidad de decimaleaaas","Por favor ingrese los datos de la forma (x1,y1);...;(xn,yn)"};
 defaults = {"2",""};
 rowscols = [1;1.10];

 raw = inputdlg (prompt,"Ingreso de datos", rowscols, defaults); 
 
 m= casteoValores(raw);
 
    
  retval = lineal(m);
endfunction
