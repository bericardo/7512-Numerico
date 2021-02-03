function tabla_soluciones = biseccion_t(f,a,b,tolerancia,sol,nro_iter=0)
  # f funcion f
  # a,b numeros que representan el intervalo [a,b]
  # tolerancia la tolerancia con la que se quiere el resultado
  # sol matriz vacia en la que se guardara la solucion
  # nro_iter numero de iteracion (que no es necesario pasar por parametro en esta funcion)
  #
  # Devuelve tabla cuyas columnas representan iteracion|a|b|m|error absoluto de m
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