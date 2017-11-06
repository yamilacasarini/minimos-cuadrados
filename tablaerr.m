function [ retval ] = tablaerr(m,dec)

    opc = menuerr();
    m = trunc(m,dec);
    resul = [m(:,1)',0;m(:,2)',0];
    columns = {'Xi','Yi'};
    index_column = 3;
    
    if ismember(1,opc)
       ret = lineal(m,dec);
       f= ret(3)+(ret(2)*m(:,1)); 
       err_unit = m(:,2)-f;  
       resul = [resul;err_unit',ret(1)];
       columns{1,index_column} = 'Lineal';
       index_column = index_column + 1;
    end
    
     if ismember(2,opc)
       ret = potencial(m,dec);    
       f= ret(3)*power(m(:,1),ret(2));
       err_unit = m(:,2)-f ;
       resul = [resul;err_unit',ret(1)];
       columns{1,index_column} = 'Potencial';
       index_column = index_column + 1;
     end
    
     if ismember(3,opc)
       ret = expotencial(m,dec);
       f = ret(3)*exp(ret(2)*m(:,1));
       err_unit = m(:,2)-f;  
       resul = [resul;err_unit',ret(1)];
       columns{1,index_column} = 'Expotencial';
       index_column = index_column + 1;
     end
     
     if ismember(4,opc)
       ret = hiperbola(m,dec);
       f= ret(2)/(ret(3)+m(:,1));
       err_unit = m(:,2)-f';  
       resul = [resul;err_unit',ret(1)];
       columns{1,index_column} = 'Hiperbola';
       index_column = index_column + 1;
     end
     
     if ismember(5,opc)
       ret = parabolico(m,dec);
       f= ret(4)+(ret(2)*m(:,1))+(ret(3)*power(m(:,1),2));
       err_unit = m(:,2)-f;  
       resul = [resul;err_unit',ret(1)];
       columns{1,index_column} = 'Parabolico';
       index_column = index_column + 1;
     end
     
     resul = trunc(resul',dec);
     
     uitable('Data',resul,'ColumnName',columns);
     
     [Lia,Locb] = ismember(min(abs(resul(end,3:end))),abs(resul(end,3:end)));
     min_err = strcat('El modelo con error minimo es el ', columns{1,Locb+2},' con un error de ', num2str(min(abs(resul(end,3:end)))));
     
     msgbox(min_err);
     
     
end

