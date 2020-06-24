clear all;
close all;
1;

function y = f(x)
  y = ((x.^2) / 4) - sin(x);
endfunction

function nro_iteraciones = biseccion_t(a,b,tolerancia)
  m = (a+b)/2;
  f_a = 0; #f(a)
  f_b = 0; #f(b)
  err_abs = (b-a)/2;
  iteracion = 0;
  
  while (err_abs > tolerancia)
    m = abs(a+b)/2;
    f_a = f(a);
    f_b = f(b);
    
    if(f_a*f_b < 0)
      b = m;
    else
      a = m;
    endif
    
    err_abs = abs(b-a)/2;
    iteracion += 1;
  endwhile
  nro_iteraciones=iteracion;
endfunction

function nro_iteraciones = biseccion_c(a,b,cantidad_iteraciones)
  f_a=0;
  f_b=0;
  for i=1:cantidad_iteraciones
      m = abs(a+b)/2;
      f_a = f(a);
      f_b = f(m);
      
      if(f_a*f_b < 0)
        b = m;
      else
        a = m;
      endif
  endfor
  nro_iteraciones = m;
endfunction
