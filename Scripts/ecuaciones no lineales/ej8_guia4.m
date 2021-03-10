clear all;
close all;
1;

function x_sig = f(x_ant)
  x_sig = 1.5 - log(1 + (x_ant.^2));
endfunction

function x_sig = f_diff(x_ant)
  x_sig = - (2.*x_ant) ./ (1 + (x_ant.^2));
endfunction

function x_sig = f_diff2(x_ant)
  x_sig = ( 2*(1+(x_ant.^2)) - (4.*x_ant) )./((1+(x_ant.^2)).^2);
endfunction

cant_iter = 10;
semilla = 0.5;
x = 0:0.1:5;

tabla_soluciones = newton_raphson_f(@f,@f_diff,semilla, cant_iter);

plot(x,f(x));
graficar_rectas_tangentes(@f,@f_diff,tabla_soluciones,x);

disp('------------------------------------------------------------');
disp('     iter    |   x   |  f(x)   | err_abs | err_rel |   p');
disp('------------------------------------------------------------');
disp(tabla_soluciones);
disp('------------------------------------------------------------');
disp('Fin del Programa.');