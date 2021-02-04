clear all;
close all;
1;

function res = f(x)
  res = ((x.^2)./4)-sin(x);
endfunction

function res = f_diff(x)
  res = (x./2)-cos(x);
endfunction

disp('SECANTE')
disp(secante(@f,1,2,0.001));
disp('')
disp('NEWTON-RAPHSON')
disp(newton_raphson_f(@f,@f_diff,1.5,5))