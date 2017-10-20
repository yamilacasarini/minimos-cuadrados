function [retval] = hiperbola (m)


  x1= sum(power(m(:,1),2));
  x2= sum(log(m(:,1)));
  
  y1= x2;
  y2= length(m(:,1));
  
  z1= sum(power(m(:,2),-1).*m(:,1));
  z2= sum(power(m(:,2),-1));
  
  A= [x1,y1;x2,y2];
  B= [z1;z2];
  
  p= inv(A)*B;
  
  a= power(p(1),-1);
  b= p(2)/p(1);
  
  f= a/(b+m(:,1));
  error= sum(m(:,2)'-f);

  retval= [error,p',f];

endfunction
