x = [4.0 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8 7.1];
y = [102.56 113.18 130.11 142.05 167.53 195.14 224.87 256.73 299.50 326.72];

function res = f (x)
  res = 24.*(e.^(0.373.*x));
endfunction

#Calcula error cuadratico
function sum = sumatoria (feval, x, y, n=1)
  if (n == columns (x))
    sum = ( feval(x(n)) - y(n) ).^2;
  else
    sum = ( feval(x(n)) - y(n) ).^2 + suma (feval, x, y, n+1);
  endif
endfunction

#Muestra resultado
disp ('ERROR CUADRATICO');
disp (sumatoria (@f, x, y));
