function [retval] = mincuadr (m)

 p= lineal(m);
  
  printf("p(x)=");
  
  n=1; 
  for i=1:n+1
  printf("%+fx^%d", p(i), n+1-i);
  endfor
  
 
  plot(x,f);

endfunction
