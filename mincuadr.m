function [retval] = mincuadr ()
  
  prompt = {'Cantidad de decimales','Por favor ingrese los datos de la forma (x1,y1);...;(xn,yn)'};
  defaults = {'2',''};
  rowscols = [1;1.10];
  
  opc_menu_ppal=0;
  opc_submenu=0;
  opc_menu_aprox=0;
  m=[];
  x1 = [-20:1:20];
   
  while opc_menu_ppal~=3
      opc_menu_ppal = menu('Bienvenido', '1- Ingresar Datos', '2- Comparar aproximaciones', '3- Salir'); 
    switch opc_menu_ppal
      case 1
        opc_submenu=0;
        
        while(true)
        raw = inputdlg (prompt,'Ingreso de datos', rowscols, defaults); 
        m= casteoValores(raw);
        if length(m(:,1))<2
           msgbox('Hay infinitas curvas para aproximar un unico punto. Por favor ingrese 2 o mas puntos');
        else
            break;
        end    
        end
        
        dec = raw{1};
    
        while opc_submenu~=6    
          opc_submenu = menu('Seleccione metodo de aproximacion', '1- Lineal', '2- Parabola', '3- Expotencial', '4- Potencial', '5- Hiperbolico', 'Menu Principal');
        
         switch opc_submenu
            case 1
              resul = lineal(m,dec);
              opc_menu_aprox=0;
              
              while opc_menu_aprox~=4
                opc_menu_aprox = menu('Seleccione una opcion', '1- Mostrar funcion aproximante', '2- Mostrar detalle', '3- Mostrar grafico', 'Volver atras');
                switch opc_menu_aprox
                  case 1
                    funcion = strcat('p(x)= ', num2str(resul(2)), '*x + ', num2str(resul(3)));
                    msgbox(funcion);
                  case 2
                    tablasum(m,dec,1);
                  case 3
                    x0= m(:,1);
                    y0= m(:,2);
                    y1= resul(3)+(resul(2)*x1);
                    y1= trunc(y1,dec);
                    graficar(x0,y0,x1,y1,' Lineal');
                end
              end
              
            case 2
                resul = parabolico(m,dec);
                opc_menu_aprox=0;
                
                while opc_menu_aprox~=4
                  opc_menu_aprox = menu('Seleccione una opcion', '1- Mostrar funcion aproximante', '2- Mostrar detalle', '3- Mostrar grafico', 'Volver atras');
                switch opc_menu_aprox
                  case 1
                    funcion = strcat('p(x)= ', num2str(resul(2)), '*x^2 + ', num2str(resul(3)), 'x + ', int2str(resul(4)));
                    msgbox(funcion);
                  case 2
                    tablasum(m,dec,5);
                  case 3
                    x0= m(:,1);
                    y0= m(:,2);
                    y1= resul(4)+(resul(2)*x1)+(resul(3)*power(x1,2));
                    y1= trunc(y1,dec);
                    graficar(x0,y0,x1,y1,' Parabolica');
                end
            end
               
            case 3
                resul = expotencial(m,dec);
                opc_menu_aprox=0;
                
                while opc_menu_aprox~=4
                  opc_menu_aprox = menu('Seleccione una opcion', '1- Mostrar funcion aproximante', '2- Mostrar detalle', '3- Mostrar grafico', 'Volver atras');
                switch opc_menu_aprox
                  case 1
                    funcion = strcat('p(x)= ', num2str(resul(3)), '*e^(', num2str(resul(2)), 'x)');
                    msgbox(funcion);
                  case 2
                    tablasum(m,dec,2);
                  case 3
                    x0= m(:,1);
                    y0= m(:,2);
                    y1= resul(3)*exp(resul(2)*x1);
                    y1= trunc(y1,dec);
                    graficar(x0,y0,x1,y1,' Expotencial');
                end
            end
                
             case 4
                resul = potencial(m,dec);
                opc_menu_aprox=0;
                
                 while opc_menu_aprox~=4
                   opc_menu_aprox = menu('Seleccione una opcion', '1- Mostrar funcion aproximante', '2- Mostrar detalle', '3- Mostrar grafico', 'Volver atras');
                switch opc_menu_aprox
                  case 1
                    funcion = strcat('p(x)= ' , num2str(resul(3)), '*x^', num2str(resul(2)));
                    msgbox(funcion);
                  case 2
                    tablasum(m,dec,3);
                  case 3
                    x0= m(:,1);
                    y0= m(:,2);
                    y1= resul(3)*power(x1,resul(2));
                    y1= trunc(y1,dec);
                    graficar(x0,y0,x1,y1,' Potencial');
                end
            end
               case 5
                resul = hiperbola(m,dec);
                opc_menu_aprox=0;
                
                while opc_menu_aprox~=4
                    opc_menu_aprox = menu('Seleccione una opcion', '1- Mostrar funcion aproximante', '2- Mostrar detalle', '3- Mostrar grafico', 'Volver atras');
                switch opc_menu_aprox
                  case 1
                    funcion = strcat('p(x)= ', num2str(resul(2)), '/(', num2str(resul(3)), ' + x)');
                    msgbox(funcion);
                  case 2
                    tablasum(m,dec,4);
                  case 3
                    x0= m(:,1);
                    y0= m(:,2);
                    y1= resul(2)/(resul(3)+x1');
                    y1= trunc(y1,dec);
                    graficar(x0,y0,x1,y1,' Hiperbolica');
                end
            end
         end
        end
        case 2
            
            if isempty(m)
                msgbox('Por favor, ingrese los datos');
            else
                tablaerr(m,dec);
            end    
         
end
  
        
end
 


end