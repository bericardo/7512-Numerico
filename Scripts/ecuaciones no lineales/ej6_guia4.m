close all;
clear all;
1;

function resultado = f(x)
  resultado = (3./(7-e.^(-2*x)))-x;
endfunction

function resultado = f_diff(x)
  resultado = -((6.*e.^(-2*x))/((7-e.^(-2*x)).^2))-1;
endfunction

# La solucion es 0.45473
disp('NEWTON-RAPHSON');
disp(newton_raphson_f(@f,@f_diff,0,4));

disp('BISECCION');
disp(biseccion_c(@f,0,1,16,[]));

disp('REGULA-FALSI');
disp(regula_falsi(@f,0,1,[],7));