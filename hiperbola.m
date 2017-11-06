function [retval] = hiperbola (matrix,dec)

  m= trunc(matrix,dec);
    
  x1= sum(power(m(:,1),2));
  x2= sum(m(:,1));
  
  y1= x2;
  y2= length(m(:,1));
  
  z1= sum(power(m(:,2),-1).*m(:,1));
  z2= sum(power(m(:,2),-1));
  
  A= [x1,y1;x2,y2];
  B= [z1;z2];
  
  A= trunc(A,dec);
  B= trunc(B,dec);
  
  p= inv(A)*B;
  
  p= trunc(p,dec);
    
  a= power(p(1),-1);
  b= p(2)/p(1);
  
  coef= [a,b];
  f= a/(b+m(:,1));
  f= trunc(f,dec);
  error= sum(m(:,2)'-f);
  
  error= trunc(error,dec);
  coef= trunc(coef, dec);
  
  retval= [error,coef,f];

end
