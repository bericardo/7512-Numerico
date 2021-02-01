function res = simpson(f,lim_inf,lim_sup,h)
  datos = crear_tabla(@f,lim_inf,lim_sup,h);
  N = columns(datos);
  suma_pares = 0;
  suma_impares = 0;
  f_a = datos(2,1);
  f_b = datos(2,N);
  
  for i=2:round((N-2)./2)
    suma_pares += datos(2,2*i-1);
  endfor
  
  for i=1:round((N-2)./2)
    suma_impares += datos(2,2*i);
  endfor
  
  res = ((h/3).*(f_a + f_b + (2.*suma_pares) + (4.*suma_impares)));
endfunction
