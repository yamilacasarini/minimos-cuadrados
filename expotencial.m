function [retval] = expotencial (matrix,dec)

   m= trunc(matrix,dec);
  
  x1= sum(power(m(:,1),2));
  x2= sum(m(:,1));
  
  y1= x2;
  y2= length(m(:,1));
  
  z1= sum(log(m(:,2)).*m(:,1));
  z2= sum(log(m(:,2)));
  
  A= [x1,y1;x2,y2];
  B= [z1;z2];
  
  A= trunc(A,dec);
  B= trunc(B,dec);
  
  p= inv(A)*B;
  
  p= trunc(p,dec);
   
  a= trunc(p(1),dec);
  b= trunc(exp(p(2)),dec);
  
  coef= [a,b];
  
  f= b*exp(a*m(:,1));
  f= trunc(f,dec);
  
  error= sum(m(:,2)-f);
  error= trunc(error,dec);
  
  retval= [error,coef,f'];
   
end
