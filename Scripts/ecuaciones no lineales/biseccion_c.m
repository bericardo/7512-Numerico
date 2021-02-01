function tabla_soluciones = biseccion_c(f,a,b,cant_iter,sol,nro_iter=0)
  # Devuelve tabla cuyas columnas representan iteracion|a|b|m|error absoluto de m
  m = (a+b)/2;
  error_abs = abs((b-a)/2);
  sol(nro_iter+1,:) = [nro_iter a b m error_abs];
  
  if (cant_iter ~= nro_iter)
    if (f(a)*f(m) < 0)
      sol = biseccion_c(@f,a,m,cant_iter,sol,nro_iter+1);
    else
      sol = biseccion_c(@f,m,b,cant_iter,sol,nro_iter+1);
    endif
  endif
  tabla_soluciones = sol;
endfunction