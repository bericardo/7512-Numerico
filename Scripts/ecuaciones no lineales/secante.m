function res = secante(f,a,b,tolerancia)
  err_abs = b-a;
  tabla_solucion = [1 a b err_abs 0];
  i = 2;
  while abs(err_abs) > tolerancia
    fa = f(a);
    fb = f(b);
    x = b - (fb.*((b-a)./(fb-fa)));
    a = b;
    b = x;
    if (i > 1)
      err_abs = abs(x - tabla_solucion(i-1,3));
    endif
    tabla_solucion(i,:) = [i a b err_abs 0];
    if (i-1 >= 2)
      nominador = log(tabla_solucion(i,4))-log(tabla_solucion(i-1,4));
      denominador = log(tabla_solucion(i-1,4)) - log(tabla_solucion(i-2,4));
      tabla_solucion(i,5) = nominador./denominador;;
    endif
    i += 1;
  endwhile
  res = tabla_solucion;
endfunction
