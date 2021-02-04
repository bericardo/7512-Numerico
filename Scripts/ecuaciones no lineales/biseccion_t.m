function tabla_soluciones = biseccion_t(f,a,b,tolerancia,sol,nro_iter=0)
  m = (a+b)/2;
  error_abs = abs((b-a)/2);
  sol(nro_iter+1,:) = [nro_iter a b m error_abs];
  if (error_abs > tolerancia)
    if (f(a)*f(m) < 0)
      sol = biseccion_t(@f,a,m,tolerancia,sol,nro_iter+1);
    else
      sol = biseccion_t(@f,m,b,tolerancia,sol,nro_iter+1);
    endif
  endif
  tabla_soluciones = sol;
endfunction