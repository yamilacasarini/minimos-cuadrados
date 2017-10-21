function [retval] = casteoValores (raw)
  
  m= [];
  spliteado= strsplit(raw{2},";");
  
  for i=1:length(spliteado)
  
    aux = strsplit(spliteado{i},",");
    a1 = substr(aux{1},2);
    a2 = substr(aux{2},-1);
    
    m = [m;a1,a2];    
  endfor
  
  retval= m;
endfunction
