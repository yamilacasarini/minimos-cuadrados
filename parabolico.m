function [retval] = parabolico (matrix,dec)

  m= trunc(matrix,dec);
   
  x1= sum(power(m(:,1),4));
  x2= sum(power(m(:,1),3));
  x3= sum(power(m(:,1),2));
  
  y1= sum(power(m(:,1),3));
  y2= sum(power(m(:,1),2));
  y3= sum(m(:,1));
  
  z1= sum(power(m(:,1),2));
  z2= sum(m(:,1));
  z3= length(m(:,1));
  
  aux= power(m(:,1),2);
  s1= sum(aux.*m(:,2));
  s2= sum(m(:,1).*m(:,2));
  s3= sum(m(:,2));
  
  A= [x1,y1,z1;x2,y2,z2;x3,y3,z3];
  B= [s1;s2;s3];
  
  A= trunc(A,dec);
  B= trunc(B,dec);
  
  p= inv(A)*B;
  
  p= trunc(p,dec);
  a= trunc(p(1),dec);
  b= trunc(p(2),dec);
  c= trunc(p(3),dec);
  
  f= c+(a*m(:,1))+(b*power(m(:,1),2));
  f= trunc(f,dec);
  
  error= sum(m(:,2)-f);
  error= trunc(error,dec);
  
  retval= [error,p',f'];

end
