function resultado = regula_falsi(f,a,b,solucion,iter)
  # f funcion f
  # a,b es el intervalo [a,b]
  # solucion matriz vacia en la que se guarda la solucion
  # iter numero de iteraciones que se quiere realizar
  #
  # Devuleve tabla cuyas columnas representan numero de iteracion, a, b, f(a),f(b)
  # c, f(c), error absoluto
  fa = f(a);
  fb = f(b);
  c = b-(fb.*((b-a)./(fb-fa)));
  fc = f(c);
  solucion = [0 a b fa fb c fc 0];
  
  for i=2:iter
    if (fa * fc > 0)
      a = c;
    else
      b = c;
    endif
    
    fa = f(a);
    fb = f(b);
    c = b-(fb.*((b-a)./(fb-fa)));
    fc = f(c);
    solucion(i,:) = [i-1 a b fa fb c fc 0];
    
    if rows(solucion) > 1
      solucion(i,8) = solucion(i,6)-solucion(i-1,6);  
    endif
  endfor
  resultado = solucion;
endfunction
