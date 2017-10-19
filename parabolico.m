function [retval] = parabolico (input1, input2)

  x1= sum(power(m(:,1),4));
  x2= sum(power(m(:,1),3));
  x3= sum(power(m(:,1),2));
  
  y1= sum(power(m(:,1),3));
  y2= sum(power(m(:,1),2));
  y3= sum(m(:,1));
  
  z1= sum(power(m(:,1),2));
  z2= sum(m(:,1));
  y2= length(m(:,1));
  
  aux= power(m(:,1),2);
  s1= sum(aux.*m(:,2));
  s2= sum(m(:,1).*m(:,2));
  s3= sum(m(:,2));
  
  A= [x1,y1,z1;x2,y2,z2;x3,y3,z3];
  B= [s1;s2;s3];
  
  retval= inv(A)*B;

endfunction
