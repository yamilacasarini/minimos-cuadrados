
function [retval] = lineal (matrix,dec)
  
  m= trunc(matrix,dec);
  
  x1= sum(power(m(:,1),2));
  x2= sum(m(:,1));
  
  y1= x2;
  y2= length(m(:,1));
  
  z1= sum(m(:,1).*m(:,2));
  z2= sum(m(:,2));
  
  A= [trunc(x1,dec),trunc(y1,dec);trunc(x2,dec),trunc(y2,dec)];
  B= [trunc(z1,dec);trunc(z2,dec)];
  
  p= inv(A)*B;
  
  p= trunc(p,dec);
  
  a= trunc(p(1),dec);
  b= trunc(p(2),dec);
  f= b+(a*m(:,1));
  f=trunc(f,dec);
  
  error= sum(m(:,2)-f);
  error= trunc(error,dec);
 
  retval= [error,p',f'];
  
  
end
