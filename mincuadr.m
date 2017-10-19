function [retval] = mincuadr (m)

 p= expotencial(m);
  
  printf("p(x)=");
  
  n=1; 
  for i=1:n+1
  printf("%+fx^%d", p(i), n+1-i);
  endfor

endfunction
