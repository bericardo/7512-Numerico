function sum = error_cuadratico(feval, x, y, n=1)
  if (n == columns(x))
    sum = ( feval(x(n)) - y(n) ).^2;
  else
    sum = ( feval(x(n)) - y(n) ).^2 + error_cuadratico(feval, x, y, n+1);
  endif
endfunction
