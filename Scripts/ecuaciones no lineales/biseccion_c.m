function tabla_soluciones = biseccion_c(f,a,b,cant_iter,sol,nro_iter=0)
  # f funcion f
  # a,b numeros que representan el intervalo [a,b]
  # cant_iter numero entero que representa la cantidad de iteraciones que se realizan
  # sol matriz vacia en la que se guardara la solucion
  # nro_iter numero de iteracion (que no es necesario pasar por parametro en esta funcion)
  #
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