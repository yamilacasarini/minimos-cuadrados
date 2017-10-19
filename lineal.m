
function [retval] = lineal (m)

  x1= sum(power(m(:,1),2));
  x2= sum(m(:,1));
  
  y1= x2;
  y2= length(m(:,1));
  
  z1= sum(m(:,1).*m(:,2));
  z2= sum(m(:,2));
  
  A= [x1,y1;x2,y2];
  B= [z1;z2];
  
  retval= inv(A)*B;
  
  
endfunction