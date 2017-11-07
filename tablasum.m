function [retval] = tablasum (m,dec,tipo)
    
    m = trunc(m,dec);
    resul = [];
    columns = '';
    switch tipo
      case 1
        %lineal
        
        for i = 1:1:length(m(:,1))
            resul = [resul;i,m(i,1),m(i,2),power(m(i,1),2),m(i,1)*m(i,2)];
            resul = trunc(resul,dec);
        end
        
        resul = [resul;length(m(:,1)),sum(m(:,1)),sum(m(:,2)),sum(power(m(:,1),2)),sum(m(:,1).*m(:,2))];
        resul = trunc(resul,dec);
        columns = {'Puntos','Xi','Yi','Xi^2','Xi*Yi'}; 
        
        
        uitable('Data',resul,'ColumnName',columns);
        
        sistemaEcuaciones = strcat(num2str(resul(end,4)),'a + ',num2str(resul(end,2)),'b = ',num2str(resul(end,5)),'.   .',num2str(resul(end,2)),'a + ',num2str(resul(end,1)),'b = ',num2str(resul(end,3)));
        msgbox(sistemaEcuaciones, 'Sistema de Ecuaciones');
        
        case 2
       %Expotencial
        
          for i = 1:1:length(m(:,1))
            resul = [resul;i,m(i,1),m(i,2),log(m(i,2)),power(m(i,1),2),log(m(i,2)).*m(i,1)];
            resul = trunc(resul,dec);
          end
          
          resul = [resul;length(m(:,1)),sum(m(:,1)),sum(m(:,2)),sum(log(m(:,2))),sum(power(m(:,1),2)),sum(log(m(:,2)).*m(:,1))];
          resul = trunc(resul,dec);
          columns = {'Puntos','Xi','Yi','Log(Yi)','Xi^2','Xi*Log(Yi)'}; 
  
          
            uitable('Data',resul,'ColumnName',columns);
        
            sistemaEcuaciones = strcat(num2str(resul(end,5)),'a + ',num2str(resul(end,2)),'b = ',num2str(resul(end,6)),'.   .',num2str(resul(end,2)),'a + ',num2str(resul(end,1)),'b = ',num2str(resul(end,3)));
            msgbox(sistemaEcuaciones, 'Sistema de Ecuaciones');
            
         case 3
          %Potencial
          
          for i = 1:1:length(m(:,1))
            resul = [resul;i,m(i,1),m(i,2),log(m(i,1)),log(m(i,2)),power(log(m(i,1)),2),log(m(i,2)).*log(m(i,1))];
            resul = trunc(resul,dec);
          end
          
          resul = [resul;length(m(:,1)),sum(m(:,1)),sum(m(:,2)),sum(log(m(:,1))),sum(log(m(:,2))),sum(power(log(m(:,1)),2)),sum(log(m(:,2)).*log(m(:,1)))];
          resul = trunc(resul,dec);
          
          columns = {'Puntos','Xi','Yi','Log(Xi)','Log(Yi)','Log(Xi)^2','Log(Xi)*Log(Yi)'}; 
          
          
          uitable('Data',resul,'ColumnName',columns);
        
          sistemaEcuaciones = strcat(num2str(resul(end,6)),'a + ',num2str(resul(end,4)),'b = ',num2str(resul(end,7)),'.   .',num2str(resul(end,4)),'a + ',num2str(resul(end,1)),'b = ',num2str(resul(end,5)));
          msgbox(sistemaEcuaciones, 'Sistema de Ecuaciones');
          
         case 4
         %Hiperbolica
         
          for i = 1:1:length(m(:,1))
            resul = [resul;i,m(i,1),m(i,2),power(m(i,2),-1),power(m(i,1),2),power(m(i,2),-1).*m(i,1)];
            resul = trunc(resul,dec);
          end
          
          resul = [resul;length(m(:,1)),sum(m(:,1)),sum(m(:,2)),sum(power(m(:,2),-1)),sum(power(m(:,1),2)),sum(power(m(:,2),-1).*m(:,1))];
          resul = trunc(resul,dec);
          
          columns = {'Puntos','Xi','Yi','1/Yi','Xi^2','Xi*1/Yi'}; 
          
          
          uitable('Data',resul,'ColumnName',columns);
        
          sistemaEcuaciones = strcat(num2str(resul(end,5)),'a + ',num2str(resul(end,2)),'b = ',num2str(resul(end,6)),'.   .',num2str(resul(end,2)),'a + ',num2str(resul(end,1)),'b = ',num2str(resul(end,4)));
          msgbox(sistemaEcuaciones, 'Sistema de Ecuaciones');
           
          case 5
           %Parabolico
            
          for i = 1:1:length(m(:,1))
            resul = [resul;i,m(i,1),m(i,2),power(m(i,2),2),power(m(i,1),3),power(m(i,2),4),m(i,2)*m(i,1),power(m(i,1),2)*m(i,2)];
            resul = trunc(resul,dec);
          end
          
          resul = [resul;length(m(:,1)),sum(m(:,1)),sum(m(:,2)),sum(power(m(:,2),2)),sum(power(m(:,2),3)),sum(power(m(:,1),4)),sum(m(:,2).*m(:,1)),sum(power(m(:,1),2).*m(:,2))];
          resul = trunc(resul,dec);
          
          columns = {'Puntos','Xi','Yi','Xi^2','Xi^3','Xi^4','Xi*Yi','Xi^2*Yi'}; 
          
          
          uitable('Data',resul,'ColumnName',columns);
        
          sistemaEcuaciones = strcat(num2str(resul(end,6)),'a + ',num2str(resul(end,5)),'b + ',num2str(resul(end,4)),'c = ',num2str(resul(end,8)),'.   .',...
              num2str(resul(end,5)),'a + ',num2str(resul(end,4)),'b + ',num2str(resul(end,2)),'c = ',num2str(resul(end,7)),'.     .',...
              num2str(resul(end,4)),'a + ',num2str(resul(end,2)),'b + ',num2str(resul(end,1)),'c = ',num2str(resul(end,3)));
          msgbox(sistemaEcuaciones, 'Sistema de Ecuaciones');
          
    end
        
end