clear all;
close all;
1;

function tabla_resultados = newton_raphson_f(semilla,cantidad_interaciones)
  tabla = [];
  x_ant = semilla;
  for n=1:cantidad_interaciones
    #Calcula termino n+1
    x_sig = x_ant - (f(x_ant)/f_diff(x_ant));
    
    #Calcula error absoluto y relativo
    E = abs(x_sig - x_ant);
    Er = E/abs(x_sig);
    
    #Guarda datos en la tabla
    tabla(n,:) = [n-1 x_ant x_sig E Er 0];
    
    #Calcula orden de convergencia
    if n >=3
      tabla(n,6) = (log(tabla(n,4))-log(tabla(n-1,4)) )./( log(tabla(n-1,4))-log(tabla(n-2,4)) );
    endif
    
    x_ant = x_sig;
  endfor
  tabla_resultados = tabla;
endfunction

function res = graficar_rectas_tangentes(datos,rango,intervalo)
  hold on;
  for i=1:rango
    #Define datos para graficar recta tangente
    x = datos(i,2);
    m = f_diff(x);
    b = (-1)*m*x + f(x);
    
    #Grafica recta tangente y vertical en interseccion de abscisa y tangente
    plot([x x],[f(x) 0]);
    plot(intervalo,m*intervalo + b');
  endfor
  hold off;
endfunction

function x_sig = f(x_ant)
  x_sig = (x_ant.^3) - x_ant - 4;
endfunction

function x_sig = f_diff(x_ant)
  x_sig = 3*(x_ant.^2) - 1;
endfunction

#Valores iniciales
cantidad_de_iteraciones = 4;
semilla = 2;

#Grafica la funcion f(x)
x = -2:0.1:5;
plot(x,f(x));

tabla_resultados = newton_raphson_f(semilla, cantidad_de_iteraciones);
graficar_rectas_tangentes(tabla_resultados,cantidad_de_iteraciones,x);

#Muestra tabla con resultados
disp('------------------------------------------------------------');
disp('     iter    |   x   |  f(x)   |    E    |    Er   |    p');
disp('------------------------------------------------------------');
disp(tabla_resultados);
disp('------------------------------------------------------------');
disp('Fin del Programa.');
