function [retval] = potencial (input1, input2)

  x1= sum(power(log(m(:,1)),2));
  x2= sum(log(m(:,1)));
  
  y1= x2;
  y2= length(m(:,1));
  
  z1= sum(log(m(:,2)).*log(m(:,1));
  z2= sum(log(m(:,2)));
  
  A= [x1,y1;x2,y2];
  B= [z1;z2];
  
  p= inv(A)*B;
  
  retval= [p(1), exp(p(2))];

endfunction
