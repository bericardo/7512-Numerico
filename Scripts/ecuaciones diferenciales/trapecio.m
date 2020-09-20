function res = trapecio(f,lim_inf,lim_sup,h)
% Calcula aproximacion de una integral utilizando el metodo del trapecio
%
% datos es la tabla que tiene 2 filas y n columnas con los datos. Donde la primera 
% fila son los x y la segunda son los f(x)
% lim_inf es el limite inferior de la integral
% lim_sup es el limite superior de la integral
% h es el paso de discretizacion
%
% Devuelve la aproximacion calculada
  datos = crear_tabla(@f,lim_inf,lim_sup,h);
  dimension = columns(datos);
  
  # Evaluacion en los extremos
  f_a = datos(2,1);
  f_b = datos(2,dimension);
  
  # Calcula la sumatoria
  suma = 0;
  for i=2:dimension-1
    suma += datos(2,i);
  endfor
  
  res = (h./2).*(f_a + f_b + (2.*suma));
endfunction

