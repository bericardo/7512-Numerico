clear all;
close all;
1;

#f(x)
function x_sig = f(x_ant)
  x_sig = 1.5 - log(1 + (x_ant.^2));
endfunction
#f'(x)
function x_sig = f_diff(x_ant)
  x_sig = - (2.*x_ant) ./ (1 + (x_ant.^2));
endfunction

#f''(x) - Usada para newton-raphson raices multiples
function x_sig = f_diff2(x_ant)
  x_sig = ( 2*(1+(x_ant.^2)) - (4.*x_ant) )./((1+(x_ant.^2)).^2);
endfunction

#Newton-Raphson Raices Multiples o Newton-Raphson Modificado
function tabla_resultados = newton_raphson_rm(semilla,cantidad_interaciones)
  tabla = [];
  x_ant = semilla;
  
  for n=1:cantidad_interaciones
    #Formula de Newton-Raphson Raices Multiples
    x_sig = x_ant - ( f(x_ant)*f_diff(x_ant) )./( ((f_diff(x_ant)).^2)-(f(x_ant).*f_diff2(x_ant)) );
    
    #Error absoluto y relativo
    error_abs = abs(x_sig - x_ant);
    error_rel = error_abs/abs(x_sig);
    
    tabla(n,:) = [n-1 x_ant x_sig error_abs error_rel 0];
    
    #Calcula orden de convergencia p
    if n >=3
      E_k = tabla(n-1,4);
      E_k_next = tabla(n,4);
      E_k_prev = tabla(n-2,4);
      tabla(n,6) = (log(E_k_next)-log(E_k))./(log(E_k)-log(E_k_prev));
    endif
    x_ant = x_sig;
  endfor
  tabla_resultados = tabla;
endfunction

#Newton-Raphson original
function tabla_resultados = newton_raphson_f(semilla,cantidad_interaciones)
  tabla = [];
  x_ant = semilla;
  
  for n=1:cantidad_interaciones
    #Formula de Newton-Raphson
    x_sig = x_ant - (f(x_ant)/f_diff(x_ant));

    error_abs = abs(x_sig - x_ant);
    error_rel = error_abs/abs(x_sig);
    
    tabla(n,:) = [n-1 x_ant x_sig error_abs error_rel 0];
    
    if n >=3
      E_k = tabla(n-1,4);
      E_k_next = tabla(n,4);
      E_k_prev = tabla(n-2,4);
      tabla(n,6) = (log(E_k_next)-log(E_k))./(log(E_k)-log(E_k_prev));
    endif
    x_ant = x_sig;
  endfor
  tabla_resultados = tabla;
endfunction

function res = graficar_rectas_tangentes(datos,rango,z)
  hold on;
  for i=1:rango
    #Datos de recta tangente y = mx + b
    x = datos(i,2);
    m = f_diff(x);
    b = (-1)*m*x + f(x)
    
    #Grafica rectas tangentes
    plot([x x],[f(x) 0]); #Traza recta vertical donde corta la tangente con abscisa
    plot(z,m*z + b);
  endfor
  hold off;
endfunction

#Datos
cant_iter = 10;
semilla = 0.5;
x = 0:0.1:5;

tabla_soluciones = newton_raphson_f(semilla, cant_iter);

#Graficador de funcion f(x) y rectas tangentes a la misma
plot(x,f(x));
graficar_rectas_tangentes(tabla_soluciones,cant_iter,x);

#Muestra tabla con soluciones por consola
disp('------------------------------------------------------------');
disp('     iter    |   x   |  f(x)   | err_abs | err_rel |   p');
disp('------------------------------------------------------------');
disp(tabla_soluciones);
disp('------------------------------------------------------------');
disp('Fin del Programa.');
