clear all;
close all;
1;

function res = f(x)
  res = 2*x - e.^(-x);
endfunction

disp(secante(@f,-1,1,1e-26));