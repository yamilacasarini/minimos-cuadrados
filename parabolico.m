function [retval] = parabolico (m)

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
  
  p= inv(A)*B;
  
  a= p(1);
  b= p(2);
  c= p(3);
  
  f= c+(a*m(:,1))+(b*power(m(:,1),2));
  error= sum(m(:,2)'-f);

  retval= [error,p',f'];

endfunction
