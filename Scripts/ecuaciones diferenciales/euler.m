function resultado = euler(x,u,h,f)
%%Aplica el metodo de euler
% h paso de discretizacion
% x nodo de discretizacion
% f funcion derivada en el paso en el que se esta
  resultado = (u + h.*(f(x,u)));
endfunction