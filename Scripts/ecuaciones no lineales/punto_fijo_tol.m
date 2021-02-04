function tabla_soluciones = punto_fijo_tol(g,semilla,tolerancia)
  x_ant = semilla;
  x_sig = g(semilla);
  
  error_abs = abs(x_sig - x_ant);
  error_rel = error_abs/abs(x_sig);
  
  sol = [];
  sol(1,:) = [0 x_ant x_sig error_abs error_rel 0]; 
  
  n=2;
  while tolerancia < error_rel
    x_ant = sol(n-1,3);
    x_sig = g(x_ant);
    
    error_abs = abs(x_sig - x_ant);
    error_rel = error_abs/abs(x_sig);
    
    sol(n,:) = [n-1 x_ant x_sig error_abs error_rel 0];
    
    if n >= 3
      E_k = sol(n-1,4);
      E_k_next = error_abs;
      E_k_prev = sol(n-2,4);
      p = (log(E_k_next) - log(E_k) )/(log(E_k) - log(E_k_prev));
      sol(n,6) = p;
    endif
    n += 1;
  endwhile
  tabla_soluciones = sol;
endfunction