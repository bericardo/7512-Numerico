clear all;
close all;
1;

function x_sig =  g(x_ant)
  x_sig = x_ant - sin(x_ant) + (sqrt(x_ant)/2);
endfunction

function tabla = punto_fijo_tol(semilla,tol)
  x_ant = semilla;
  x_sig = g(semilla);
  E = abs(x_sig - x_ant);
  Er = E/abs(x_sig);
  
  sol = [];
  sol(1,:) = [0 x_ant x_sig E Er 0]; 
  sol(2,6) = 0;
  n=2;
  
  while tol < Er
    x_ant = sol(n-1,3);
    x_sig = g(x_ant);
    E = abs(x_sig - x_ant);
    Er = E/abs(x_sig);
    
    sol(n,1) = n-1;
    sol(n,2) = x_ant;
    sol(n,3) = x_sig;
    sol(n,4) = E;
    sol(n,5) = Er;
    
    if n >= 3
      E_k = sol(n-1,4);
      E_k_next = E;
      E_k_prev = sol(n-2,4);
      p = (log(E_k_next) - log(E_k) )/(log(E_k) - log(E_k_prev));
      sol(n,6) = p;
    endif
    n += 1;
  endwhile
  tabla = sol;
endfunction

function tabla = punto_fijo_iter(semilla,nro_iter)
  x_ant = semilla;
  x_sig = g(semilla);
  E = abs(x_sig - x_ant);
  Er = E/abs(x_sig);
  
  sol = [];
  sol(1,:) = [0 x_ant x_sig E Er 0];
  sol(2,6) = 0;

  for n=2:nro_iter+1
    x_ant = sol(n-1,3);
    x_sig = g(x_ant);
    E = abs(x_sig - x_ant);
    Er = E/abs(x_sig);
    
    sol(n,1) = n-1;
    sol(n,2) = x_ant;
    sol(n,3) = x_sig;
    sol(n,4) = E;
    sol(n,5) = Er;
    
    if n >= 3
      E_k = sol(n-1,4);
      E_k_next = E;
      E_k_prev = sol(n-2,4);
      p = (log(E_k_next) - log(E_k) )/(log(E_k) - log(E_k_prev));
      sol(n,6) = p;
    endif
  endfor
  tabla = sol;
endfunction

resultados = punto_fijo_iter(1,10);

disp('------------------------------------------------------------');
disp('     iter    |   x   |  f(x)   |    E    |    Er   |    p');
disp('------------------------------------------------------------');
disp(resultados);
disp('------------------------------------------------------------');
disp('Fin del Programa.');
