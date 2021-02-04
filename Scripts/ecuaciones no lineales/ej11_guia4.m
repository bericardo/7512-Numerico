close all;
clear all;
1;

function res = f(x)
  res = x.^(4) - 14.564.*x + 16.804;
endfunction

function res = f_diff(x)
  res = 4.*x.^(3) - 14.564;
endfunction

newton_raphson_f(@f,@f_diff,1.4,20)
