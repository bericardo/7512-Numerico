clear all;
close all;
1;

function x_sig =  g(x_ant)
  x_sig = x_ant - sin(x_ant) + (sqrt(x_ant)/2);
endfunction

#Punto Fijo con una tolerancia
function tabla_soluciones = punto_fijo_tol(semilla,tol)
  x_ant = semilla;
  x_sig = g(semilla);
  
  #Error absoluto y relativo
  E = abs(x_sig - x_ant);
  Er = E/abs(x_sig);
  
  #Tabla para guardar calculos
  sol = [];
  sol(1,:) = [0 x_ant x_sig E Er 0]; 
  
  n=2; #Los nuevos valores calculados se guardan desde la fila 2 en adelante
  while tol < Er
    x_ant = sol(n-1,3);
    x_sig = g(x_ant);
    E = abs(x_sig - x_ant);
    Er = E/abs(x_sig);
    sol(n,:) = [n-1 x_ant x_sig E Er 0];
    
    #Calcula orden de convergencia p y se guarda en la tabla
    if n >= 3
      E_k = sol(n-1,4);
      E_k_next = E;
      E_k_prev = sol(n-2,4);
      p = (log(E_k_next) - log(E_k) )/(log(E_k) - log(E_k_prev));
      sol(n,6) = p;
    endif
    n += 1;
  endwhile
  tabla_soluciones = sol;
endfunction

#Punto Fijo con una cantidad de iteraciones especifica
function tabla_soluciones = punto_fijo_iter(semilla,nro_iter)
  x_ant = semilla;
  x_sig = g(semilla);
  E = abs(x_sig - x_ant);
  Er = E/abs(x_sig);
  sol = [];
  sol(1,:) = [0 x_ant x_sig E Er 0];

  for n=2:nro_iter+1
    x_ant = sol(n-1,3);
    x_sig = g(x_ant);
    E = abs(x_sig - x_ant);
    Er = E/abs(x_sig);
    sol(n,:) = [n-1 x_ant x_sig E Er 0]; 
    
    if n >= 3
      E_k = sol(n-1,4);
      E_k_next = E;
      E_k_prev = sol(n-2,4);
      p = (log(E_k_next) - log(E_k) )/(log(E_k) - log(E_k_prev));
      sol(n,6) = p;
    endif
  endfor
  tabla_soluciones = sol;
endfunction

resultados = punto_fijo_iter(1,10);

disp('------------------------------------------------------------');
disp('     iter    |   x   |  f(x)   |    E    |    Er   |    p');
disp('------------------------------------------------------------');
disp(resultados);
disp('------------------------------------------------------------');
