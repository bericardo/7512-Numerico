close all;
clear all;
1;

function y = f(x)
  y = (x.^(3))-(9.*x.^(2))+(24*x)-20;
endfunction

function y = f_diff(x)
  y = (3.*x.^(2))-(18.*x)+24;
endfunction

function y = f_diff2(x)
  y = (6.*x)-18;
endfunction

semilla = 1.5;

disp('NEWTON-RAPHSON')
disp(newton_raphson_f(@f,@f_diff,semilla,9));

disp('')

disp('NEWTON-RAPHSON RAICES MULTIPLES')
disp(newton_raphson_rm(@f,@f_diff,@f_diff2,semilla,3))