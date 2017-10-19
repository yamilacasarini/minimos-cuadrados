function [retval] = expotencial (m)

  x1= sum(power(m(:,1),2));
  x2= sum(m(:,1));
  
  y1= x2;
  y2= length(m(:,1));
  
  z1= sum(log(m(:,2)).*m(:,1));
  z2= sum(log(m(:,2)));
  
  A= [x1,y1;x2,y2];
  B= [z1;z2];
  
  p= inv(A)*B;
  retval= [p(1), exp(p(2))];
  
endfunction
