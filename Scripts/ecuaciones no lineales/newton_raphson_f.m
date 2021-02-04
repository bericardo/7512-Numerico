function tabla_resultados = newton_raphson_f(f,f_diff,semilla,cantidad_interaciones)
  tabla = [];
  x_ant = semilla;
  for n=1:cantidad_interaciones
    x_sig = x_ant - (f(x_ant)/f_diff(x_ant));
    error_abs = abs(x_sig - x_ant);
    error_rel = error_abs/abs(x_sig);
    tabla(n,:) = [n-1 x_ant x_sig error_abs error_rel 0];
    if n >=3
      tabla(n,6) = (log(tabla(n,4))-log(tabla(n-1,4)))./(log(tabla(n-1,4))-log(tabla(n-2,4)));
    endif
    x_ant = x_sig;
  endfor
  tabla_resultados = tabla;
endfunction