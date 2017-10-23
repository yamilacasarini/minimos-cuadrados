function [retval] = trunc (m, dec)
   d = power(10,str2double(dec));
   retornito =  round(m.* d)./ d
   retval = retornito;
     
endfunction
