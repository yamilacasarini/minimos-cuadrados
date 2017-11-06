function [ retval ] = menuerr()

h.f = figure('units','pixels','position',[400,600,550,50],...
             'toolbar','none','menu','none','Name','Seleccione metodos a comparar');
         
h.c(1) = uicontrol('style','checkbox','units','pixels',...
                'position',[10,30,50,15],'string','Lineal');
h.c(2) = uicontrol('style','checkbox','units','pixels',...
                'position',[100,30,100,15],'string','Potencial');
h.c(3) = uicontrol('style','checkbox','units','pixels',...
                'position',[200,30,100,15],'string','Expotencial');
h.c(4) = uicontrol('style','checkbox','units','pixels',...
                'position',[300,30,100,15],'string','Hiperbolica'); 
h.c(5) = uicontrol('style','checkbox','units','pixels',...
                'position',[400,30,100,15],'string','Parabolica'); 
  
h.p = uicontrol('style','pushbutton','units','pixels',...
                'position',[40,5,70,20],'string','OK','callback',@(src,event) p_call(src,event,h));

%Espero hasta que se ejecute la callback
uiwait(h.f)

% Pushbutton callback
      function p_call(src, event, h)
          vals = get(h.c,'Value');
          checked = find([vals{:}]);
          if isempty(checked)
              checked = 'none';
          end
          retval = checked;
          close(h.f); 
      end 
            
end

