function [retval] = tablasum (m,dec,tipo)
    
    switch tipo
      case 1
        #lineal
        
        m = trunc(m,dec);
        x1= sum(power(m(:,1),2));
        x2= sum(m(:,1));
  
        y1= x2;
        y2= length(m(:,1));
  
        z1= sum(m(:,1).*m(:,2));
        z2= sum(m(:,2));
  
        retval= [trunc(x1,dec),trunc(y1,dec);trunc(x2,dec),trunc(y2,dec);trunc(z1,dec);trunc(z2,dec)];
       case 2
        #Expotencial
        
          m= trunc(matrix,dec);
  
          x1= sum(power(m(:,1),2));
          x2= sum(m(:,1));
  
          y1= x2;
          y2= length(m(:,1));
  
          z1= sum(log(m(:,2)).*m(:,1));
          z2= sum(log(m(:,2)));
  
          retval= [x1,y1;x2,y2;z1;z2];
          retval= trunc(retval,dec);
          
         case 3
          #Potencial
          
          m= trunc(matrix,dec);
  
          x1= sum(power(log(m(:,1)),2));
          x2= sum(log(m(:,1)));
  
          y1= x2;
          y2= length(m(:,1));
  
          z1= sum(log(m(:,2)).*log(m(:,1)));
          z2= sum(log(m(:,2)));
  
          retval= [x1,y1;x2,y2;z1,z2];
          retval= trunc(retval,dec);
          
         case 4
          #Hiperbolica
          
           m= trunc(matrix,dec);
    
           x1= sum(power(m(:,1),2));
           x2= sum(m(:,1));
  
           y1= x2;
           y2= length(m(:,1));
  
           z1= sum(power(m(:,2),-1).*m(:,1));
           z2= sum(power(m(:,2),-1));
  
           retval= [x1,y1;x2,y2;z1,z2];
           retval= trunc(retval,dec);
           
          case 4
            #Parabolico
            
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
  
            retval= [x1,y1,z1;x2,y2,z2;x3,y3,z3;s1,s2,s3];
            retval= trunc(retval,dec);
    endswitch
    
endfunction
