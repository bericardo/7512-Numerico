close all;
clear all;
1;

function resultado = f(x)
  resultado = cos(x);
endfunction

function resultado = f_diff(x)
  resultado = (-1).*sin(x);
endfunction

disp(newton_raphson_f(@f,@f_diff,1,5))
