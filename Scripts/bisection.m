clear all;
close all;
1;

function y = f(x)
  y = ((x.^2) / 4) - sin(x);
endfunction

function nro_iteraciones = biseccion_t(a,b,tol,f_a=0,f_b=0,nro_iter=0)
  m = (a+b)/2;
  err_abs = abs((b-a)/2);
  f_a = f(a);
  f_b = f(m);
  
  if (err_abs > tol)
    nro_iter += 1;
    if (f_a*f_b < 0)
      nro_iter = biseccion_t(a,m,tol,f_a,f_b,nro_iter);
    else
      nro_iter = biseccion_t(m,b,tol,f_a,f_b,nro_iter);
    endif
  endif
  nro_iteraciones = nro_iter;
endfunction

function error_absoluto = biseccion_c(a,b,cant_iter,f_a=0,f_b=0,nro_iter=0)
  m = (a+b)/2;
  err_abs = abs((b-a)/2);
  f_a = f(a);
  f_b = f(m);
  
  if (cant_iter ~= nro_iter)
    nro_iter += 1;
    if (f_a*f_b < 0)
      err_abs = biseccion_c(a,m,cant_iter,f_a,f_b,nro_iter);
    else
      err_abs = biseccion_c(m,b,cant_iter,f_a,f_b,nro_iter);
    endif
  endif
  error_absoluto = err_abs;
endfunction

disp(biseccion_c(1,2,16));