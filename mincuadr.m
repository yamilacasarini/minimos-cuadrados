function [retval] = mincuadr (m)

  pkg load control;
  pkg load signal;

#Inicializo variables para pedir datos despues
  prompt = {"Cantidad de decimaleaaas","Por favor ingrese los datos de la forma (x1,y1);...;(xn,yn)"};
  defaults = {"2",""};
  rowscols = [1;1.10];
  
  opc_menu_ppal=0;
  opc_submenu=0;
  opc_menu_aprox=0;
  m=[];
   
  while opc_menu_ppal!=3
      opc_menu_ppal = menu("Bienvenido", "1- Ingresar Datos", "2- Comparar aproximaciones", "3- Salir"); 
    switch opc_menu_ppal
      case 1
        raw = inputdlg (prompt,"Ingreso de datos", rowscols, defaults); 
        m= casteoValores(raw);
        dec = raw{1};
    
        while opc_submenu!= 6    
          opc_submenu = menu("Seleccione metodo de aproximacion", "1- Lineal", "2- Parabola", "3- Expotencial", "4- Potencial", "5- Hiperbolico\n", "Menu Principal");
        
         switch opc_submenu
            case 1
              resul = lineal(m,dec);
              opc_menu_aprox=0;
              
              while opc_menu_aprox!=4
                opc_menu_aprox = menu("Seleccione una opcion", "1- Mostrar funcion aproximante", "2- Mostrar detalle", "3- Mostrar grafico\n", "Volver atras");
                switch opc_menu_aprox
                  case 1
                    funcion = strcat("p(x)= ", num2str(resul(2)), "*x + ", num2str(resul(3)));
                    mess = msgbox(funcion);
                  case 2
                    mess = msgbox("Estamos trabajando en la tabla para su bienestar");
                  case 3
                    x= m(:,1);
                    y=resul(4:end);
                    plot(x, y);
                    xlabel("x");
                    ylabel("p(x)");
                    title ("Aproximacion lineal");
                  endswitch
              endwhile
              
            case 2
                resul = parabolico(m,dec);
                opc_menu_aprox=0;
                
                while opc_menu_aprox!=4
                  opc_menu_aprox = menu("Seleccione una opcion", "1- Mostrar funcion aproximante", "2- Mostrar detalle", "3- Mostrar grafico\n", "Volver atras");
                switch opc_menu_aprox
                  case 1
                    funcion = strcat("p(x)= ", num2str(resul(2)), "*x^2 + ", num2str(resul(3)), "x + ", int2str(resul(4)));
                    mess = msgbox(funcion);
                  case 2
                    mess = msgbox("Estamos trabajando en la tabla para su bienestar");
                  case 3
                    x= m(:,1);
                    y=resul(5:end);
                    plot(x, y);
                    xlabel("x");
                    ylabel("p(x)");
                    title("Aproximacion parabolica");
                  endswitch
              endwhile
               
            case 3
                resul = expotencial(m,dec);
                opc_menu_aprox=0;
                
                while opc_menu_aprox!=4
                  opc_menu_aprox = menu("Seleccione una opcion", "1- Mostrar funcion aproximante", "2- Mostrar detalle", "3- Mostrar grafico\n", "Volver atras");
                switch opc_menu_aprox
                  case 1
                    funcion = strcat("p(x)= ", num2str(resul(3)), "*e^(", num2str(resul(2)), "x)");
                    mess = msgbox(funcion);
                  case 2
                    mess = msgbox("Estamos trabajando en la tabla para su bienestar");
                  case 3
                    x= m(:,1);
                    y=resul(4:end);
                    plot(x, y);
                    xlabel("x");
                    ylabel("p(x)");
                    title("Aproximacion expotencial");
                  endswitch
              endwhile
                
             case 4
                resul = potencial(m,dec);
                opc_menu_aprox=0;
                
                 while opc_menu_aprox!=5
                    opc_menu_aprox = menu("Seleccione una opcion", "1- Mostrar funcion aproximante", "2- Mostrar detalle", "3- Mostrar grafico\n", "Volver atras");
                switch opc_menu_aprox
                  case 1
                    funcion = strcat("p(x)= ", num2str(resul(3)), "*x^", num2str(resul(2)));
                    mess = msgbox(funcion);
                  case 2
                    mess = msgbox("Estamos trabajando en la tabla para su bienestar");
                  case 3
                    x= m(:,1);
                    y=resul(4:end);
                    plot(x, y);
                    xlabel("x");
                    ylabel("p(x)");
                    title("Aproximacion potencial");
                  endswitch
              endwhile
               case 5
                resul = hiperbola(m,dec);
                opc_menu_aprox=0;
                
                  while opc_menu_aprox!=4
                    opc_menu_aprox = menu("Seleccione una opcion", "1- Mostrar funcion aproximante", "2- Mostrar detalle", "3- Mostrar grafico\n", "Volver atras");
                switch opc_menu_aprox
                  case 1
                    funcion = strcat("p(x)= ", num2str(resul(2)), "/(", num2str(resul(2)), " + x)");
                    mess = msgbox(funcion);
                  case 2
                    mess = msgbox("Estamos trabajando en la tabla para su bienestar");
                  case 3
                    x= m(:,1);
                    y=resul(4:end);
                    plot(x, y);
                    xlabel("x");
                    ylabel("p(x)");
                    title("Aproximacion hiperbolica");
                  endswitch
              endwhile
               endswitch
             endwhile
      endswitch
  
        
  endwhile 
 


endfunction
