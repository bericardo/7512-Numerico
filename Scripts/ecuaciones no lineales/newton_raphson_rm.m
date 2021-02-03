# Newton-Raphson modificado (para raices multiples)
function tabla_resultados = newton_raphson_rm(f,f_diff,f_diff2,semilla,cantidad_interaciones)
  # f function f(x)
  # f_diff primera derivada de la funcion f(x)
  # f_diff2 segunda derivada de la funcion f(x)
  # semilla valor de arranque del metodo
  # cantidad_interaciones numero de iteraciones que se van a realizar
  #
  # Devuelve tabla con numero de iteracion, x, f(x), error absoluto, error relativo, orden de convergencia
  tabla = [];
  x_ant = semilla;
  
  for n=1:cantidad_interaciones
    x_sig = x_ant - ( f(x_ant)*f_diff(x_ant) )./( ((f_diff(x_ant)).^2)-(f(x_ant).*f_diff2(x_ant)) );
    
    error_abs = abs(x_sig - x_ant);
    error_rel = error_abs/abs(x_sig);
    tabla(n,:) = [n-1 x_ant x_sig error_abs error_rel 0];
    
    if n >=3
      E_k = tabla(n-1,4);
      E_k_next = tabla(n,4);
      E_k_prev = tabla(n-2,4);
      tabla(n,6) = (log(E_k_next)-log(E_k))./(log(E_k)-log(E_k_prev));
    endif
    x_ant = x_sig;
  endfor
  tabla_resultados = tabla;
endfunction