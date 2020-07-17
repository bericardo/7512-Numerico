clear all;
close all;
1;

function y = f(x)
  y = (x.^3) - (7.*(x.^2)) + (14.*x) - 6.0;
endfunction

function tabla_soluciones = biseccion_t(a,b,tolerancia,sol,nro_iter=0)
  m = (a+b)/2;
  error_abs = abs((b-a)/2);
  sol(nro_iter+1,:) = [nro_iter a b m error_abs];
  
  if (error_abs > tolerancia)
    if (f(a)*f(m) < 0)
      sol = biseccion_t(a,m,tolerancia,sol,nro_iter+1);
    else
      sol = biseccion_t(m,b,tolerancia,sol,nro_iter+1);
    endif
  endif
  tabla_soluciones = sol;
endfunction

function tabla_soluciones = biseccion_c(a,b,cant_iter,sol,nro_iter=0)
  m = (a+b)/2;
  error_abs = abs((b-a)/2);
  sol(nro_iter+1,:) = [nro_iter a b m error_abs];
  
  if (cant_iter ~= nro_iter)
    if (f(a)*f(m) < 0)
      sol = biseccion_c(a,m,cant_iter,sol,nro_iter+1);
    else
      sol = biseccion_c(m,b,cant_iter,sol,nro_iter+1);
    endif
  endif
  tabla_soluciones = sol;
endfunction

t_soluciones = [];
t_soluciones = biseccion_c(0,1,5,t_soluciones);

disp('-------------------------------------------------------');
disp('     iter  |    a    |   b     |    m     |    E')
disp('-------------------------------------------------------');
disp(t_soluciones);
disp('-------------------------------------------------------');