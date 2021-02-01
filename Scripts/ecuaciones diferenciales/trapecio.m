function res = trapecio(f,lim_inf,lim_sup,h)
  datos = crear_tabla(@f,lim_inf,lim_sup,h);
  N = columns(datos);
  suma = 0;
  for i=2:N-1
    suma += datos(2,i);
  endfor
  res = (h./2).*(datos(2,1) + datos(2,N) + (2.*suma));
endfunction

