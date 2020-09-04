function res = simpson(f,lim_inf,lim_sup,h,datos)
  datos = crear_tabla(@f,lim_inf,lim_sup,h);
  dimension = columns(datos);
  suma_pares = 0;
  suma_impares = 0;
  f_a = datos(2,1);
  f_b = datos(2,dimension);
  
  % Sumatoria de pares
  for i=2:round((dimension-2)./2)
    suma_pares += datos(2,2*i-1); # En realidad 2*i-1 es siempre impar pero esto se debe a que el indice de octave comienza en 1 y el de los ejercicios de la guia comienzan en 0.
  endfor
  
  % Sumatoria de impares
  for i=1:round((dimension-2)./2)
    suma_impares += datos(2,2*i); # Como en el caso anterior 2*i es par siempre pero esto se debe a que los indices de octave y nuestros ejercicios empiezan diferente.
  endfor
  
  res = ((h/3).*(f_a + f_b + (2.*suma_pares) + (4.*suma_impares)));
endfunction
