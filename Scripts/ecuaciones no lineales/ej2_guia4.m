clear all;
close all;
1;

function res = f(x)
  res = ((x.^2)./4) - sin(x);
endfunction

disp(regula_falsi(@f,1.5,2,[],4));

