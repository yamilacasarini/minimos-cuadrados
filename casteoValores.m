function [retval] = casteoValores (raw)
  
  spliteado= strsplit(raw{2},{";","(",")"});  
   m= [];
   
  for i=2:length(spliteado)-1
  
    aux = strsplit(spliteado{i},",");
    a1 = str2double(aux{1});
    a2 = str2double(aux{2});
    
    m = [m;a1,a2];
  endfor
 
  retval= m;
endfunction
